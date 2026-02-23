"use client";

import { useEffect, useState, useMemo } from "react";
import Link from "next/link";
import {
  adminGetReadingShortQuestions,
  adminGetReadingWordOrderQuestions,
  adminGetReadingPassages,
  adminDeleteReadingShortQuestion,
  adminDeleteReadingPassage,
  type AdminReadingShortQuestion,
  type AdminReadingWordOrderQuestion,
  type AdminReadingPassage
} from "@/lib/data/admin-db";
import { exportToCsv, type CsvColumn } from "@/lib/utils/csv-export";

const PER_PAGE = 20;
const LEVELS = ["5級", "4級", "3級", "準2級", "準2級プラス", "2級", "準1級", "1級"];
const QUESTION_TYPES = [
  { value: "short_fill", label: "短文の語句空所" },
  { value: "conversation_fill", label: "会話文の空所" }
] as const;

type TabType = "short" | "word_order" | "long_content";

export default function AdminReadingPage() {
  const [tab, setTab] = useState<TabType>("short");
  const [items, setItems] = useState<AdminReadingShortQuestion[]>([]);
  const [wordOrderItems, setWordOrderItems] = useState<AdminReadingWordOrderQuestion[]>([]);
  const [passageItems, setPassageItems] = useState<AdminReadingPassage[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState("");
  const [levelFilter, setLevelFilter] = useState("");
  const [typeFilter, setTypeFilter] = useState("");
  const [sortOrder, setSortOrder] = useState<"asc" | "desc">("desc");
  const [currentPage, setCurrentPage] = useState(1);

  const load = async () => {
    try {
      const [data, woData, passageData] = await Promise.all([
        adminGetReadingShortQuestions(),
        adminGetReadingWordOrderQuestions(),
        adminGetReadingPassages("long_content")
      ]);
      setItems(data);
      setWordOrderItems(woData);
      setPassageItems(passageData);
    } catch (e) {
      setError(e instanceof Error ? e.message : "読み込みに失敗しました");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    void load();
  }, []);

  const filteredItems = useMemo(() => {
    let list = items;
    if (levelFilter) list = list.filter((q) => q.level === levelFilter);
    if (typeFilter) list = list.filter((q) => q.question_type === typeFilter);
    if (searchQuery.trim()) {
      const q = searchQuery.trim().toLowerCase();
      list = list.filter(
        (item) =>
          item.body.toLowerCase().includes(q) ||
          String(item.id).includes(q) ||
          (item.explanation ?? "").toLowerCase().includes(q)
      );
    }
    return [...list].sort((a, b) =>
      sortOrder === "asc" ? a.id - b.id : b.id - a.id
    );
  }, [items, searchQuery, levelFilter, typeFilter, sortOrder]);

  const filteredPassageItems = useMemo(() => {
    let list = passageItems;
    if (levelFilter) list = list.filter((p) => p.level === levelFilter);
    if (searchQuery.trim()) {
      const q = searchQuery.trim().toLowerCase();
      list = list.filter(
        (p) =>
          (p.title ?? "").toLowerCase().includes(q) ||
          (p.body ?? "").toLowerCase().includes(q) ||
          String(p.id).includes(q)
      );
    }
    return [...list].sort((a, b) =>
      sortOrder === "asc" ? a.id - b.id : b.id - a.id
    );
  }, [passageItems, searchQuery, levelFilter, sortOrder]);

  const filteredWordOrderItems = useMemo(() => {
    let list = wordOrderItems;
    if (levelFilter) list = list.filter((q) => q.level === levelFilter);
    if (searchQuery.trim()) {
      const q = searchQuery.trim().toLowerCase();
      list = list.filter(
        (item) =>
          item.prompt_ja.toLowerCase().includes(q) ||
          String(item.id).includes(q) ||
          item.words.some((w) => w.toLowerCase().includes(q))
      );
    }
    return [...list].sort((a, b) =>
      sortOrder === "asc" ? a.id - b.id : b.id - a.id
    );
  }, [wordOrderItems, searchQuery, levelFilter, sortOrder]);

  const activeFilteredItems =
    tab === "short"
      ? filteredItems
      : tab === "word_order"
        ? filteredWordOrderItems
        : filteredPassageItems;
  const totalPages = Math.max(1, Math.ceil(activeFilteredItems.length / PER_PAGE));
  const paginatedItems = useMemo(() => {
    const start = (currentPage - 1) * PER_PAGE;
    return activeFilteredItems.slice(start, start + PER_PAGE);
  }, [activeFilteredItems, currentPage]);

  useEffect(() => {
    setCurrentPage(1);
  }, [searchQuery, levelFilter, typeFilter, sortOrder, tab]);

  const handleDelete = async (id: number) => {
    if (!confirm(`問題 ID ${id} を削除しますか？`)) return;
    try {
      if (tab === "long_content") {
        await adminDeleteReadingPassage(id);
      } else {
        await adminDeleteReadingShortQuestion(id);
      }
      await load();
    } catch (e) {
      alert(e instanceof Error ? e.message : "削除に失敗しました");
    }
  };

  const readingCsvColumns: CsvColumn<AdminReadingShortQuestion>[] = [
    { key: "id", label: "ID" },
    { key: "level", label: "級" },
    { key: "question_type", label: "形式" },
    { key: "body", label: "本文" },
    {
      key: "choices",
      label: "選択肢",
      format: (v) => (Array.isArray(v) ? (v as string[]).join(" | ") : String(v ?? ""))
    },
    { key: "correct_index", label: "正解インデックス" },
    { key: "explanation", label: "解説" },
    { key: "created_at", label: "作成日" }
  ];

  const handleDownloadCsv = () => {
    if (tab === "long_content") {
      const pcColumns: CsvColumn<AdminReadingPassage>[] = [
        { key: "id", label: "ID" },
        { key: "level", label: "級" },
        { key: "genre", label: "ジャンル" },
        { key: "title", label: "タイトル" },
        {
          key: "body",
          label: "本文",
          format: (v) => (typeof v === "string" ? v.slice(0, 200) + (v.length > 200 ? "…" : "") : "")
        },
        { key: "question_count", label: "設問数" }
      ];
      exportToCsv(
        `reading_long_content_${new Date().toISOString().slice(0, 10)}.csv`,
        filteredPassageItems,
        pcColumns
      );
    } else if (tab === "short") {
      exportToCsv(`reading_short_${new Date().toISOString().slice(0, 10)}.csv`, filteredItems, readingCsvColumns);
    } else {
      const woColumns: CsvColumn<AdminReadingWordOrderQuestion>[] = [
        { key: "id", label: "ID" },
        { key: "level", label: "級" },
        { key: "prompt_ja", label: "日本文" },
        {
          key: "words",
          label: "語句",
          format: (v) => (Array.isArray(v) ? (v as string[]).join(" | ") : String(v ?? ""))
        },
        {
          key: "correct_order",
          label: "正解順",
          format: (v) => (Array.isArray(v) ? (v as number[]).join(",") : String(v ?? ""))
        }
      ];
      exportToCsv(`reading_word_order_${new Date().toISOString().slice(0, 10)}.csv`, filteredWordOrderItems, woColumns);
    }
  };

  const bodyPreview = (body: string, maxLen: number) => {
    const oneLine = body.replace(/\n/g, " ");
    return oneLine.length <= maxLen ? oneLine : oneLine.slice(0, maxLen) + "…";
  };

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  if (error) {
    return (
      <p className="rounded-lg border border-red-800 bg-red-950/30 px-4 py-3 text-red-300">
        {error}
      </p>
    );
  }

  return (
    <div>
      <h1 className="mb-6 text-xl font-semibold text-slate-100">リーディング問題</h1>

      <div className="mb-4 flex gap-2 rounded-lg bg-slate-800/50 p-1">
        <button
          type="button"
          onClick={() => setTab("short")}
          className={`rounded-md px-4 py-2 text-sm font-medium ${
            tab === "short" ? "bg-slate-700 text-white" : "text-slate-400 hover:text-slate-200"
          }`}
        >
          短文・会話 ({items.length})
        </button>
        <button
          type="button"
          onClick={() => setTab("word_order")}
          className={`rounded-md px-4 py-2 text-sm font-medium ${
            tab === "word_order" ? "bg-slate-700 text-white" : "text-slate-400 hover:text-slate-200"
          }`}
        >
          語句整序 ({wordOrderItems.length})
        </button>
        <button
          type="button"
          onClick={() => setTab("long_content")}
          className={`rounded-md px-4 py-2 text-sm font-medium ${
            tab === "long_content" ? "bg-slate-700 text-white" : "text-slate-400 hover:text-slate-200"
          }`}
        >
          長文の内容一致 ({passageItems.length})
        </button>
      </div>

      <div className="mb-4 flex flex-col gap-4 sm:flex-row sm:items-center sm:flex-wrap">
        <input
          type="search"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          placeholder="本文・解説で検索"
          className="max-w-xs rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-sm text-slate-100 placeholder-slate-500 outline-none focus:border-brand-500"
        />
        <select
          value={levelFilter}
          onChange={(e) => setLevelFilter(e.target.value)}
          className="rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-sm text-slate-100 outline-none focus:border-brand-500"
        >
          <option value="">級（すべて）</option>
          {LEVELS.map((l) => (
            <option key={l} value={l}>{l}</option>
          ))}
        </select>
        {tab === "short" && (
          <select
            value={typeFilter}
            onChange={(e) => setTypeFilter(e.target.value)}
            className="rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-sm text-slate-100 outline-none focus:border-brand-500"
          >
            <option value="">形式（すべて）</option>
            {QUESTION_TYPES.map((t) => (
              <option key={t.value} value={t.value}>{t.label}</option>
            ))}
          </select>
        )}
        <div className="flex items-center gap-4">
          <p className="text-xs text-slate-500">
            {activeFilteredItems.length} 件 /{" "}
          {tab === "short" ? items.length : tab === "word_order" ? wordOrderItems.length : passageItems.length} 件
          </p>
          <button
            type="button"
            onClick={handleDownloadCsv}
            className="rounded-lg border border-slate-600 bg-slate-800 px-4 py-2 text-sm text-slate-200 hover:bg-slate-700"
          >
            CSVダウンロード（絞り込み結果）
          </button>
          {tab === "short" && (
            <Link
              href="/admin/reading/new"
              className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500"
            >
              新規登録
            </Link>
          )}
        </div>
      </div>

      <div className="overflow-x-auto rounded-lg border border-slate-700">
        <table className="w-full text-left text-sm">
          <thead className="border-b border-slate-700 bg-slate-800/50">
            <tr>
              <th className="px-4 py-3 font-medium text-slate-300">
                <button
                  type="button"
                  onClick={() => setSortOrder((o) => (o === "asc" ? "desc" : "asc"))}
                  className="flex items-center gap-1 hover:text-brand-300"
                >
                  ID
                  {sortOrder === "asc" ? (
                    <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 15l7-7 7 7" />
                    </svg>
                  ) : (
                    <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  )}
                </button>
              </th>
              <th className="px-4 py-3 font-medium text-slate-300">級</th>
              {tab === "short" && (
                <th className="px-4 py-3 font-medium text-slate-300">形式</th>
              )}
              {tab === "long_content" && (
                <th className="px-4 py-3 font-medium text-slate-300">ジャンル</th>
              )}
              <th className="px-4 py-3 font-medium text-slate-300">
                {tab === "short"
                  ? "本文（抜粋）"
                  : tab === "word_order"
                    ? "日本文（抜粋）"
                    : "タイトル（抜粋）"}
              </th>
              {tab === "word_order" && (
                <th className="px-4 py-3 font-medium text-slate-300">正解英文（抜粋）</th>
              )}
              {tab === "long_content" && (
                <th className="px-4 py-3 font-medium text-slate-300">設問数</th>
              )}
              {(tab === "short" || tab === "long_content") && (
                <th className="px-4 py-3 font-medium text-slate-300" />
              )}
            </tr>
          </thead>
          <tbody>
            {tab === "short"
              ? (paginatedItems as AdminReadingShortQuestion[]).map((q) => (
                  <tr
                    key={q.id}
                    className="border-b border-slate-800 transition hover:bg-slate-800/30"
                  >
                    <td className="px-4 py-3 font-mono text-slate-300">{q.id}</td>
                    <td className="px-4 py-3 text-slate-400">{q.level}</td>
                    <td className="px-4 py-3 text-slate-400">
                      {q.question_type === "short_fill" ? "短文" : "会話"}
                    </td>
                    <td className="max-w-md truncate px-4 py-3 text-slate-300" title={q.body}>
                      {bodyPreview(q.body, 50)}
                    </td>
                    <td className="px-4 py-3">
                      <div className="flex gap-2">
                        <Link
                          href={`/admin/reading/${q.id}`}
                          className="text-brand-400 hover:text-brand-300 hover:underline"
                        >
                          編集
                        </Link>
                        <button
                          type="button"
                          onClick={() => handleDelete(q.id)}
                          className="text-red-400 hover:text-red-300 hover:underline"
                        >
                          削除
                        </button>
                      </div>
                    </td>
                  </tr>
                ))
              : tab === "long_content"
                ? (paginatedItems as AdminReadingPassage[]).map((p) => (
                    <tr
                      key={p.id}
                      className="border-b border-slate-800 transition hover:bg-slate-800/30"
                    >
                      <td className="px-4 py-3 font-mono text-slate-300">{p.id}</td>
                      <td className="px-4 py-3 text-slate-400">{p.level}</td>
                      <td className="px-4 py-3 text-slate-400">{p.genre ?? "—"}</td>
                      <td className="max-w-md truncate px-4 py-3 text-slate-300" title={p.title ?? ""}>
                        {bodyPreview(p.title ?? "", 40)}
                      </td>
                      <td className="px-4 py-3 text-slate-400">{p.question_count}</td>
                      <td className="px-4 py-3">
                        <div className="flex gap-2">
                          <button
                            type="button"
                            onClick={() => handleDelete(p.id)}
                            className="text-red-400 hover:text-red-300 hover:underline"
                          >
                            削除
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))
                : (paginatedItems as AdminReadingWordOrderQuestion[]).map((q) => {
                  const correctSentence = q.correct_order.map((i) => q.words[i]).join(" ");
                  return (
                    <tr
                      key={q.id}
                      className="border-b border-slate-800 transition hover:bg-slate-800/30"
                    >
                      <td className="px-4 py-3 font-mono text-slate-300">{q.id}</td>
                      <td className="px-4 py-3 text-slate-400">{q.level}</td>
                      <td className="max-w-md truncate px-4 py-3 text-slate-300" title={q.prompt_ja}>
                        {bodyPreview(q.prompt_ja, 50)}
                      </td>
                      <td className="px-4 py-3 text-xs text-slate-500" title={correctSentence}>
                        {bodyPreview(correctSentence, 40)}
                      </td>
                    </tr>
                  );
                })}
          </tbody>
        </table>
      </div>

      {activeFilteredItems.length > 0 && totalPages > 1 && (
        <div className="mt-4 flex justify-center gap-2">
          <button
            type="button"
            onClick={() => setCurrentPage((p) => Math.max(1, p - 1))}
            disabled={currentPage <= 1}
            className="rounded-lg border border-slate-600 px-3 py-1.5 text-sm text-slate-300 hover:bg-slate-800 disabled:opacity-40"
          >
            前へ
          </button>
          <span className="flex items-center px-3 text-sm text-slate-400">
            {currentPage} / {totalPages}
          </span>
          <button
            type="button"
            onClick={() => setCurrentPage((p) => Math.min(totalPages, p + 1))}
            disabled={currentPage >= totalPages}
            className="rounded-lg border border-slate-600 px-3 py-1.5 text-sm text-slate-300 hover:bg-slate-800 disabled:opacity-40"
          >
            次へ
          </button>
        </div>
      )}

      {activeFilteredItems.length === 0 && (
        <p className="mt-6 text-center text-slate-500">
          {searchQuery || levelFilter || (tab === "short" && typeFilter)
            ? "検索に一致する問題はありません"
            : tab === "short"
              ? "問題が登録されていません。新規登録から追加してください。"
              : tab === "word_order"
                ? "語句整序の問題が登録されていません。"
                : "長文の内容一致が登録されていません。"}
        </p>
      )}
    </div>
  );
}
