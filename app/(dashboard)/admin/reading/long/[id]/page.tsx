"use client";

import { useParams, useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import Link from "next/link";
import {
  adminGetReadingPassageById,
  adminUpdateReadingPassage,
  adminDeleteReadingPassage,
  type AdminReadingPassageQuestionInput
} from "@/lib/data/admin-db";

const LEVELS = ["5級", "4級", "3級", "準2級", "準2級プラス", "2級", "準1級", "1級"];
const GENRES = [
  { value: "email", label: "Eメール" },
  { value: "narrative", label: "説明文" },
  { value: "notice", label: "お知らせ" }
];
const PASSAGE_TYPES = [
  { value: "long_content", label: "長文の内容一致" },
  { value: "long_fill", label: "長文の語句空所" }
];

const emptyQuestion = (): AdminReadingPassageQuestionInput => ({
  question_text: "",
  choices: ["", "", "", ""],
  correct_index: 0,
  order_num: 0
});

export default function AdminReadingLongEditPage() {
  const params = useParams();
  const router = useRouter();
  const id = Number(params.id);

  const [level, setLevel] = useState("準2級プラス");
  const [genre, setGenre] = useState<string | null>("email");
  const [passageType, setPassageType] = useState<"long_content" | "long_fill">("long_content");
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [questions, setQuestions] = useState<AdminReadingPassageQuestionInput[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const load = async () => {
      try {
        const data = await adminGetReadingPassageById(id);
        if (!data) {
          setError("長文が見つかりません");
          return;
        }
        setLevel(data.level ?? "準2級プラス");
        setGenre(data.genre ?? "email");
        setPassageType((data.passage_type as "long_content" | "long_fill") ?? "long_content");
        setTitle(data.title ?? "");
        setBody(data.body ?? "");
        if (data.questions.length > 0) {
          setQuestions(
            data.questions.map((q) => {
              const ch = q.choices ?? [];
              const choices4 = [ch[0] ?? "", ch[1] ?? "", ch[2] ?? "", ch[3] ?? ""];
              return {
                question_text: q.question_text,
                choices: choices4,
                correct_index: Math.min(3, Math.max(0, q.correct_index)),
                order_num: q.order_num
              };
            })
          );
        } else {
          setQuestions([emptyQuestion()]);
        }
      } catch (e) {
        setError(e instanceof Error ? e.message : "読み込みに失敗しました");
      } finally {
        setLoading(false);
      }
    };
    void load();
  }, [id]);

  const setQuestion = (index: number, upd: Partial<AdminReadingPassageQuestionInput>) => {
    setQuestions((prev) => {
      const next = [...prev];
      next[index] = { ...next[index]!, ...upd };
      return next;
    });
  };

  const addQuestion = () => {
    setQuestions((prev) => [...prev, { ...emptyQuestion(), order_num: prev.length }]);
  };

  const removeQuestion = (index: number) => {
    if (questions.length <= 1) return;
    setQuestions((prev) => prev.filter((_, i) => i !== index));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    const trimmedQuestions = questions
      .map((q, i) => {
        const raw = q.choices ?? ["", "", "", ""];
        const choices = Array.from({ length: 4 }, (_, j) => (raw[j] ?? "").trim());
        return {
          question_text: q.question_text.trim(),
          choices,
          correct_index: Math.min(3, Math.max(0, q.correct_index)),
          order_num: i
        };
      })
      .filter((q) => q.question_text.length > 0);
    const invalid = trimmedQuestions.some((q) => q.choices.some((c) => !c));
    if (invalid) {
      setError("各設問の質問文と選択肢4つをすべて入力してください");
      return;
    }
    setSaving(true);
    try {
      await adminUpdateReadingPassage(id, {
        level,
        genre: genre || null,
        passage_type: passageType,
        title: title.trim() || null,
        body: body.trim() || null,
        questions: trimmedQuestions
      });
      router.push("/admin/reading");
    } catch (e) {
      setError(e instanceof Error ? e.message : "保存に失敗しました");
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    if (!confirm(`長文 ID ${id} を削除しますか？設問も削除されます。`)) return;
    try {
      await adminDeleteReadingPassage(id);
      router.push("/admin/reading");
    } catch (e) {
      setError(e instanceof Error ? e.message : "削除に失敗しました");
    }
  };

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  if (error && !body && questions.length === 0) {
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
      <h1 className="mb-6 text-xl font-semibold text-slate-100">長文の内容一致を編集（ID: {id}）</h1>

      <form onSubmit={handleSubmit} className="space-y-6">
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
            <label className="mb-1 block text-xs font-medium text-slate-400">ジャンル</label>
            <select
              value={genre ?? ""}
              onChange={(e) => setGenre(e.target.value || null)}
              className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
            >
              <option value="">—</option>
              {GENRES.map((g) => (
                <option key={g.value} value={g.value}>{g.label}</option>
              ))}
            </select>
          </div>
          <div>
            <label className="mb-1 block text-xs font-medium text-slate-400">種別 *</label>
            <select
              value={passageType}
              onChange={(e) => setPassageType(e.target.value as "long_content" | "long_fill")}
              className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
            >
              {PASSAGE_TYPES.map((t) => (
                <option key={t.value} value={t.value}>{t.label}</option>
              ))}
            </select>
          </div>
          <div className="sm:col-span-2">
            <label className="mb-1 block text-xs font-medium text-slate-400">タイトル</label>
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
            />
          </div>
        </div>

        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">本文 *</label>
          <textarea
            value={body}
            onChange={(e) => setBody(e.target.value)}
            required
            rows={14}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          />
        </div>

        <div>
          <div className="mb-2 flex items-center justify-between">
            <label className="text-xs font-medium text-slate-400">設問</label>
            <button
              type="button"
              onClick={addQuestion}
              className="rounded border border-slate-600 px-2 py-1 text-xs text-slate-300 hover:bg-slate-800"
            >
              + 設問を追加
            </button>
          </div>
          <div className="space-y-4">
            {questions.map((q, idx) => (
              <div
                key={idx}
                className="rounded-lg border border-slate-700 bg-slate-800/30 p-4"
              >
                <div className="mb-2 flex items-center justify-between">
                  <span className="text-xs text-slate-500">設問 {idx + 1}</span>
                  {questions.length > 1 && (
                    <button
                      type="button"
                      onClick={() => removeQuestion(idx)}
                      className="text-xs text-red-400 hover:text-red-300"
                    >
                      削除
                    </button>
                  )}
                </div>
                <input
                  type="text"
                  value={q.question_text}
                  onChange={(e) => setQuestion(idx, { question_text: e.target.value })}
                  placeholder="質問文"
                  className="mb-2 w-full rounded border border-slate-600 bg-slate-900 px-2 py-1.5 text-sm text-slate-100"
                />
                <div className="mb-2 space-y-1">
                  {[0, 1, 2, 3].map((ci) => (
                    <input
                      key={ci}
                      type="text"
                      value={q.choices[ci] ?? ""}
                      onChange={(e) => {
                        const next = [...(q.choices ?? ["", "", "", ""])];
                        next[ci] = e.target.value;
                        setQuestion(idx, { choices: next });
                      }}
                      placeholder={`選択肢 ${ci + 1}`}
                      className="w-full rounded border border-slate-600 bg-slate-900 px-2 py-1 text-sm text-slate-100"
                    />
                  ))}
                </div>
                <label className="mr-2 text-xs text-slate-500">正解:</label>
                <select
                  value={q.correct_index}
                  onChange={(e) => setQuestion(idx, { correct_index: Number(e.target.value) })}
                  className="rounded border border-slate-600 bg-slate-900 px-2 py-1 text-sm text-slate-100"
                >
                  {[0, 1, 2, 3].map((n) => (
                    <option key={n} value={n}>{n + 1} 番目</option>
                  ))}
                </select>
              </div>
            ))}
          </div>
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
