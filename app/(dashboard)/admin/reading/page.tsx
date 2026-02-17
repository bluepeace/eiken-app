"use client";

import { useEffect, useState, useMemo } from "react";
import Link from "next/link";
import {
  adminGetReadingShortQuestions,
  adminDeleteReadingShortQuestion,
  type AdminReadingShortQuestion
} from "@/lib/data/admin-db";

const PER_PAGE = 20;
const LEVELS = ["5級", "4級", "3級", "準2級", "2級", "準1級", "1級"];
const QUESTION_TYPES = [
  { value: "short_fill", label: "短文の語句空所" },
  { value: "conversation_fill", label: "会話文の空所" }
] as const;

export default function AdminReadingPage() {
  const [items, setItems] = useState<AdminReadingShortQuestion[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState("");
  const [levelFilter, setLevelFilter] = useState("");
  const [typeFilter, setTypeFilter] = useState("");
  const [currentPage, setCurrentPage] = useState(1);

  const load = async () => {
    try {
      const data = await adminGetReadingShortQuestions();
      setItems(data);
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
    return [...list].sort((a, b) => b.id - a.id);
  }, [items, searchQuery, levelFilter, typeFilter]);

  const totalPages = Math.max(1, Math.ceil(filteredItems.length / PER_PAGE));
  const paginatedItems = useMemo(() => {
    const start = (currentPage - 1) * PER_PAGE;
    return filteredItems.slice(start, start + PER_PAGE);
  }, [filteredItems, currentPage]);

  useEffect(() => {
    setCurrentPage(1);
  }, [searchQuery, levelFilter, typeFilter]);

  const handleDelete = async (id: number) => {
    if (!confirm(`問題 ID ${id} を削除しますか？`)) return;
    try {
      await adminDeleteReadingShortQuestion(id);
      await load();
    } catch (e) {
      alert(e instanceof Error ? e.message : "削除に失敗しました");
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
      <h1 className="mb-6 text-xl font-semibold text-slate-100">リーディング問題（短文・会話）</h1>

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
        <div className="flex items-center gap-4">
          <p className="text-xs text-slate-500">
            {filteredItems.length} 件 / {items.length} 件
          </p>
          <Link
            href="/admin/reading/new"
            className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500"
          >
            新規登録
          </Link>
        </div>
      </div>

      <div className="overflow-x-auto rounded-lg border border-slate-700">
        <table className="w-full text-left text-sm">
          <thead className="border-b border-slate-700 bg-slate-800/50">
            <tr>
              <th className="px-4 py-3 font-medium text-slate-300">ID</th>
              <th className="px-4 py-3 font-medium text-slate-300">級</th>
              <th className="px-4 py-3 font-medium text-slate-300">形式</th>
              <th className="px-4 py-3 font-medium text-slate-300">本文（抜粋）</th>
              <th className="px-4 py-3 font-medium text-slate-300" />
            </tr>
          </thead>
          <tbody>
            {paginatedItems.map((q) => (
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
            ))}
          </tbody>
        </table>
      </div>

      {filteredItems.length > 0 && totalPages > 1 && (
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

      {filteredItems.length === 0 && (
        <p className="mt-6 text-center text-slate-500">
          {searchQuery || levelFilter || typeFilter
            ? "検索に一致する問題はありません"
            : "問題が登録されていません。新規登録から追加してください。"}
        </p>
      )}
    </div>
  );
}
