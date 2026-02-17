"use client";

import { useState, useEffect, useCallback } from "react";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import {
  fetchReadingPassage,
  fetchReadingPassageBlanks,
  saveReadingResult,
  type ReadingPassage,
  type ReadingPassageBlank,
} from "@/lib/data/reading-db";
import { getProfileId } from "@/lib/data/vocabulary-db";
import { MODULE_COLORS } from "@/lib/constants/module-colors";
import { isProblemTypeEnabledForLevel } from "@/lib/constants/reading";

const BLANK = "__BLANK__";

export default function ReadingLongFillPage() {
  const searchParams = useSearchParams();
  const level = searchParams.get("level") ?? "";
  const [stage, setStage] = useState<"loading" | "session" | "result">("loading");
  const [passage, setPassage] = useState<ReadingPassage | null>(null);
  const [blanks, setBlanks] = useState<ReadingPassageBlank[]>([]);
  const [selections, setSelections] = useState<Record<number, number>>({});
  const [submitted, setSubmitted] = useState(false);
  const [correctCount, setCorrectCount] = useState(0);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    if (!level) {
      setError("級が指定されていません。");
      return;
    }
    if (!isProblemTypeEnabledForLevel(level, "long_fill")) {
      setError("この級では長文の語句空所補充は出題されません。");
      return;
    }
    setError(null);
    const p = await fetchReadingPassage(level, "long_fill");
    if (!p || !p.body) {
      setError("この級にはまだ問題が登録されていません。");
      return;
    }
    const b = await fetchReadingPassageBlanks(p.id);
    if (b.length === 0) {
      setError("この長文には空所が登録されていません。");
      return;
    }
    setPassage(p);
    setBlanks(b);
    setSelections({});
    setSubmitted(false);
    setCorrectCount(0);
    setStage("session");
  }, [level]);

  useEffect(() => {
    load();
  }, [load]);

  const allSelected = blanks.every((bl) => selections[bl.blank_index] !== undefined);

  const handleChoice = (blankIndex: number, choiceIndex: number) => {
    if (submitted) return;
    setSelections((prev) => ({ ...prev, [blankIndex]: choiceIndex }));
  };

  const handleSubmit = async () => {
    if (!passage || !allSelected || submitted) return;
    setSubmitted(true);
    let count = 0;
    const profileId = await getProfileId();
    for (const bl of blanks) {
      const choice = selections[bl.blank_index];
      const isCorrect = choice === bl.correct_index;
      if (isCorrect) count++;
      if (profileId) {
        await saveReadingResult(profileId, "passage_fill", bl.id, choice, isCorrect);
      }
    }
    setCorrectCount(count);
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

  if (!passage) return null;

  const body = passage.body ?? "";
  const parts = body.split(BLANK);

  return (
    <main className="min-h-[calc(100vh-64px)] px-4 py-8">
      <div className="mx-auto max-w-xl space-y-6 rounded-2xl border border-slate-200 bg-white p-6">
        <div className="flex items-center justify-between">
          <span className="text-sm text-slate-500">{level} 長文の語句空所補充</span>
          <Link href="/reading" className="text-sm text-slate-500 hover:underline">終了</Link>
        </div>

        {passage.title && <h2 className="text-lg font-medium text-slate-800">{passage.title}</h2>}

        <div className="space-y-4 text-slate-800">
          {parts.map((text, i) => (
            <span key={i}>
              {text}
              {i < blanks.length && (
                <span className="mx-1 inline-block align-bottom">
                  {submitted ? (
                    <span className={`rounded px-2 py-0.5 ${selections[blanks[i].blank_index] === blanks[i].correct_index ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800"}`}>
                      {blanks[i].choices[blanks[i].correct_index]}
                    </span>
                  ) : (
                    <select
                      value={selections[blanks[i].blank_index] ?? ""}
                      onChange={(e) => handleChoice(blanks[i].blank_index, Number(e.target.value))}
                      className="rounded border border-slate-300 bg-white px-2 py-1 text-sm"
                    >
                      <option value="">選ぶ</option>
                      {blanks[i].choices.map((c, j) => (
                        <option key={j} value={j}>{c}</option>
                      ))}
                    </select>
                  )}
                </span>
              )}
            </span>
          ))}
        </div>

        {!submitted && (
          <button
            type="button"
            onClick={handleSubmit}
            disabled={!allSelected}
            className={`w-full rounded-full py-2.5 text-sm font-medium text-white disabled:opacity-50 ${MODULE_COLORS.reading.solid}`}
          >
            答え合わせ
          </button>
        )}

        {submitted && (
          <div className="space-y-4">
            <p className="text-slate-700">{correctCount} / {blanks.length} 問正解</p>
            <div className="flex gap-4">
              <button type="button" onClick={() => load()} className={`rounded-full px-4 py-2 text-sm font-medium text-white ${MODULE_COLORS.reading.solid}`}>別の長文に挑戦</button>
              <Link href="/reading" className="rounded-full border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">リーディングトップへ</Link>
            </div>
          </div>
        )}
      </div>
    </main>
  );
}
