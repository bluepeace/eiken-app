"use client";

import { useEffect, useState } from "react";
import {
  adminGetQuestionCounts,
  adminRefreshQuestionCounts,
  type QuestionCountRow
} from "@/lib/data/admin-question-counts-db";
import {
  PROBLEM_TYPE_INFO,
  getMenuItemsForLevel,
  type ReadingLevel
} from "@/lib/constants/reading";
import type { ReadingProblemType } from "@/lib/constants/reading";

const LEVEL_ORDER: ReadingLevel[] = [
  "1級",
  "準1級",
  "2級",
  "準2級プラス",
  "準2級",
  "3級",
  "4級",
  "5級"
];

/** ライティングがある級（4級・5級はなし） */
const WRITING_LEVELS: ReadingLevel[] = [
  "1級",
  "準1級",
  "2級",
  "準2級プラス",
  "準2級",
  "3級"
];

/** 級ごとに表示するライティング種別（存在するもののみ） */
const WRITING_TYPES_BY_LEVEL: Partial<
  Record<ReadingLevel, ("essay" | "summary" | "email")[]>
> = {
  "1級": ["essay", "summary"],
  "準1級": ["essay", "summary"],
  "2級": ["essay", "summary"],
  "準2級プラス": ["essay"],
  "準2級": ["essay", "email"],
  "3級": ["essay", "email"]
};

const WRITING_TYPE_LABEL: Record<string, string> = {
  essay: "英作文",
  summary: "要約",
  email: "Eメール"
};

function useQuestionCounts() {
  const [rows, setRows] = useState<QuestionCountRow[]>([]);
  const [updatedAt, setUpdatedAt] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const load = async () => {
    setLoading(true);
    setError(null);
    try {
      const data = await adminGetQuestionCounts();
      setRows(data);
      const latest = data.reduce(
        (acc, r) => (r.updated_at > acc ? r.updated_at : acc),
        ""
      );
      setUpdatedAt(latest || null);
    } catch (e) {
      setError(e instanceof Error ? e.message : "取得に失敗しました");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    void load();
  }, []);

  return { rows, updatedAt, loading, error, reload: load };
}

