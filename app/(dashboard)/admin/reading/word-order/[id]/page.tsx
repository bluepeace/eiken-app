"use client";

import { useParams, useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import Link from "next/link";
import {
  adminGetReadingWordOrderQuestionById,
  adminUpdateReadingWordOrderQuestion,
  adminDeleteReadingWordOrderQuestion
} from "@/lib/data/admin-db";

const LEVELS = ["5級", "4級", "3級", "準2級", "準2級プラス", "2級", "準1級", "1級"];

export default function AdminReadingWordOrderEditPage() {
  const params = useParams();
  const router = useRouter();
  const id = Number(params.id);

  const [level, setLevel] = useState("4級");
  const [promptJa, setPromptJa] = useState("");
  const [wordsText, setWordsText] = useState("");
  const [orderText, setOrderText] = useState("");
  const [explanation, setExplanation] = useState("");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const load = async () => {
      try {
        const data = await adminGetReadingWordOrderQuestionById(id);
        if (!data) {
          setError("問題が見つかりません");
          return;
        }
        setLevel(data.level ?? "4級");
        setPromptJa(data.prompt_ja ?? "");
        setWordsText((data.words ?? []).join("\n"));
        setOrderText((data.correct_order ?? []).join(","));
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
    const words = wordsText
      .split(/\n/)
      .map((s) => s.trim())
      .filter(Boolean);
    if (words.length === 0) {
      setError("語句を1行に1つ以上入力してください");
      return;
    }
    const orderParts = orderText.split(",").map((s) => s.trim()).filter(Boolean);
    const correctOrder = orderParts.map((s) => parseInt(s, 10));
    if (correctOrder.some((n) => Number.isNaN(n) || n < 0 || n >= words.length)) {
      setError(`正解の並びは 0 ～ ${words.length - 1} の数字をカンマ区切りで入力してください（語の番号は0始まり）`);
      return;
    }
    if (correctOrder.length !== words.length) {
      setError(`正解の並びは ${words.length} 個の数字を入力してください`);
      return;
    }
    const uniq = new Set(correctOrder);
    if (uniq.size !== words.length) {
      setError("正解の並びに重複や抜けがないようにしてください");
      return;
    }
    setSaving(true);
    try {
      await adminUpdateReadingWordOrderQuestion(id, {
        level,
        prompt_ja: promptJa.trim(),
        words,
        correct_order: correctOrder,
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
    if (!confirm(`語句整序 ID ${id} を削除しますか？`)) return;
    try {
      await adminDeleteReadingWordOrderQuestion(id);
      router.push("/admin/reading");
    } catch (e) {
      setError(e instanceof Error ? e.message : "削除に失敗しました");
    }
  };

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  if (error && !promptJa && !wordsText) {
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
        <Link href="/admin/reading" className="text-sm text-slate-400 hover:text-brand-300">
          ← リーディング問題一覧
        </Link>
      </div>
      <h1 className="mb-6 text-xl font-semibold text-slate-100">語句整序を編集（ID: {id}）</h1>

      <form onSubmit={handleSubmit} className="max-w-2xl space-y-4">
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
          <label className="mb-1 block text-xs font-medium text-slate-400">日本文（問題文）*</label>
          <input
            type="text"
            value={promptJa}
            onChange={(e) => setPromptJa(e.target.value)}
            required
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
            placeholder="例: あなたの電話番号を教えていただけますか。"
          />
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">語句（1行に1つ）*</label>
          <textarea
            value={wordsText}
            onChange={(e) => setWordsText(e.target.value)}
            required
            rows={6}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500 font-mono text-sm"
            placeholder={"number\nmay\nyour telephone\nI\nhave"}
          />
          <p className="mt-1 text-xs text-slate-500">上から順に 0, 1, 2, … の番号になります。</p>
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">正解の並び（0始まりの番号をカンマ区切り）*</label>
          <input
            type="text"
            value={orderText}
            onChange={(e) => setOrderText(e.target.value)}
            required
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500 font-mono"
            placeholder="例: 1,3,4,2,0"
          />
        </div>

        <div className="rounded-lg border border-slate-600 bg-slate-800/50 p-4">
          <h2 className="mb-2 text-sm font-medium text-slate-200">解説（任意）</h2>
          <p className="mb-2 text-xs text-slate-500">学習画面で答え合わせ後に表示されます。正解の並びの理由や文法のポイントを入力してください。</p>
          <textarea
            value={explanation}
            onChange={(e) => setExplanation(e.target.value)}
            rows={4}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500 text-sm"
            placeholder="例: How much は「いくら」で、疑問文では How much + be動詞 + 主語の順になります。"
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
