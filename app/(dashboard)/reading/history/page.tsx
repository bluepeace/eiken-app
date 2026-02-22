"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { getProfileId } from "@/lib/data/vocabulary-db";
import {
  getReadingHistory,
  getReadingWrongStats,
  type ReadingHistoryEntry,
  type ReadingWrongStats,
} from "@/lib/data/reading-db";
import { PROBLEM_TYPE_INFO } from "@/lib/constants/reading";

function formatDate(iso: string) {
  const d = new Date(iso);
  return d.toLocaleString("ja-JP", {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
  });
}

function questionTypeLabel(t: "short_fill" | "conversation_fill" | "word_order") {
  return PROBLEM_TYPE_INFO[t]?.label ?? t;
}

export default function ReadingHistoryPage() {
  const [history, setHistory] = useState<ReadingHistoryEntry[]>([]);
  const [wrongStats, setWrongStats] = useState<ReadingWrongStats[]>([]);
  const [loading, setLoading] = useState(true);
  const [requiresLogin, setRequiresLogin] = useState(false);
  const [tab, setTab] = useState<"wrong" | "history">("wrong");

  useEffect(() => {
    const load = async () => {
      const profileId = await getProfileId();
      if (!profileId) {
        setRequiresLogin(true);
        setLoading(false);
        return;
      }
      const [h, w] = await Promise.all([
        getReadingHistory(profileId),
        getReadingWrongStats(profileId),
      ]);
      // 問題文が取得できなかった履歴は非表示にする
      setHistory(h.filter((e) => e.bodySnippet?.trim()));
      setWrongStats(w.filter((s) => s.bodySnippet?.trim()));
      setLoading(false);
    };
    load();
  }, []);

  if (loading) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-2xl text-center text-slate-600">
          読み込み中...
        </div>
      </main>
    );
  }

  if (requiresLogin) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
          <h1 className="text-xl font-semibold text-slate-900">リーディング履歴</h1>
          <p className="mt-4 text-sm text-slate-600">
            履歴を表示するにはログインしてください。
          </p>
          <Link
            href="/login"
            className="mt-4 inline-block rounded-full bg-[#50c2cb] px-4 py-2 text-sm font-semibold text-white hover:bg-[#46adb5]"
          >
            ログイン
          </Link>
        </div>
      </main>
    );
  }

  return (
    <main className="min-h-[calc(100vh-64px)] px-4 py-8">
      <div className="mx-auto max-w-2xl">
        <div className="mb-6 flex items-center justify-between">
          <h1 className="text-xl font-semibold text-slate-900">リーディング履歴</h1>
          <Link
            href="/reading"
            className="text-sm text-slate-600 hover:text-slate-900"
          >
            ← リーディングへ
          </Link>
        </div>

        <div className="mb-4 flex gap-2 rounded-lg bg-slate-100 p-1">
          <button
            type="button"
            onClick={() => setTab("wrong")}
            className={`flex-1 rounded-md px-3 py-2 text-sm font-medium ${
              tab === "wrong"
                ? "bg-white text-slate-900 shadow-sm"
                : "text-slate-600 hover:text-slate-900"
            }`}
          >
            間違えた問題 ({wrongStats.length})
          </button>
          <button
            type="button"
            onClick={() => setTab("history")}
            className={`flex-1 rounded-md px-3 py-2 text-sm font-medium ${
              tab === "history"
                ? "bg-white text-slate-900 shadow-sm"
                : "text-slate-600 hover:text-slate-900"
            }`}
          >
            解答履歴
          </button>
        </div>

        {tab === "wrong" && (
          <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <p className="mb-4 text-sm text-slate-600">
              間違えた回数が多い順です。これらの問題は次回の出題で優先されます。
            </p>
            {wrongStats.length === 0 ? (
              <p className="text-sm text-slate-500">
                まだ間違えた問題はありません。短文・会話の空所補充や語句整序に挑戦してみましょう。
              </p>
            ) : (
              <ul className="space-y-3">
                {wrongStats.map((s) => (
                  <li
                    key={`${s.sourceType}-${s.sourceId}`}
                    className="flex flex-col gap-2 rounded-lg border border-slate-100 bg-slate-50 px-4 py-3"
                  >
                    <div className="flex items-start justify-between gap-2">
                      <div className="min-w-0 flex-1">
                        <span className="text-xs text-slate-500">
                          {questionTypeLabel(s.questionType)} ・ {s.level}
                        </span>
                        <p className="mt-0.5 text-sm text-slate-800">
                          {s.bodySnippet || "（問題文を取得できませんでした）"}
                        </p>
                      </div>
                      <span className="shrink-0 rounded-full bg-red-100 px-2.5 py-0.5 text-xs font-medium text-red-800">
                        {s.wrongCount}回
                      </span>
                    </div>
                    {s.correctAnswerText && (
                      <p className="text-xs text-slate-600">
                        <span className="font-medium text-slate-700">正解：</span>
                        {s.correctAnswerText}
                      </p>
                    )}
                    {s.explanation && (
                      <p className="text-xs text-slate-600 leading-relaxed">
                        <span className="font-medium text-slate-700">解説：</span>
                        {s.explanation}
                      </p>
                    )}
                    <Link
                      href={`${PROBLEM_TYPE_INFO[s.questionType]?.path ?? "/reading/short"}?level=${encodeURIComponent(s.level)}`}
                      className="mt-1 text-xs text-[#50c2cb] hover:underline"
                    >
                      この形式で再挑戦 →
                    </Link>
                  </li>
                ))}
              </ul>
            )}
          </div>
        )}

        {tab === "history" && (
          <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <p className="mb-4 text-sm text-slate-600">
              直近の解答履歴（短文・会話の空所補充・語句整序）です。
            </p>
            {history.length === 0 ? (
              <p className="text-sm text-slate-500">
                まだ解答履歴はありません。
              </p>
            ) : (
              <ul className="space-y-2">
                {history.map((e) => (
                  <li
                    key={e.id}
                    className="flex flex-col gap-2 rounded-lg border border-slate-100 px-4 py-2 text-sm"
                  >
                    <div className="flex flex-wrap items-center justify-between gap-2">
                      <span className="text-xs text-slate-500">
                        {questionTypeLabel(e.questionType)} ・ {e.level}
                      </span>
                      <span
                        className={
                          e.isCorrect
                            ? "text-emerald-600"
                            : "text-red-600"
                        }
                      >
                        {e.isCorrect ? "正解" : "不正解"}
                      </span>
                      <span className="text-xs text-slate-500">
                        {formatDate(e.createdAt)}
                      </span>
                    </div>
                    <p className="text-slate-700">
                      {e.bodySnippet || "—"}
                    </p>
                    {!e.isCorrect && (e.userAnswerText != null || e.correctAnswerText != null) && (
                      <div className="space-y-0.5 text-xs text-slate-600">
                        {e.userAnswerText != null && (
                          <p>
                            <span className="font-medium text-red-700">あなたの解答：</span>
                            {e.userAnswerText}
                          </p>
                        )}
                        {e.correctAnswerText != null && (
                          <p>
                            <span className="font-medium text-emerald-700">正解：</span>
                            {e.correctAnswerText}
                          </p>
                        )}
                      </div>
                    )}
                    {!e.isCorrect && e.explanation && (
                      <p className="text-xs text-slate-600 leading-relaxed">
                        <span className="font-medium text-slate-700">解説：</span>
                        {e.explanation}
                      </p>
                    )}
                  </li>
                ))}
              </ul>
            )}
          </div>
        )}
      </div>
    </main>
  );
}