export default function AdminDashboardPage() {
  const { rows, updatedAt, loading, error, reload } = useQuestionCounts();
  const [refreshing, setRefreshing] = useState(false);

  const handleRefresh = async () => {
    setRefreshing(true);
    try {
      await adminRefreshQuestionCounts();
      await reload();
    } catch (e) {
      alert(e instanceof Error ? e.message : "集計の実行に失敗しました");
    } finally {
      setRefreshing(false);
    }
  };

  const byCategory = (category: QuestionCountRow["category"]) =>
    rows.filter((r) => r.category === category);

  const rowFor = (
    category: QuestionCountRow["category"],
    level: string,
    questionType: string | null
  ): QuestionCountRow | undefined =>
    rows.find(
      (x) =>
        x.category === category &&
        x.level === level &&
        (x.question_type ?? null) === (questionType ?? null)
    );

  const countFor = (
    category: QuestionCountRow["category"],
    level: string,
    questionType: string | null
  ) => rowFor(category, level, questionType)?.count ?? 0;

  const vocabularyRows = byCategory("vocabulary");
  const writingRows = byCategory("writing");
  const readingRows = byCategory("reading");

  if (loading) {
    return (
      <div>
        <h1 className="mb-6 text-xl font-semibold text-slate-100">
          問題数ダッシュボード
        </h1>
        <p className="text-slate-400">読み込み中...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div>
        <h1 className="mb-6 text-xl font-semibold text-slate-100">
          問題数ダッシュボード
        </h1>
        <p className="rounded-lg border border-red-800 bg-red-950/30 px-4 py-3 text-red-300">
          {error}
        </p>
      </div>
    );
  }

  return (
    <div>
      <div className="mb-6 flex flex-wrap items-center justify-between gap-4">
        <h1 className="text-xl font-semibold text-slate-100">
          問題数ダッシュボード
        </h1>
        <div className="flex items-center gap-4">
          {updatedAt && (
            <p className="text-sm text-slate-500">
              集計日時:{" "}
              {new Date(updatedAt).toLocaleString("ja-JP", {
                dateStyle: "medium",
                timeStyle: "short"
              })}
            </p>
          )}
          <button
            type="button"
            onClick={handleRefresh}
            disabled={refreshing}
            className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500 disabled:opacity-50"
          >
            {refreshing ? "集計中..." : "今すぐ集計"}
          </button>
        </div>
      </div>

      <div className="space-y-8">
        {/* 単語テスト */}
        <section className="rounded-xl border border-slate-700 bg-slate-900/50 p-6">
          <h2 className="mb-4 text-lg font-medium text-slate-200">
            単語テスト
          </h2>
          <ul className="space-y-1.5">
            {LEVEL_ORDER.map((level) => {
              const n = countFor("vocabulary", level, null);
              return (
                <li
                  key={level}
                  className="flex items-center justify-between text-slate-300"
                >
                  <span>{level}</span>
                  <span className="font-mono tabular-nums">{n}問</span>
                </li>
              );
            })}
          </ul>
          {vocabularyRows.length === 0 && (
            <p className="mt-2 text-sm text-slate-500">
              集計データがありません。「今すぐ集計」を実行してください。
            </p>
          )}
        </section>

        {/* ライティング（4級・5級はなし） */}
        <section className="rounded-xl border border-slate-700 bg-slate-900/50 p-6">
          <h2 className="mb-4 text-lg font-medium text-slate-200">
            ライティング
          </h2>
          <div className="space-y-4">
            {WRITING_LEVELS.map((level) => {
              const types = WRITING_TYPES_BY_LEVEL[level] ?? [];
              if (types.length === 0) return null;
              return (
                <div key={level}>
                  <p className="mb-1.5 font-medium text-slate-300">{level}</p>
                  <ul className="ml-4 space-y-0.5 text-slate-400">
                    {types.map((type) => {
                      const count = countFor("writing", level, type);
                      return (
                        <li
                          key={type}
                          className="flex justify-between gap-4"
                        >
                          <span>{WRITING_TYPE_LABEL[type] ?? type}</span>
                          <span className="font-mono tabular-nums">
                            {count}問
                          </span>
                        </li>
                      );
                    })}
                  </ul>
                </div>
              );
            })}
          </div>
          {writingRows.length === 0 && (
            <p className="text-sm text-slate-500">
              集計データがありません。「今すぐ集計」を実行してください。
            </p>
          )}
        </section>

        {/* リーディング（級ごとに有効な種別のみ表示） */}
        <section className="rounded-xl border border-slate-700 bg-slate-900/50 p-6">
          <h2 className="mb-4 text-lg font-medium text-slate-200">
            リーディング
          </h2>
          <div className="space-y-4">
            {LEVEL_ORDER.map((level) => {
              const menuItems = getMenuItemsForLevel(level);
              const entries = menuItems.map((item) => {
                const row = rowFor("reading", level, item.type);
                const count = row?.count ?? 0;
                const passageCount = row?.passage_count ?? null;
                return {
                  type: item.type,
                  label: item.label,
                  count,
                  passageCount
                };
              });
              return (
                <div key={level}>
                  <p className="mb-1.5 font-medium text-slate-300">{level}</p>
                  <ul className="ml-4 space-y-0.5 text-slate-400">
                    {entries.map(({ type, count, label, passageCount }) => (
                      <li
                        key={type}
                        className="flex justify-between gap-4"
                      >
                        <span>{label}</span>
                        <span className="font-mono tabular-nums">
                          {passageCount != null
                            ? `問題数：${passageCount}、設問数：${count}`
                            : `${count}問`}
                        </span>
                      </li>
                    ))}
                  </ul>
                </div>
              );
            })}
          </div>
          {readingRows.length === 0 && (
            <p className="text-sm text-slate-500">
              集計データがありません。「今すぐ集計」を実行してください。
            </p>
          )}
        </section>
      </div>

      <p className="mt-6 text-xs text-slate-500">
        毎日 0:00 にバッチで集計する場合は、cron で
        POST /api/admin/refresh-question-counts を
        Authorization: Bearer (CRON_SECRET) 付きで呼び出すか、Supabase の
        pg_cron で select refresh_question_counts(); をスケジュールしてください。
        <br />
        シード（例: seed_reading_long_content_jun2kyu_50.sql）を投入したあとは「今すぐ集計」を押すと反映されます。
      </p>
    </div>
  );
}
