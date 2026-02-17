"use client";

import { useParams, useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import Link from "next/link";
import {
  adminGetReadingShortQuestionById,
  adminUpdateReadingShortQuestion,
  adminDeleteReadingShortQuestion
} from "@/lib/data/admin-db";

const LEVELS = ["5級", "4級", "3級", "準2級", "2級", "準1級", "1級"];
const QUESTION_TYPES = [
  { value: "short_fill", label: "短文の語句空所" },
  { value: "conversation_fill", label: "会話文の空所" }
] as const;

export default function AdminReadingEditPage() {
  const params = useParams();
  const router = useRouter();
  const id = Number(params.id);

  const [level, setLevel] = useState("3級");
  const [questionType, setQuestionType] = useState<"short_fill" | "conversation_fill">("short_fill");
  const [body, setBody] = useState("");
  const [choices, setChoices] = useState<string[]>(["", "", "", ""]);
  const [correctIndexUi, setCorrectIndexUi] = useState(1);
  const [explanation, setExplanation] = useState("");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const load = async () => {
      try {
        const data = await adminGetReadingShortQuestionById(id);
        if (!data) {
          setError("問題が見つかりません");
          return;
        }
        setLevel(data.level ?? "3級");
        setQuestionType((data.question_type as "short_fill" | "conversation_fill") ?? "short_fill");
        setBody(data.body ?? "");
        const ch = Array.isArray(data.choices) ? (data.choices as string[]) : [];
        setChoices([ch[0] ?? "", ch[1] ?? "", ch[2] ?? "", ch[3] ?? ""]);
        const idx = typeof data.correct_index === "number" ? data.correct_index : 0;
        setCorrectIndexUi(Math.min(4, Math.max(1, idx + 1)));
        setExplanation(data.explanation ?? "");
      } catch (e) {
        setError(e instanceof Error ? e.message : "読み込みに失敗しました");
      } finally {
        setLoading(false);
      }
    };
    void load();
  }, [id]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    const trimmedChoices = choices.map((c) => c.trim());
    if (trimmedChoices.length !== 4 || trimmedChoices.some((c) => !c)) {
      setError("選択肢は4つすべて入力してください");
      return;
    }
    if (correctIndexUi < 1 || correctIndexUi > 4) {
      setError("正解は1〜4のいずれかで指定してください");
      return;
    }
    setSaving(true);
    try {
      await adminUpdateReadingShortQuestion(id, {
        level,
        question_type: questionType,
        body: body.trim(),
        choices: trimmedChoices,
        correct_index: correctIndexUi - 1,
        explanation: explanation.trim() || null
      });
      router.push("/admin/reading");
    } catch (e) {
      setError(e instanceof Error ? e.message : "保存に失敗しました");
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    if (!confirm(`問題 ID ${id} を削除しますか？`)) return;
    try {
      await adminDeleteReadingShortQuestion(id);
      router.push("/admin/reading");
    } catch (e) {
      setError(e instanceof Error ? e.message : "削除に失敗しました");
    }
  };

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  if (error && !body) {
    return (
      <div>
        <p className="mb-4 rounded-lg border border-red-800 bg-red-950/30 px-4 py-3 text-red-300">
          {error}
        </p>
        <Link href="/admin/reading" className="text-brand-400 hover:underline">
          ← リーディング問題一覧へ
        </Link>
      </div>
    );
  }

  return (
    <div>
      <div className="mb-6">
        <Link
          href="/admin/reading"
          className="text-sm text-slate-400 hover:text-brand-300"
        >
          ← リーディング問題一覧
        </Link>
      </div>
      <h1 className="mb-6 text-xl font-semibold text-slate-100">リーディング問題を編集（ID: {id}）</h1>

      <form onSubmit={handleSubmit} className="max-w-2xl space-y-4">
        <div className="grid gap-4 sm:grid-cols-2">
          <div>
            <label className="mb-1 block text-xs font-medium text-slate-400">級 *</label>
            <select
              value={level}
              onChange={(e) => setLevel(e.target.value)}
              required
              className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
            >
              {LEVELS.map((l) => (
                <option key={l} value={l}>{l}</option>
              ))}
            </select>
          </div>
          <div>
            <label className="mb-1 block text-xs font-medium text-slate-400">問題形式 *</label>
            <select
              value={questionType}
              onChange={(e) => setQuestionType(e.target.value as "short_fill" | "conversation_fill")}
              className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
            >
              {QUESTION_TYPES.map((t) => (
                <option key={t.value} value={t.value}>{t.label}</option>
              ))}
            </select>
          </div>
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">本文 *（空所は __BLANK__）</label>
          <textarea
            value={body}
            onChange={(e) => setBody(e.target.value)}
            required
            rows={5}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          />
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">選択肢（4つ）*</label>
          <div className="space-y-2">
            {[0, 1, 2, 3].map((i) => (
              <input
                key={i}
                type="text"
                value={choices[i] ?? ""}
                onChange={(e) => {
                  const next = [...choices];
                  next[i] = e.target.value;
                  setChoices(next);
                }}
                required
                className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
                placeholder={`選択肢 ${i + 1}`}
              />
            ))}
          </div>
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">正解（何番目か）*</label>
          <select
            value={correctIndexUi}
            onChange={(e) => setCorrectIndexUi(Number(e.target.value))}
            className="w-full max-w-[8rem] rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          >
            {[1, 2, 3, 4].map((n) => (
              <option key={n} value={n}>{n} 番目</option>
            ))}
          </select>
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">解説（任意）</label>
          <textarea
            value={explanation}
            onChange={(e) => setExplanation(e.target.value)}
            rows={3}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          />
        </div>

        {error && (
          <p className="rounded-lg border border-red-800 bg-red-950/30 px-3 py-2 text-sm text-red-300">
            {error}
          </p>
        )}

        <div className="flex flex-wrap gap-3">
          <button
            type="submit"
            disabled={saving}
            className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500 disabled:opacity-50"
          >
            {saving ? "保存中..." : "更新する"}
          </button>
          <Link
            href="/admin/reading"
            className="rounded-lg border border-slate-600 px-4 py-2 text-sm text-slate-300 hover:bg-slate-800"
          >
            キャンセル
          </Link>
          <button
            type="button"
            onClick={handleDelete}
            className="rounded-lg border border-red-700 px-4 py-2 text-sm text-red-400 hover:bg-red-950/30"
          >
            削除
          </button>
        </div>
      </form>
    </div>
  );
}
