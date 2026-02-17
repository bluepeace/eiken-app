"use client";

import { useEffect, useState, useRef } from "react";
import {
  adminGetBuddies,
  adminCreateBuddy,
  adminUpdateBuddy,
  adminDeleteBuddy,
  type BuddyRow
} from "@/lib/data/admin-db";
import { supabase } from "@/lib/supabase/client";

export default function AdminBuddiesPage() {
  const [list, setList] = useState<BuddyRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [uploading, setUploading] = useState(false);
  const [message, setMessage] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [newName, setNewName] = useState("");
  const [editingId, setEditingId] = useState<string | null>(null);
  const [editName, setEditName] = useState("");
  const fileInputRef = useRef<HTMLInputElement>(null);

  const load = async () => {
    try {
      const rows = await adminGetBuddies();
      setList(rows);
    } catch (e) {
      setError(e instanceof Error ? e.message : "読み込みに失敗しました");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    void load();
  }, []);

  const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !file.type.startsWith("image/")) return;

    const name = newName.trim() || file.name.replace(/\.[^.]+$/, "");
    if (!name) {
      setError("名前を入力してください");
      return;
    }

    setError(null);
    setMessage(null);
    setUploading(true);
    try {
      const ext = file.name.split(".").pop() || "jpg";
      const id = crypto.randomUUID();
      const path = `buddies/${id}.${ext}`;

      const { error: uploadError } = await supabase.storage
        .from("avatars")
        .upload(path, file, { upsert: false });

      if (uploadError) throw uploadError;

      const { data } = supabase.storage.from("avatars").getPublicUrl(path);
      await adminCreateBuddy({
        name,
        kind: "dog",
        image_url: data.publicUrl,
        sort_order: list.length
      });
      setNewName("");
      await load();
      setMessage(`バディ「${name}」を登録しました`);
    } catch (err: unknown) {
      const msg =
        err instanceof Error
          ? err.message
          : (err as { message?: string })?.message ?? "アップロードに失敗しました";
      setError(msg);
    } finally {
      setUploading(false);
      e.target.value = "";
    }
  };

  const handleSaveName = async (id: string) => {
    if (!editName.trim()) return;
    setError(null);
    setMessage(null);
    try {
      await adminUpdateBuddy(id, { name: editName.trim() });
      setEditingId(null);
      setEditName("");
      await load();
      setMessage("名前を更新しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "更新に失敗しました");
    }
  };

  const handleDelete = async (id: string, name: string) => {
    if (!confirm(`「${name}」を削除しますか？ このバディを選択しているユーザーは未選択になります。`)) return;
    setError(null);
    setMessage(null);
    try {
      await adminDeleteBuddy(id);
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
      <h1 className="text-xl font-semibold text-slate-100">バディ管理</h1>
      <p className="text-sm text-slate-400">
        初回ログイン時のオンボーディングでユーザーが選べる「一緒に学習するバディ」を登録します。
      </p>

      <section className="rounded-xl border border-slate-700 bg-slate-900/50 p-6">
        <h2 className="mb-4 text-sm font-medium text-slate-300">新規登録</h2>
        <div className="flex flex-wrap items-end gap-3">
          <div>
            <label className="mb-1 block text-xs text-slate-400">名前</label>
            <input
              type="text"
              value={newName}
              onChange={(e) => setNewName(e.target.value)}
              placeholder="例: バディ、ポチ、ミケ"
              className="w-40 rounded-lg border border-slate-600 bg-slate-800 px-3 py-2 text-sm text-slate-100 placeholder:text-slate-500 focus:border-brand-500 focus:outline-none"
            />
          </div>
          <input
            ref={fileInputRef}
            type="file"
            accept="image/*"
            className="hidden"
            onChange={handleFileChange}
          />
          <button
            type="button"
            onClick={() => fileInputRef.current?.click()}
            disabled={uploading}
            className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500 disabled:opacity-60"
          >
            {uploading ? "アップロード中..." : "画像を選択して登録"}
          </button>
        </div>
      </section>

      <section className="rounded-xl border border-slate-700 bg-slate-900/50 p-6">
        <h2 className="mb-4 text-sm font-medium text-slate-300">登録済みバディ</h2>
        {list.length === 0 ? (
          <p className="text-sm text-slate-500">まだ登録されていません。上から追加してください。</p>
        ) : (
          <div className="grid gap-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
            {list.map((b) => (
              <div
                key={b.id}
                className="flex flex-col items-center gap-2 rounded-lg border border-slate-700 bg-slate-800/50 p-4"
              >
                <div className="flex h-20 w-20 shrink-0 items-end justify-center">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img
                    src={b.image_url}
                    alt={b.name}
                    className="h-full w-full object-contain object-bottom"
                  />
                </div>
                {editingId === b.id ? (
                  <div className="flex w-full flex-col gap-1">
                    <input
                      type="text"
                      value={editName}
                      onChange={(e) => setEditName(e.target.value)}
                      className="w-full rounded border border-slate-600 bg-slate-800 px-2 py-1 text-sm text-slate-100 focus:border-brand-500 focus:outline-none"
                      autoFocus
                    />
                    <div className="flex gap-1">
                      <button
                        type="button"
                        onClick={() => handleSaveName(b.id)}
                        className="rounded bg-brand-600 px-2 py-1 text-xs text-white hover:bg-brand-500"
                      >
                        保存
                      </button>
                      <button
                        type="button"
                        onClick={() => { setEditingId(null); setEditName(""); }}
                        className="rounded bg-slate-600 px-2 py-1 text-xs text-slate-200 hover:bg-slate-500"
                      >
                        キャンセル
                      </button>
                    </div>
                  </div>
                ) : (
                  <>
                    <p className="text-sm font-medium text-slate-200">{b.name}</p>
                    <div className="flex gap-2">
                      <button
                        type="button"
                        onClick={() => { setEditingId(b.id); setEditName(b.name); }}
                        className="text-xs text-slate-400 hover:text-slate-200"
                      >
                        名前を変更
                      </button>
                      <button
                        type="button"
                        onClick={() => handleDelete(b.id, b.name)}
                        className="text-xs text-red-400 hover:text-red-300"
                      >
                        削除
                      </button>
                    </div>
                  </>
                )}
              </div>
            ))}
          </div>
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
