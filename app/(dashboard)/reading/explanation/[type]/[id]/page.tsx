"use client";

import { useParams } from "next/navigation";
import { useEffect, useState } from "react";
import Link from "next/link";
import {
  fetchReadingPassageById,
  fetchReadingPassageQuestions,
  fetchReadingPassageBlanks,
  type ReadingPassage,
  type ReadingPassageQuestion,
  type ReadingPassageBlank,
} from "@/lib/data/reading-db";
import { MODULE_COLORS } from "@/lib/constants/module-colors";
import { normalizeLineBreaks } from "@/lib/utils/reading";
import { ReadAloudButton } from "@/components/features/writing/ReadAloudButton";
import { getProfileId } from "@/lib/data/vocabulary-db";
import { logReadingAloudActivity } from "@/lib/data/study-activity";

const BLANK = "__BLANK__";

type PassageType = "long_content" | "long_fill";

export default function ReadingExplanationPage() {
  const params = useParams();
  const type = params.type as PassageType;
  const id = Number(params.id);

  const [passage, setPassage] = useState<ReadingPassage | null>(null);
  const [questions, setQuestions] = useState<ReadingPassageQuestion[]>([]);
  const [blanks, setBlanks] = useState<ReadingPassageBlank[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (type !== "long_content" && type !== "long_fill") {
      setError("無効な問題種別です。");
      setLoading(false);
      return;
    }
    const load = async () => {
      try {
        const p = await fetchReadingPassageById(id);
        if (!p) {
          setError("長文が見つかりません。");
          return;
        }
        if (p.passage_type !== type) {
          setError("問題種別が一致しません。");
          return;
        }
        setPassage(p);
        if (type === "long_content") {
          const q = await fetchReadingPassageQuestions(id);
          setQuestions(q);
        } else {
          const b = await fetchReadingPassageBlanks(id);
          setBlanks(b);
        }
      } catch (e) {
        setError(e instanceof Error ? e.message : "読み込みに失敗しました");
      } finally {
        setLoading(false);
      }
    };
    void load();
  }, [id, type]);

  if (loading) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl text-center text-slate-600">読み込み中...</div>
      </main>
    );
  }

  if (error || !passage) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl space-y-4 rounded-2xl border border-slate-200 bg-white p-6">
          <p className="text-red-600">{error ?? "長文が見つかりません。"}</p>
          <Link href="/reading" className="text-brand-500 hover:underline">リーディングトップへ</Link>
        </div>
      </main>
    );
  }

  const body = normalizeLineBreaks(passage.body ?? "");
  const hasExplanation = !!(passage.translation_ja?.trim() || passage.vocabulary_notes?.trim());

  return (
    <main className="min-h-[calc(100vh-64px)] px-4 py-8">
      <div className="mx-auto max-w-xl space-y-6 rounded-2xl border border-slate-200 bg-white p-6">
        <div className="flex items-center justify-between">
          <h1 className="text-lg font-semibold text-slate-900">
            {type === "long_content" ? "長文の内容一致" : "長文の語句空所"} 解説
          </h1>
          <Link href="/reading" className="text-sm text-slate-500 hover:underline">リーディングトップへ</Link>
        </div>

        {passage.title && (
          <h2 className="text-base font-medium text-slate-800">{passage.title}</h2>
        )}

        <section>
          <div className="mb-2 flex flex-wrap items-center gap-2">
            <h3 className="text-sm font-medium text-slate-600">本文</h3>
            <ReadAloudButton
              text={type === "long_fill" && blanks.length > 0
                ? body.split(BLANK).map((part, i) => part + (blanks[i] ? blanks[i].choices[blanks[i].correct_index] : "")).join("")
                : body}
              label="音声で聞く"
              className="rounded border border-slate-200 bg-white px-2 py-1 text-xs text-slate-700 hover:bg-slate-50"
              onSpeakStart={() => {
                getProfileId().then((pid) => {
                  if (pid) void logReadingAloudActivity(pid);
                });
              }}
            />
          </div>
          <p className="mb-2 text-xs text-amber-700">
            長文を音読してみよう！聞いてから声に出して読むと学習効果が上がります。
          </p>
          <div className="whitespace-pre-wrap rounded-lg bg-slate-50 p-4 text-slate-800 text-sm">
            {type === "long_fill" && blanks.length > 0
              ? body.split(BLANK).map((text, i) => (
                  <span key={i}>
                    {text}
                    {i < blanks.length && (
                      <span className="mx-1 inline-block rounded bg-amber-100 px-1.5 py-0.5 font-medium text-amber-900">
                        {blanks[i].choices[blanks[i].correct_index]}
                      </span>
                    )}
                  </span>
                ))
              : body}
          </div>
        </section>

        {passage.translation_ja?.trim() && (
          <section>
            <h3 className="mb-2 text-sm font-medium text-slate-600">訳</h3>
            <div className="whitespace-pre-wrap rounded-lg border border-slate-200 bg-slate-50/50 p-4 text-slate-700 text-sm">
              {normalizeLineBreaks(passage.translation_ja)}
            </div>
          </section>
        )}

        {passage.vocabulary_notes?.trim() && (
          <section>
            <h3 className="mb-2 text-sm font-medium text-slate-600">ポイント・単語</h3>
            <div className="whitespace-pre-wrap rounded-lg border border-slate-200 bg-slate-50/50 p-4 text-slate-700 text-sm">
              {normalizeLineBreaks(passage.vocabulary_notes)}
            </div>
          </section>
        )}

        {!hasExplanation && (
          <p className="rounded-lg border border-amber-200 bg-amber-50 px-4 py-2 text-sm text-amber-800">
            この長文の訳・単語解説はまだ登録されていません。
          </p>
        )}

        {type === "long_content" && questions.length > 0 && (
          <section>
            <h3 className="mb-3 text-sm font-medium text-slate-600">設問と正解・解説</h3>
            <ul className="space-y-4">
              {questions.map((q, i) => (
                <li key={q.id} className="rounded-xl border border-slate-200 bg-slate-50/50 p-4">
                  <p className="mb-2 font-medium text-slate-800">{i + 1}. {q.question_text}</p>
                  <p className="mb-1 text-sm text-slate-700">
                    <span className="text-slate-500">正解: </span>
                    <span className="font-medium text-green-700">{q.choices[q.correct_index]}</span>
                  </p>
                  {q.explanation && (
                    <p className="whitespace-pre-wrap text-sm text-slate-600">{q.explanation}</p>
                  )}
                </li>
              ))}
            </ul>
          </section>
        )}

        {type === "long_fill" && blanks.length > 0 && (
          <section>
            <h3 className="mb-3 text-sm font-medium text-slate-600">空所の正解</h3>
            <ul className="space-y-2">
              {blanks.map((b, i) => (
                <li key={b.id} className="flex items-center gap-2 text-sm text-slate-700">
                  <span className="text-slate-500">空所 {i + 1}:</span>
                  <span className="font-medium text-green-700">{b.choices[b.correct_index]}</span>
                </li>
              ))}
            </ul>
          </section>
        )}

        <div className="flex flex-wrap gap-3 pt-2">
          <Link
            href={
              type === "long_content"
                ? `/reading/long-content?level=${encodeURIComponent(passage.level)}`
                : `/reading/long-fill?level=${encodeURIComponent(passage.level)}`
            }
            className={`rounded-full px-4 py-2 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}
          >
            別の長文に挑戦
          </Link>
          <Link
            href="/reading"
            className="rounded-full border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50"
          >
            リーディングトップへ
          </Link>
        </div>
      </div>
    </main>
  );
}
