"use client";

import { useEffect, useState, useRef } from "react";
import {
  adminGetOrganizations,
  adminCreateOrganization,
  adminUpdateOrganization,
  adminGetOrganizationAdmin,
  adminSetOrganizationAdmin,
  adminRemoveOrganizationAdmin,
  adminGetUsers,
  type AdminOrganization,
} from "@/lib/data/admin-db";
import { supabase } from "@/lib/supabase/client";

const DEFAULT_ORG_ID = 1;

export default function AdminOrganizationsPage() {
  const [list, setList] = useState<AdminOrganization[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState("");
  const [addModalOpen, setAddModalOpen] = useState(false);
  const [editModalOrg, setEditModalOrg] = useState<AdminOrganization | null>(null);
  const [adding, setAdding] = useState(false);
  const [saving, setSaving] = useState(false);
  const [uploadingLogoId, setUploadingLogoId] = useState<number | null>(null);
  const [adminModalOrg, setAdminModalOrg] = useState<AdminOrganization | null>(null);
  const [orgAdmins, setOrgAdmins] = useState<Record<number, { id: string; email: string | null; display_name: string | null } | null>>({});
  const [adminSearchEmail, setAdminSearchEmail] = useState("");
  const [adminSearchResults, setAdminSearchResults] = useState<{ id: string; email: string | null; display_name: string | null }[]>([]);
  const [settingAdmin, setSettingAdmin] = useState(false);
  const fileInputRefs = useRef<Record<number, HTMLInputElement | null>>({});

  const load = async (): Promise<AdminOrganization[]> => {
    try {
      const rows = await adminGetOrganizations();
      setList(rows);
      return rows;
    } catch (e) {
      setError(e instanceof Error ? e.message : "読み込みに失敗しました");
      return [];
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    void load();
  }, []);

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") {
        setAddModalOpen(false);
        setEditModalOrg(null);
        setAdminModalOrg(null);
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, []);

  const loadOrgAdmins = async (orgs: AdminOrganization[]) => {
    const admins: Record<number, { id: string; email: string | null; display_name: string | null } | null> = {};
    for (const org of orgs) {
      const a = await adminGetOrganizationAdmin(org.id);
      admins[org.id] = a;
    }
    setOrgAdmins(admins);
  };

  useEffect(() => {
    if (list.length > 0) void loadOrgAdmins(list);
  }, [list]);

  const handleAdminSearch = async () => {
    const q = adminSearchEmail.trim().toLowerCase();
    if (!q) return;
    const users = await adminGetUsers();
    const matches = users
      .filter((u) => (u.email ?? "").toLowerCase().includes(q))
      .slice(0, 10)
      .map((u) => ({ id: u.id, email: u.email, display_name: u.display_name }));
    setAdminSearchResults(matches);
  };

  const handleSetAdmin = async (profileId: string) => {
    if (!adminModalOrg) return;
    setError(null);
    setMessage(null);
    setSettingAdmin(true);
    try {
      await adminSetOrganizationAdmin(adminModalOrg.id, profileId);
      await loadOrgAdmins();
      setAdminModalOrg(null);
      setAdminSearchEmail("");
      setAdminSearchResults([]);
      setMessage("企業管理者を設定しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "設定に失敗しました");
    } finally {
      setSettingAdmin(false);
    }
  };

  const handleRemoveAdmin = async () => {
    if (!adminModalOrg) return;
    const current = orgAdmins[adminModalOrg.id];
    if (!current) return;
    setError(null);
    setMessage(null);
    setSettingAdmin(true);
    try {
      await adminRemoveOrganizationAdmin(current.id);
      await loadOrgAdmins(list);
      setAdminModalOrg(null);
      setMessage("企業管理者を解除しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "解除に失敗しました");
    } finally {
      setSettingAdmin(false);
    }
  };

  const handleAdd = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const form = e.currentTarget;
    const name = (form.elements.namedItem("add-name") as HTMLInputElement)?.value?.trim();
    if (!name) {
      setError("企業名を入力してください");
      return;
    }
    setError(null);
    setMessage(null);
    setAdding(true);
    try {
      await adminCreateOrganization(name);
      setAddModalOpen(false);
      form.reset();
      await load();
      setMessage(`企業「${name}」を追加しました`);
    } catch (e) {
      setError(e instanceof Error ? e.message : "追加に失敗しました");
    } finally {
      setAdding(false);
    }
  };

  const handleEditSave = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (!editModalOrg) return;
    const form = e.currentTarget;
    const name = (form.elements.namedItem("edit-name") as HTMLInputElement)?.value?.trim();
    if (!name) {
      setError("企業名を入力してください");
      return;
    }
    setError(null);
    setMessage(null);
    setSaving(true);
    try {
      await adminUpdateOrganization(editModalOrg.id, { name });
      setEditModalOrg(null);
      await load();
      setMessage("企業を更新しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "更新に失敗しました");
    } finally {
      setSaving(false);
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
      const rows = await load();
      if (editModalOrg?.id === orgId) {
        const updated = rows.find((o) => o.id === orgId);
        if (updated) setEditModalOrg(updated);
      }
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
      if (editModalOrg?.id === orgId) {
        setEditModalOrg((prev) => (prev ? { ...prev, logo_url: null } : null));
      }
      setMessage("ロゴを削除しました");
    } catch (e) {
      setError(e instanceof Error ? e.message : "ロゴの削除に失敗しました");
    }
  };

  const filteredList = searchQuery.trim()
    ? list.filter((org) =>
        org.name.toLowerCase().includes(searchQuery.trim().toLowerCase())
      )
    : list;

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

      {/* 検索フォーム */}
      <div className="mb-6 flex flex-wrap items-center gap-3">
        <input
          type="search"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          placeholder="企業名で検索"
          className="rounded-lg border border-slate-600 bg-slate-900 px-3 py-2 text-sm text-slate-100 placeholder-slate-500 outline-none focus:border-brand-500 w-64"
        />
        <button
          type="button"
          onClick={() => setAddModalOpen(true)}
          className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500"
        >
          企業を追加
        </button>
      </div>

      <div className="overflow-x-auto rounded-lg border border-slate-700">
        <table className="w-full text-left text-sm">
          <thead className="border-b border-slate-700 bg-slate-800/50">
            <tr>
              <th className="px-4 py-3 font-medium text-slate-300">ID</th>
              <th className="px-4 py-3 font-medium text-slate-300">ロゴ</th>
              <th className="px-4 py-3 font-medium text-slate-300">企業名</th>
              <th className="px-4 py-3 font-medium text-slate-300">管理者</th>
              <th className="px-4 py-3 font-medium text-slate-300">登録日</th>
              <th className="px-4 py-3 font-medium text-slate-300" />
            </tr>
          </thead>
          <tbody>
            {filteredList.map((org) => (
              <tr
                key={org.id}
                className="border-b border-slate-800 transition hover:bg-slate-800/30"
              >
                <td className="px-4 py-3 font-mono text-slate-300">{org.id}</td>
                <td className="px-4 py-3">
                  {org.logo_url ? (
                    <img
                      src={org.logo_url}
                      alt=""
                      className="h-10 w-10 rounded border border-slate-600 object-contain bg-slate-800"
                    />
                  ) : (
                    <div className="flex h-10 w-10 items-center justify-center rounded border border-dashed border-slate-600 bg-slate-800/50 text-xs text-slate-500">
                      未設定
                    </div>
                  )}
                </td>
                <td className="px-4 py-3 text-slate-200">
                  <span>
                    {org.name}
                    {org.id === DEFAULT_ORG_ID && (
                      <span className="ml-2 text-xs text-slate-500">
                        （WEB登録のデフォルト）
                      </span>
                    )}
                  </span>
                </td>
                <td className="px-4 py-3">
                  {orgAdmins[org.id] ? (
                    <div className="flex flex-col gap-0.5">
                      <span className="text-sm text-slate-200">
                        {orgAdmins[org.id]!.display_name || orgAdmins[org.id]!.email || "—"}
                      </span>
                      {orgAdmins[org.id]!.email && (
                        <span className="text-xs text-slate-500">{orgAdmins[org.id]!.email}</span>
                      )}
                      <button
                        type="button"
                        onClick={() => setAdminModalOrg(org)}
                        className="text-xs text-brand-400 hover:text-brand-300"
                      >
                        変更
                      </button>
                    </div>
                  ) : (
                    <button
                      type="button"
                      onClick={() => setAdminModalOrg(org)}
                      className="text-sm text-brand-400 hover:text-brand-300"
                    >
                      管理者を設定
                    </button>
                  )}
                </td>
                <td className="px-4 py-3 text-slate-400">
                  {new Date(org.created_at).toLocaleDateString("ja-JP")}
                </td>
                <td className="px-4 py-3">
                  <button
                    type="button"
                    onClick={() => setEditModalOrg(org)}
                    className="text-brand-400 hover:text-brand-300"
                  >
                    編集
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {filteredList.length === 0 && (
        <p className="mt-4 text-slate-500">
          {searchQuery.trim() ? "検索条件に一致する企業がありません。" : "企業がありません。マイグレーションで AIKEN が作成されているはずです。"}
        </p>
      )}

      {/* 企業登録モーダル */}
      {addModalOpen && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4"
          onClick={() => setAddModalOpen(false)}
        >
          <div
            className="w-full max-w-md rounded-xl border border-slate-700 bg-slate-900 p-6 shadow-xl"
            onClick={(e) => e.stopPropagation()}
          >
            <h2 className="mb-4 text-lg font-semibold text-slate-100">企業を登録</h2>
            <form onSubmit={handleAdd} className="space-y-4">
              <div>
                <label htmlFor="add-name" className="mb-1 block text-sm font-medium text-slate-300">
                  企業名
                </label>
                <input
                  id="add-name"
                  name="add-name"
                  type="text"
                  required
                  placeholder="例: 株式会社サンプル"
                  className="w-full rounded-lg border border-slate-600 bg-slate-800 px-3 py-2 text-sm text-slate-100 placeholder-slate-500 outline-none focus:border-brand-500"
                  disabled={adding}
                />
              </div>
              <div className="flex justify-end gap-2">
                <button
                  type="button"
                  onClick={() => setAddModalOpen(false)}
                  className="rounded-lg border border-slate-600 px-4 py-2 text-sm text-slate-300 hover:bg-slate-800"
                >
                  キャンセル
                </button>
                <button
                  type="submit"
                  disabled={adding}
                  className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500 disabled:opacity-50"
                >
                  {adding ? "登録中..." : "登録"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* 企業管理者設定モーダル */}
      {adminModalOrg && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4"
          onClick={() => {
            setAdminModalOrg(null);
            setAdminSearchEmail("");
            setAdminSearchResults([]);
          }}
        >
          <div
            className="w-full max-w-md rounded-xl border border-slate-700 bg-slate-900 p-6 shadow-xl"
            onClick={(e) => e.stopPropagation()}
          >
            <h2 className="mb-4 text-lg font-semibold text-slate-100">
              {adminModalOrg.name} の管理者
            </h2>
            {orgAdmins[adminModalOrg.id] ? (
              <div className="mb-4">
                <p className="text-sm text-slate-300">
                  現在: {orgAdmins[adminModalOrg.id]!.display_name || "—"}（{orgAdmins[adminModalOrg.id]!.email || "メール未設定"}）
                </p>
                <button
                  type="button"
                  onClick={handleRemoveAdmin}
                  disabled={settingAdmin}
                  className="mt-1 text-sm text-red-400 hover:text-red-300 disabled:opacity-50"
                >
                  管理者を解除
                </button>
              </div>
            ) : null}
            <div className="mt-4 space-y-3">
              <label className="block text-sm font-medium text-slate-300">
                メールアドレスで検索して設定
              </label>
              <div className="flex gap-2">
                <input
                  type="email"
                  value={adminSearchEmail}
                  onChange={(e) => setAdminSearchEmail(e.target.value)}
                  onKeyDown={(e) => e.key === "Enter" && (e.preventDefault(), handleAdminSearch())}
                  placeholder="例: admin@example.com"
                  className="flex-1 rounded-lg border border-slate-600 bg-slate-800 px-3 py-2 text-sm text-slate-100 placeholder-slate-500 outline-none focus:border-brand-500"
                />
                <button
                  type="button"
                  onClick={handleAdminSearch}
                  className="rounded-lg border border-slate-600 px-4 py-2 text-sm text-slate-300 hover:bg-slate-800"
                >
                  検索
                </button>
              </div>
              {adminSearchResults.length > 0 && (
                <ul className="max-h-40 overflow-y-auto rounded-lg border border-slate-700 bg-slate-800/50 py-1">
                  {adminSearchResults.map((u) => (
                    <li key={u.id}>
                      <button
                        type="button"
                        onClick={() => handleSetAdmin(u.id)}
                        disabled={settingAdmin}
                        className="w-full px-4 py-2 text-left text-sm text-slate-200 hover:bg-slate-700/50 disabled:opacity-50"
                      >
                        {u.display_name || "—"}（{u.email || "—"}）
                      </button>
                    </li>
                  ))}
                </ul>
              )}
            </div>
            <div className="mt-4 flex justify-end">
              <button
                type="button"
                onClick={() => {
                  setAdminModalOrg(null);
                  setAdminSearchEmail("");
                  setAdminSearchResults([]);
                }}
                className="rounded-lg border border-slate-600 px-4 py-2 text-sm text-slate-300 hover:bg-slate-800"
              >
                閉じる
              </button>
            </div>
          </div>
        </div>
      )}

      {/* 企業編集モーダル */}
      {editModalOrg && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4"
          onClick={() => setEditModalOrg(null)}
        >
          <div
            className="w-full max-w-md rounded-xl border border-slate-700 bg-slate-900 p-6 shadow-xl"
            onClick={(e) => e.stopPropagation()}
          >
            <h2 className="mb-4 text-lg font-semibold text-slate-100">企業を編集</h2>
            <form onSubmit={handleEditSave} className="space-y-4">
              <div>
                <label htmlFor="edit-name" className="mb-1 block text-sm font-medium text-slate-300">
                  企業名
                </label>
                <input
                  id="edit-name"
                  name="edit-name"
                  type="text"
                  required
                  defaultValue={editModalOrg.name}
                  placeholder="例: 株式会社サンプル"
                  className="w-full rounded-lg border border-slate-600 bg-slate-800 px-3 py-2 text-sm text-slate-100 placeholder-slate-500 outline-none focus:border-brand-500"
                  disabled={saving}
                />
              </div>
              <div>
                <label className="mb-1 block text-sm font-medium text-slate-300">ロゴ</label>
                <div className="flex items-center gap-4">
                  {editModalOrg.logo_url ? (
                    <>
                      <img
                        src={editModalOrg.logo_url}
                        alt=""
                        className="h-16 w-16 rounded border border-slate-600 object-contain bg-slate-800"
                      />
                      <div className="flex flex-col gap-1">
                        <input
                          ref={(el) => { fileInputRefs.current[editModalOrg.id] = el; }}
                          type="file"
                          accept="image/*"
                          className="hidden"
                          onChange={(e) => handleLogoUpload(editModalOrg.id, e)}
                        />
                        <button
                          type="button"
                          disabled={uploadingLogoId === editModalOrg.id}
                          onClick={() => fileInputRefs.current[editModalOrg.id]?.click()}
                          className="text-sm text-brand-400 hover:text-brand-300 disabled:opacity-50"
                        >
                          {uploadingLogoId === editModalOrg.id ? "アップロード中..." : "変更"}
                        </button>
                        <button
                          type="button"
                          onClick={() => handleLogoRemove(editModalOrg.id)}
                          className="text-sm text-slate-400 hover:text-red-400"
                        >
                          削除
                        </button>
                      </div>
                    </>
                  ) : (
                    <>
                      <div className="flex h-16 w-16 items-center justify-center rounded border border-dashed border-slate-600 bg-slate-800/50 text-xs text-slate-500">
                        未設定
                      </div>
                      <input
                        ref={(el) => { fileInputRefs.current[editModalOrg.id] = el; }}
                        type="file"
                        accept="image/*"
                        className="hidden"
                        onChange={(e) => handleLogoUpload(editModalOrg.id, e)}
                      />
                      <button
                        type="button"
                        disabled={uploadingLogoId === editModalOrg.id}
                        onClick={() => fileInputRefs.current[editModalOrg.id]?.click()}
                        className="text-sm text-brand-400 hover:text-brand-300 disabled:opacity-50"
                      >
                        {uploadingLogoId === editModalOrg.id ? "アップロード中..." : "ロゴを設定"}
                      </button>
                    </>
                  )}
                </div>
              </div>
              <div className="flex justify-end gap-2 pt-2">
                <button
                  type="button"
                  onClick={() => setEditModalOrg(null)}
                  className="rounded-lg border border-slate-600 px-4 py-2 text-sm text-slate-300 hover:bg-slate-800"
                >
                  キャンセル
                </button>
                <button
                  type="submit"
                  disabled={saving}
                  className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500 disabled:opacity-50"
                >
                  {saving ? "保存中..." : "保存"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
