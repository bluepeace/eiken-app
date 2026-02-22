"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import {
  fetchReadingPassage,
  fetchReadingPassageQuestions,
  saveReadingResult,
  type ReadingPassage,
  type ReadingPassageQuestion,
} from "@/lib/data/reading-db";
import { getProfileId } from "@/lib/data/vocabulary-db";
import { logStudyActivity } from "@/lib/data/study-activity";
import { MODULE_COLORS } from "@/lib/constants/module-colors";
import { isProblemTypeEnabledForLevel } from "@/lib/constants/reading";

export default function ReadingLongContentPage() {
  const searchParams = useSearchParams();
  const level = searchParams.get("level") ?? "";
  const [stage, setStage] = useState<"loading" | "session" | "result">("loading");
  const [passage, setPassage] = useState<ReadingPassage | null>(null);
  const [questions, setQuestions] = useState<ReadingPassageQuestion[]>([]);
  const [currentQ, setCurrentQ] = useState(0);
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [correctCount, setCorrectCount] = useState(0);
  const [error, setError] = useState<string | null>(null);
  const sessionStartRef = useRef<number | null>(null);

  const load = useCallback(async () => {
    if (!level) {
      setError("級が指定されていません。");
      return;
    }
    if (!isProblemTypeEnabledForLevel(level, "long_content")) {
      setError("この級では長文の内容一致選択は出題されません。");
      return;
    }
    setError(null);
    const p = await fetchReadingPassage(level, "long_content");
    if (!p || !p.body) {
      setError("この級にはまだ問題が登録されていません。");
      return;
    }
    const q = await fetchReadingPassageQuestions(p.id);
    if (q.length === 0) {
      setError("この長文には設問が登録されていません。");
      return;
    }
    setPassage(p);
    setQuestions(q);
    setCurrentQ(0);
    setSelectedIndex(null);
    setCorrectCount(0);
    sessionStartRef.current = Date.now();
    setStage("session");
  }, [level]);

  useEffect(() => {
    load();
  }, [load]);

  const question = questions[currentQ];
  const showResult = selectedIndex !== null;

  const handleChoice = async (index: number) => {
    if (!question || selectedIndex !== null) return;
    setSelectedIndex(index);
    const isCorrect = index === question.correct_index;
    if (isCorrect) setCorrectCount((c) => c + 1);
    const profileId = await getProfileId();
    if (profileId) {
      await saveReadingResult(profileId, "passage_content", question.id, index, isCorrect);
    }
  };

  const handleNext = () => {
    const isLastQuestion = currentQ + 1 >= questions.length;
    if (isLastQuestion && sessionStartRef.current !== null) {
      const elapsed = Math.round((Date.now() - sessionStartRef.current) / 1000);
      getProfileId().then((profileId) => {
        if (profileId && elapsed > 0) {
          void logStudyActivity(profileId, "reading", { seconds: elapsed });
        }
      });
    }
    setSelectedIndex(null);
    if (isLastQuestion) {
      setStage("result");
    } else {
      setCurrentQ((i) => i + 1);
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

  if (stage === "loading" && !passage && !error) {
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
            <button type="button" onClick={() => load()} className={`rounded-full px-4 py-2 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}>別の長文に挑戦</button>
            <Link href="/reading" className="rounded-full border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">リーディングトップへ</Link>
          </div>
        </div>
      </main>
    );
  }

  if (!passage || !question) return null;

  return (
    <main className="min-h-[calc(100vh-64px)] px-4 py-8">
      <div className="mx-auto max-w-xl space-y-6 rounded-2xl border border-slate-200 bg-white p-6">
        <div className="flex items-center justify-between">
          <span className="text-sm text-slate-500">問 {currentQ + 1} / {questions.length}（{level}）</span>
          <Link href="/reading" className="text-sm text-slate-500 hover:underline">終了</Link>
        </div>

        {passage.title && <h2 className="text-lg font-medium text-slate-800">{passage.title}</h2>}
        <div className="whitespace-pre-wrap rounded-lg bg-slate-50 p-4 text-slate-800 text-sm">{passage.body}</div>

        <p className="font-medium text-slate-800">{question.question_text}</p>

        <ul className="space-y-2">
          {question.choices.map((choice, i) => {
            const isSelected = selectedIndex === i;
            const isCorrectChoice = i === question.correct_index;
            const showCorrect = showResult && isCorrectChoice;
            const showWrong = showResult && isSelected && !isCorrectChoice;
            return (
              <li key={i}>
                <button
                  type="button"
                  onClick={() => handleChoice(i)}
                  disabled={showResult}
                  className={`w-full rounded-xl border px-4 py-3 text-left text-sm transition-colors disabled:cursor-default ${
                    showCorrect ? "border-green-500 bg-green-50 text-green-800"
                      : showWrong ? "border-red-400 bg-red-50 text-red-800"
                        : "border-slate-200 hover:bg-slate-50"
                  }`}
                >
                  {choice}
                </button>
              </li>
            );
          })}
        </ul>

        {showResult && (
          <button
            type="button"
            onClick={handleNext}
            className={`w-full rounded-full py-2.5 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}
          >
            {currentQ + 1 >= questions.length ? "結果を見る" : "次の問題"}
          </button>
        )}
      </div>
    </main>
  );
}
