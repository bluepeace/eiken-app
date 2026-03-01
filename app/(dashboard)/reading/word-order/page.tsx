"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import Link from "next/link";
import { useRouter, useSearchParams } from "next/navigation";
import {
  fetchReadingWordOrderQuestions,
  saveReadingResult,
  type ReadingWordOrderQuestion,
} from "@/lib/data/reading-db";
import { getProfileId } from "@/lib/data/vocabulary-db";
import { logStudyActivity } from "@/lib/data/study-activity";
import { MODULE_COLORS } from "@/lib/constants/module-colors";
import { isProblemTypeEnabledForLevel } from "@/lib/constants/reading";
import { ReadingHintPanel, ReadingHintButton } from "@/components/features/reading/ReadingHintPanel";

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

export default function ReadingWordOrderPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const level = searchParams.get("level") ?? "";
  const [stage, setStage] = useState<"loading" | "session" | "result">("loading");
  const [questions, setQuestions] = useState<ReadingWordOrderQuestion[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedOrder, setSelectedOrder] = useState<number[]>([]);
  const [remainingIndices, setRemainingIndices] = useState<number[]>([]);
  const [submitted, setSubmitted] = useState(false);
  const [correctCount, setCorrectCount] = useState(0);
  const [error, setError] = useState<string | null>(null);
  const [isHintOpen, setIsHintOpen] = useState(false);
  const sessionStartRef = useRef<number | null>(null);

  const load = useCallback(async () => {
    if (!level) {
      setError("級が指定されていません。");
      return;
    }
    if (!isProblemTypeEnabledForLevel(level, "word_order")) {
      setError("この級では語句整序は出題されません。");
      return;
    }
    setError(null);
    const data = await fetchReadingWordOrderQuestions(level, 10);
    if (data.length === 0) {
      setError("この級にはまだ問題が登録されていません。");
      return;
    }
    setQuestions(shuffle(data));
    setCurrentIndex(0);
    setCorrectCount(0);
    sessionStartRef.current = Date.now();
    setStage("session");
  }, [level]);

  useEffect(() => {
    load();
  }, [load]);

  const current = questions[currentIndex];
  useEffect(() => {
    if (!current) return;
    setSelectedOrder([]);
    setRemainingIndices(current.words.map((_, i) => i));
    setSubmitted(false);
  }, [current?.id]);

  const handlePick = (wordIndex: number) => {
    if (submitted || !current) return;
    setRemainingIndices((prev) => prev.filter((i) => i !== wordIndex));
    setSelectedOrder((prev) => [...prev, wordIndex]);
  };

  const handleUndo = (wordIndex: number) => {
    if (submitted || !current) return;
    setSelectedOrder((prev) => prev.filter((i) => i !== wordIndex));
    setRemainingIndices((prev) => [...prev, wordIndex].sort((a, b) => a - b));
  };

  const isCorrectOrder = (order: number[]) => {
    if (!current) return false;
    if (order.length !== current.correct_order.length) return false;
    return order.every((v, i) => v === current.correct_order[i]);
  };

  const handleSubmit = async () => {
    if (!current || selectedOrder.length !== current.words.length || submitted) return;
    setSubmitted(true);
    const correct = isCorrectOrder(selectedOrder);
    if (correct) setCorrectCount((c) => c + 1);
    const profileId = await getProfileId();
    if (profileId) {
      await saveReadingResult(profileId, "word_order", current.id, correct ? 1 : 0, correct);
    }
  };

  const handleNext = () => {
    const isLastQuestion = currentIndex + 1 >= questions.length;
    if (isLastQuestion && sessionStartRef.current !== null) {
      const elapsed = Math.round((Date.now() - sessionStartRef.current) / 1000);
      getProfileId().then((profileId) => {
        if (profileId && elapsed > 0) {
          void logStudyActivity(profileId, "reading", { seconds: elapsed });
        }
      });
    }
    if (isLastQuestion) {
      setStage("result");
    } else {
      setCurrentIndex((i) => i + 1);
    }
  };

  if (!level) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl text-center">
          <p className="text-slate-600">級を選択してください。</p>
          <Link href="/reading" className="mt-4 inline-block text-brand-500 hover:underline">リーディングトップへ</Link>
        </div>
      </main>
    );
  }

  if (stage === "loading" && questions.length === 0 && !error) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl text-center text-slate-600">読み込み中...</div>
      </main>
    );
  }

  if (error) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl space-y-4 rounded-2xl border border-slate-200 bg-white p-6">
          <p className="text-red-600">{error}</p>
          <Link href="/reading" className="text-brand-500 hover:underline">リーディングトップへ</Link>
        </div>
      </main>
    );
  }

  if (stage === "result") {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl space-y-6 rounded-2xl border border-slate-200 bg-white p-6">
          <h1 className="text-xl font-semibold text-slate-900">結果</h1>
          <p className="text-slate-700">{correctCount} / {questions.length} 問正解</p>
          <div className="flex gap-4">
            <button type="button" onClick={() => load()} className={`rounded-full px-4 py-2 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}>もう一度</button>
            <Link href="/reading" className="rounded-full border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">リーディングトップへ</Link>
          </div>
        </div>
      </main>
    );
  }

  if (!current) return null;

  const correct = submitted && isCorrectOrder(selectedOrder);
  const hasHint = level === "5級" || level === "4級";

  return (
    <main className="min-h-[calc(100vh-64px)] px-4 py-8 pb-20">
      {hasHint && (
        <>
          <ReadingHintPanel
            type="word_order"
            level={level}
            isOpen={isHintOpen}
            onClose={() => setIsHintOpen(false)}
          />
          <ReadingHintButton
            onClick={() => setIsHintOpen((o) => !o)}
            isOpen={isHintOpen}
          />
        </>
      )}
      <div className="mx-auto max-w-xl space-y-6 rounded-2xl border border-slate-200 bg-white p-6">
        <div className="flex items-center justify-between">
          <span className="text-sm text-slate-500">問 {currentIndex + 1} / {questions.length}（{level}）</span>
          <Link
            href="/reading"
            className="text-sm text-slate-500 hover:underline"
            onClick={async (e) => {
              if (sessionStartRef.current) {
                e.preventDefault();
                const profileId = await getProfileId();
                const elapsed = Math.round((Date.now() - sessionStartRef.current) / 1000);
                if (profileId && elapsed > 0) await logStudyActivity(profileId, "reading", { seconds: elapsed });
                router.push("/reading");
              }
            }}
          >
            終了
          </Link>
        </div>

        <p className="rounded-lg bg-slate-50 p-4 text-slate-800">{current.prompt_ja}</p>

        <p className="text-xs text-slate-500">日本文の意味に合うように語句を並べ替えましょう。</p>

        <div className="flex min-h-[3rem] flex-wrap gap-2 rounded-lg border-2 border-dashed border-slate-200 p-3">
          {selectedOrder.map((i) => (
            <button
              key={`sel-${i}`}
              type="button"
              onClick={() => !submitted && handleUndo(i)}
              disabled={submitted}
              className="rounded-lg bg-brand-100 px-3 py-1.5 text-sm text-slate-800 hover:bg-brand-200 disabled:cursor-default"
            >
              {current.words[i]}
            </button>
          ))}
        </div>

        <div className="flex flex-wrap gap-2">
          {remainingIndices.map((i) => (
            <button
              key={i}
              type="button"
              onClick={() => handlePick(i)}
              disabled={submitted}
              className="rounded-lg border border-slate-300 bg-white px-3 py-1.5 text-sm text-slate-700 hover:bg-slate-50 disabled:opacity-50"
            >
              {current.words[i]}
            </button>
          ))}
        </div>

        {!submitted && selectedOrder.length === current.words.length && (
          <button type="button" onClick={handleSubmit} className={`w-full rounded-full py-2.5 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}>
            答え合わせ
          </button>
        )}

        {submitted && (
          <>
            <p className={correct ? "text-green-700" : "text-red-700"}>
              {correct ? "正解です！" : "不正解です。"} 正解: {current.correct_order.map((i) => current.words[i]).join(" ")}
            </p>
            {(current.explanation != null && String(current.explanation).trim() !== "") && (
              <div className="rounded-xl border border-slate-200 bg-slate-50 p-4">
                <p className="mb-1 text-xs font-medium text-slate-500">解説</p>
                <p className="whitespace-pre-wrap text-sm text-slate-800">{String(current.explanation).trim()}</p>
              </div>
            )}
            <button type="button" onClick={handleNext} className={`w-full rounded-full py-2.5 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}>
              {currentIndex + 1 >= questions.length ? "結果を見る" : "次の問題"}
            </button>
          </>
        )}
      </div>
    </main>
  );
}
