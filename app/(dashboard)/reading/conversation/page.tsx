"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import Link from "next/link";
import { useRouter, useSearchParams } from "next/navigation";
import {
  fetchReadingShortQuestions,
  saveReadingResult,
  type ReadingShortQuestion,
} from "@/lib/data/reading-db";
import { getProfileId } from "@/lib/data/vocabulary-db";
import { MODULE_COLORS } from "@/lib/constants/module-colors";
import { isProblemTypeEnabledForLevel } from "@/lib/constants/reading";
import { formatConversationLines } from "@/lib/utils/reading";
import { ReadAloudButton } from "@/components/features/writing/ReadAloudButton";
import { logReadingAloudActivity, logStudyActivity } from "@/lib/data/study-activity";
import { ReadingHintPanel, ReadingHintButton } from "@/components/features/reading/ReadingHintPanel";

const BLANK = "__BLANK__";

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

export default function ReadingConversationPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const level = searchParams.get("level") ?? "";
  const [stage, setStage] = useState<"loading" | "session" | "result">("loading");
  const [questions, setQuestions] = useState<ReadingShortQuestion[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [correctCount, setCorrectCount] = useState(0);
  const [error, setError] = useState<string | null>(null);
  const [isHintOpen, setIsHintOpen] = useState(false);
  const sessionStartRef = useRef<number | null>(null);

  const load = useCallback(async () => {
    if (!level) {
      setError("級が指定されていません。");
      return;
    }
    if (!isProblemTypeEnabledForLevel(level, "conversation_fill")) {
      setError("この級では会話文の空所補充は出題されません。");
      return;
    }
    setError(null);
    const profileId = await getProfileId();
    const data = await fetchReadingShortQuestions(level, "conversation_fill", 10, profileId);
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
  const showResult = selectedIndex !== null;

  const handleChoice = async (index: number) => {
    if (selectedIndex !== null || !current) return;
    setSelectedIndex(index);
    const isCorrect = index === current.correct_index;
    if (isCorrect) setCorrectCount((c) => c + 1);
    const profileId = await getProfileId();
    if (profileId) {
      await saveReadingResult(profileId, "short", current.id, index, isCorrect);
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
    setSelectedIndex(null);
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
          <Link href="/reading" className="mt-4 inline-block text-brand-500 hover:underline">
            リーディングトップへ
          </Link>
        </div>
      </main>
    );
  }

  if (stage === "loading" && questions.length === 0 && !error) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl text-center text-slate-600">
          読み込み中...
        </div>
      </main>
    );
  }

  if (error) {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl space-y-4 rounded-2xl border border-slate-200 bg-white p-6">
          <p className="text-red-600">{error}</p>
          <Link href="/reading" className="text-brand-500 hover:underline">
            リーディングトップへ
          </Link>
        </div>
      </main>
    );
  }

  if (stage === "result") {
    return (
      <main className="min-h-[calc(100vh-64px)] px-4 py-8">
        <div className="mx-auto max-w-xl space-y-6 rounded-2xl border border-slate-200 bg-white p-6">
          <h1 className="text-xl font-semibold text-slate-900">結果</h1>
          <p className="text-slate-700">
            {correctCount} / {questions.length} 問正解
          </p>
          <div className="flex gap-4">
            <button type="button" onClick={() => load()} className={`rounded-full px-4 py-2 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}>
              もう一度
            </button>
            <Link href="/reading" className="rounded-full border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">
              リーディングトップへ
            </Link>
          </div>
        </div>
      </main>
    );
  }

  if (!current) return null;

  const parts = current.body.split(BLANK);

  return (
    <main className="min-h-[calc(100vh-64px)] px-4 py-8 pb-20">
      <ReadingHintPanel
        type="conversation_fill"
        level={level}
        isOpen={isHintOpen}
        onClose={() => setIsHintOpen(false)}
      />
      <ReadingHintButton
        onClick={() => setIsHintOpen((o) => !o)}
        isOpen={isHintOpen}
      />
      <div className="mx-auto max-w-xl space-y-6 rounded-2xl border border-slate-200 bg-white p-6">
        <div className="flex items-center justify-between">
          <span className="text-sm text-slate-500">
            問 {currentIndex + 1} / {questions.length}（{level}）
          </span>
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

        <div className="whitespace-pre-wrap rounded-lg bg-slate-50 p-4 text-slate-800">
          {formatConversationLines(parts[0])}
          <span className="mx-1 inline-block min-w-[120px] rounded border border-dashed border-slate-400 bg-white px-2 py-1 text-sm">
            {showResult ? current.choices[current.correct_index] : "（選択してください）"}
          </span>
          {formatConversationLines(parts[1])}
        </div>

        <ul className="space-y-2">
          {current.choices.map((choice, i) => {
            const isSelected = selectedIndex === i;
            const isCorrectChoice = i === current.correct_index;
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
                  {showCorrect && <span className="mr-2 inline-block font-semibold">正解</span>}
                  {showWrong && <span className="mr-2 inline-block font-semibold">不正解</span>}
                  {choice}
                </button>
              </li>
            );
          })}
        </ul>

        {showResult && current.explanation && (
          <div className="rounded-xl border border-slate-200 bg-slate-50 p-4">
            <p className="mb-1 text-xs font-medium text-slate-500">解説</p>
            <p className="text-sm text-slate-800">{current.explanation}</p>
          </div>
        )}

        {showResult && (
          <>
            <div className="rounded-xl border border-slate-200 bg-slate-50 p-4">
              <p className="mb-2 text-xs font-medium text-slate-500">穴埋めした文章</p>
              <p className="mb-3 whitespace-pre-wrap text-sm text-slate-800">
                {formatConversationLines(
                  parts[0] + current.choices[current.correct_index] + parts[1]
                )}
              </p>
              <ReadAloudButton
                text={parts[0] + current.choices[current.correct_index] + parts[1]}
                label="音声で聞く"
                className="border border-slate-200 bg-white text-slate-700 hover:bg-slate-50"
                onSpeakStart={() => {
                  getProfileId().then((pid) => {
                    if (pid) void logReadingAloudActivity(pid);
                  });
                }}
              />
              <p className="mt-2 text-xs text-amber-700">
                音読してみよう！正しい発音を聞いて、自分でも声に出して読むと学習効果が上がります。
              </p>
            </div>
            <button
              type="button"
              onClick={handleNext}
              className={`w-full rounded-full py-2.5 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}
            >
              {currentIndex + 1 >= questions.length ? "結果を見る" : "次の問題"}
            </button>
          </>
        )}
      </div>
    </main>
  );
}
