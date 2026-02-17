"use client";

import { useEffect, useState } from "react";
import {
  adminGetBuddyComments,
  adminCreateBuddyComment,
  adminUpdateBuddyComment,
  adminDeleteBuddyComment,
  type BuddyCommentRow,
  type BuddyCommentCategory
} from "@/lib/data/admin-db";

const CATEGORY_OPTIONS: { value: BuddyCommentCategory; label: string }[] = [
  { value: "regular", label: "レギュラー（通常）" },
  { value: "streak_0", label: "0日（はじめまして）" },
  { value: "streak_3_5", label: "3〜5日" },
  { value: "streak_5_10", label: "5〜10日" },
  { value: "streak_11", label: "11日以上（{{days}}で日数挿入）" }
];

export default function AdminBuddyCommentsPage() {
  const [list, setList] = useState<BuddyCommentRow[]>([]);
  const [filter, setFilter] = useState<BuddyCommentCategory | "">("");
  const [loading, setLoading] = useState(true);
  const [message, setMessage] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [newBody, setNewBody] = useState("");
  const [newCategory, setNewCategory] = useState<BuddyCommentCategory>("regular");
  const [editingId, setEditingId] = useState<string | null>(null);
  const [editBody, setEditBody] = useState("");

  const load = async () => {
    try {
      const rows = await adminGetBuddyComments(
        filter || undefined
      );
      setList(rows);
    } catch (e) {
      setError(e instanceof Error ? e.message : "読み込みに失敗しました");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    setLoading(true);
    void load();
  }, [filter]);

  const handleAdd = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!newBody.trim()) {
      setError("コメントを入力してください");
      return;
    }
    setError(null);
    setMessage(null);
    try {
      await adminCreateBuddyComment({
        body: newBody.trim(),
        category: newCategory,
        sort_order: list.length
      });
      setNewBody("");
      await load();
      setMessage("コメントを追加しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "追加に失敗しました");
    }
  };

  const handleEdit = (row: BuddyCommentRow) => {
    setEditingId(row.id);
    setEditBody(row.body);
  };

  const handleSaveEdit = async () => {
    if (!editingId) return;
    setError(null);
    setMessage(null);
    try {
      await adminUpdateBuddyComment(editingId, { body: editBody.trim() });
      setEditingId(null);
      await load();
      setMessage("更新しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "更新に失敗しました");
    }
  };

  const handleDelete = async (id: string) => {
    if (!confirm("このコメントを削除しますか？")) return;
    setError(null);
    setMessage(null);
    try {
      await adminDeleteBuddyComment(id);
      await load();
      setMessage("削除しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "削除に失敗しました");
    }
  };

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  return (
    <div className="space-y-8">
      <h1 className="text-xl font-semibold text-slate-100">バディコメント管理</h1>
      <p className="text-sm text-slate-400">
        ダッシュボード右下のバディが表示するコメントを登録できます。レギュラーはランダムで表示され、連続学習日数に応じたコメントが間に混ざります。性別を感じさせない・褒め・励まし・寄り添いの表現を推奨します。
      </p>

      <section className="rounded-xl border border-slate-700 bg-slate-900/50 p-6">
        <h2 className="mb-4 text-sm font-medium text-slate-300">新規登録</h2>
        <form onSubmit={handleAdd} className="space-y-3">
          <div>
            <label className="mb-1 block text-xs text-slate-400">カテゴリ</label>
            <select
              value={newCategory}
              onChange={(e) => setNewCategory(e.target.value as BuddyCommentCategory)}
              className="w-full max-w-xs rounded-lg border border-slate-600 bg-slate-800 px-3 py-2 text-sm text-slate-100 focus:border-brand-500 focus:outline-none"
            >
              {CATEGORY_OPTIONS.map((o) => (
                <option key={o.value} value={o.value}>{o.label}</option>
              ))}
            </select>
          </div>
          <div>
            <label className="mb-1 block text-xs text-slate-400">コメント本文</label>
            <textarea
              value={newBody}
              onChange={(e) => setNewBody(e.target.value)}
              placeholder="例: 今日も一緒に頑張ろう。"
              rows={2}
              className="w-full max-w-xl rounded-lg border border-slate-600 bg-slate-800 px-3 py-2 text-sm text-slate-100 placeholder-slate-500 focus:border-brand-500 focus:outline-none"
            />
          </div>
          <button
            type="submit"
            className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500"
          >
            追加
          </button>
        </form>
      </section>

      <section className="rounded-xl border border-slate-700 bg-slate-900/50 p-6">
        <div className="mb-4 flex items-center justify-between">
          <h2 className="text-sm font-medium text-slate-300">登録済みコメント</h2>
          <select
            value={filter}
            onChange={(e) => setFilter(e.target.value as BuddyCommentCategory | "")}
            className="rounded-lg border border-slate-600 bg-slate-800 px-3 py-1.5 text-sm text-slate-100 focus:border-brand-500 focus:outline-none"
          >
            <option value="">すべて</option>
            {CATEGORY_OPTIONS.map((o) => (
              <option key={o.value} value={o.value}>{o.label}</option>
            ))}
          </select>
        </div>
        {list.length === 0 ? (
          <p className="text-sm text-slate-500">該当するコメントはありません</p>
        ) : (
          <ul className="space-y-2">
            {list.map((row) => (
              <li
                key={row.id}
                className="flex items-start justify-between gap-4 rounded-lg border border-slate-700 bg-slate-800/50 p-3"
              >
                {editingId === row.id ? (
                  <div className="min-w-0 flex-1 space-y-2">
                    <textarea
                      value={editBody}
                      onChange={(e) => setEditBody(e.target.value)}
                      rows={2}
                      className="w-full rounded border border-slate-600 bg-slate-800 px-2 py-1 text-sm text-slate-100 focus:border-brand-500 focus:outline-none"
                    />
                    <div className="flex gap-2">
                      <button
                        type="button"
                        onClick={handleSaveEdit}
                        className="rounded bg-brand-600 px-2 py-1 text-xs text-white hover:bg-brand-500"
                      >
                        保存
                      </button>
                      <button
                        type="button"
                        onClick={() => { setEditingId(null); setEditBody(""); }}
                        className="rounded bg-slate-600 px-2 py-1 text-xs text-slate-200 hover:bg-slate-500"
                      >
                        キャンセル
                      </button>
                    </div>
                  </div>
                ) : (
                  <>
                    <div className="min-w-0 flex-1">
                      <p className="text-sm text-slate-200">{row.body}</p>
                      <span className="mt-1 inline-block text-xs text-slate-500">
                        {CATEGORY_OPTIONS.find((o) => o.value === row.category)?.label ?? row.category}
                      </span>
                    </div>
                    <div className="flex shrink-0 gap-1">
                      <button
                        type="button"
                        onClick={() => handleEdit(row)}
                        className="rounded px-2 py-1 text-xs text-slate-400 hover:text-slate-200"
                      >
                        編集
                      </button>
                      <button
                        type="button"
                        onClick={() => handleDelete(row.id)}
                        className="rounded px-2 py-1 text-xs text-red-400 hover:text-red-300"
                      >
                        削除
                      </button>
                    </div>
                  </>
                )}
              </li>
            ))}
          </ul>
        )}
      </section>

      {error && (
        <p className="rounded-lg bg-red-900/30 px-4 py-2 text-sm text-red-300">{error}</p>
      )}
      {message && (
        <p className="rounded-lg bg-emerald-900/30 px-4 py-2 text-sm text-emerald-300">{message}</p>
      )}
    </div>
  );
}
