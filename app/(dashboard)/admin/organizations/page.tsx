"use client";

import { useEffect, useState, useRef } from "react";
import {
  adminGetOrganizations,
  adminCreateOrganization,
  adminUpdateOrganization,
  type AdminOrganization,
} from "@/lib/data/admin-db";
import { supabase } from "@/lib/supabase/client";

const DEFAULT_ORG_ID = 1;

export default function AdminOrganizationsPage() {
  const [list, setList] = useState<AdminOrganization[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);
  const [newName, setNewName] = useState("");
  const [adding, setAdding] = useState(false);
  const [editingId, setEditingId] = useState<number | null>(null);
  const [editName, setEditName] = useState("");
  const [uploadingLogoId, setUploadingLogoId] = useState<number | null>(null);
  const fileInputRefs = useRef<Record<number, HTMLInputElement | null>>({});

  const load = async () => {
    try {
      const rows = await adminGetOrganizations();
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

  const handleAdd = async (e: React.FormEvent) => {
    e.preventDefault();
    const name = newName.trim();
    if (!name) return;
    setError(null);
    setMessage(null);
    setAdding(true);
    try {
      await adminCreateOrganization(name);
      setNewName("");
      await load();
      setMessage(`企業「${name}」を追加しました`);
    } catch (e) {
      setError(e instanceof Error ? e.message : "追加に失敗しました");
    } finally {
      setAdding(false);
    }
  };

  const handleSave = async (id: number) => {
    const name = editName.trim();
    if (!name) return;
    setError(null);
    setMessage(null);
    try {
      await adminUpdateOrganization(id, { name });
      setEditingId(null);
      setEditName("");
      await load();
      setMessage("企業名を更新しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "更新に失敗しました");
    }
  };

  const handleLogoUpload = async (orgId: number, e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !file.type.startsWith("image/")) return;
    setError(null);
    setMessage(null);
    setUploadingLogoId(orgId);
    try {
      const ext = file.name.split(".").pop()?.toLowerCase() || "png";
      const path = `organization-logos/${orgId}.${ext}`;
      const { error: uploadError } = await supabase.storage
        .from("avatars")
        .upload(path, file, { upsert: true });
      if (uploadError) throw uploadError;
      const { data } = supabase.storage.from("avatars").getPublicUrl(path);
      await adminUpdateOrganization(orgId, { logo_url: data.publicUrl });
      await load();
      setMessage("ロゴを設定しました");
    } catch (err) {
      setError(err instanceof Error ? err.message : "ロゴのアップロードに失敗しました");
    } finally {
      setUploadingLogoId(null);
      e.target.value = "";
    }
  };

  const handleLogoRemove = async (orgId: number) => {
    setError(null);
    setMessage(null);
    try {
      await adminUpdateOrganization(orgId, { logo_url: null });
      await load();
      setMessage("ロゴを削除しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "ロゴの削除に失敗しました");
    }
  };

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  return (
    <div>
      <h1 className="mb-6 text-xl font-semibold text-slate-100">企業管理</h1>
      <p className="mb-4 text-sm text-slate-400">
        WEBから登録した会員は「AIKEN」に所属します。企業契約時はここで企業を追加し、会員編集で所属企業を設定してください。ロゴを設定すると、その企業に所属する会員の画面上では AiKen ロゴの代わりに企業ロゴが表示されます。
      </p>

      {error && (
        <p className="mb-4 rounded-lg border border-red-800 bg-red-950/30 px-4 py-3 text-red-300">
          {error}
        </p>
      )}
      {message && (
        <p className="mb-4 rounded-lg border border-emerald-800 bg-emerald-950/30 px-4 py-3 text-emerald-300">
          {message}
        </p>
      )}

      <form onSubmit={handleAdd} className="mb-6 flex flex-wrap items-center gap-3">
        <input
          type="text"
          value={newName}
          onChange={(e) => setNewName(e.target.value)}
          placeholder="企業名"
          className="rounded-lg border border-slate-600 bg-slate-900 px-3 py-2 text-sm text-slate-100 placeholder-slate-500 outline-none focus:border-brand-500"
          disabled={adding}
        />
        <button
          type="submit"
          disabled={adding || !newName.trim()}
          className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500 disabled:opacity-50"
        >
          {adding ? "追加中..." : "企業を追加"}
        </button>
      </form>

      <div className="overflow-x-auto rounded-lg border border-slate-700">
        <table className="w-full text-left text-sm">
          <thead className="border-b border-slate-700 bg-slate-800/50">
            <tr>
              <th className="px-4 py-3 font-medium text-slate-300">ID</th>
              <th className="px-4 py-3 font-medium text-slate-300">ロゴ</th>
              <th className="px-4 py-3 font-medium text-slate-300">企業名</th>
              <th className="px-4 py-3 font-medium text-slate-300">登録日</th>
              <th className="px-4 py-3 font-medium text-slate-300" />
            </tr>
          </thead>
          <tbody>
            {list.map((org) => (
              <tr
                key={org.id}
                className="border-b border-slate-800 transition hover:bg-slate-800/30"
              >
                <td className="px-4 py-3 font-mono text-slate-300">{org.id}</td>
                <td className="px-4 py-3">
                  <div className="flex flex-col items-start gap-1">
                    {org.logo_url ? (
                      <>
                        <img
                          src={org.logo_url}
                          alt=""
                          className="h-10 w-10 rounded border border-slate-600 object-contain bg-slate-800"
                        />
                        <div className="flex gap-1">
                          <input
                            ref={(el) => { fileInputRefs.current[org.id] = el; }}
                            type="file"
                            accept="image/*"
                            className="hidden"
                            onChange={(e) => handleLogoUpload(org.id, e)}
                          />
                          <button
                            type="button"
                            disabled={uploadingLogoId === org.id}
                            onClick={() => fileInputRefs.current[org.id]?.click()}
                            className="text-xs text-brand-400 hover:text-brand-300 disabled:opacity-50"
                          >
                            {uploadingLogoId === org.id ? "アップロード中..." : "変更"}
                          </button>
                          <button
                            type="button"
                            onClick={() => handleLogoRemove(org.id)}
                            className="text-xs text-slate-400 hover:text-red-400"
                          >
                            削除
                          </button>
                        </div>
                      </>
                    ) : (
                      <>
                        <div className="flex h-10 w-10 items-center justify-center rounded border border-dashed border-slate-600 bg-slate-800/50 text-xs text-slate-500">
                          未設定
                        </div>
                        <input
                          ref={(el) => { fileInputRefs.current[org.id] = el; }}
                          type="file"
                          accept="image/*"
                          className="hidden"
                          onChange={(e) => handleLogoUpload(org.id, e)}
                        />
                        <button
                          type="button"
                          disabled={uploadingLogoId === org.id}
                          onClick={() => fileInputRefs.current[org.id]?.click()}
                          className="text-xs text-brand-400 hover:text-brand-300 disabled:opacity-50"
                        >
                          {uploadingLogoId === org.id ? "アップロード中..." : "ロゴを設定"}
                        </button>
                      </>
                    )}
                  </div>
                </td>
                <td className="px-4 py-3 text-slate-200">
                  {editingId === org.id ? (
                    <input
                      type="text"
                      value={editName}
                      onChange={(e) => setEditName(e.target.value)}
                      onKeyDown={(e) => {
                        if (e.key === "Enter") handleSave(org.id);
                        if (e.key === "Escape") {
                          setEditingId(null);
                          setEditName("");
                        }
                      }}
                      className="w-full max-w-xs rounded border border-slate-600 bg-slate-900 px-2 py-1 text-slate-100 outline-none focus:border-brand-500"
                      autoFocus
                    />
                  ) : (
                    <span>
                      {org.name}
                      {org.id === DEFAULT_ORG_ID && (
                        <span className="ml-2 text-xs text-slate-500">
                          （WEB登録のデフォルト）
                        </span>
                      )}
                    </span>
                  )}
                </td>
                <td className="px-4 py-3 text-slate-400">
                  {new Date(org.created_at).toLocaleDateString("ja-JP")}
                </td>
                <td className="px-4 py-3">
                  {editingId === org.id ? (
                    <div className="flex gap-2">
                      <button
                        type="button"
                        onClick={() => handleSave(org.id)}
                        className="text-brand-400 hover:text-brand-300"
                      >
                        保存
                      </button>
                      <button
                        type="button"
                        onClick={() => {
                          setEditingId(null);
                          setEditName("");
                        }}
                        className="text-slate-400 hover:text-slate-300"
                      >
                        キャンセル
                      </button>
                    </div>
                  ) : (
                    <button
                      type="button"
                      onClick={() => {
                        setEditingId(org.id);
                        setEditName(org.name);
                      }}
                      className="text-brand-400 hover:text-brand-300"
                    >
                      編集
                    </button>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {list.length === 0 && (
        <p className="mt-4 text-slate-500">企業がありません。マイグレーションで AIKEN が作成されているはずです。</p>
      )}
    </div>
  );
}
