"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { supabase } from "@/lib/supabase/client";
import { adminGetOrganizations, type AdminOrganization } from "@/lib/data/admin-db";

export default function AdminUserNewPage() {
  const [organizations, setOrganizations] = useState<AdminOrganization[]>([]);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [organizationId, setOrganizationId] = useState<string>("1");
  const [displayName, setDisplayName] = useState("");
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);

  useEffect(() => {
    const load = async () => {
      try {
        const orgs = await adminGetOrganizations();
        setOrganizations(orgs);
      } catch (e) {
        setError(e instanceof Error ? e.message : "読み込みに失敗しました");
      } finally {
        setLoading(false);
      }
    };
    void load();
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setMessage(null);
    setSubmitting(true);
    try {
      const { data: { session } } = await supabase.auth.getSession();
      if (!session?.access_token) {
        setError("ログインし直してください");
        setSubmitting(false);
        return;
      }
      const res = await fetch("/api/admin/create-user", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          access_token: session.access_token,
          email: email.trim(),
          password,
          organization_id: parseInt(organizationId, 10) || 1,
          display_name: displayName.trim() || undefined
        })
      });
      const json = await res.json();
      if (!res.ok) {
        setError(json.error ?? "登録に失敗しました");
        setSubmitting(false);
        return;
      }
      setMessage(json.message ?? "会員を登録しました");
      setEmail("");
      setPassword("");
      setDisplayName("");
    } catch (e) {
      setError(e instanceof Error ? e.message : "登録に失敗しました");
    } finally {
      setSubmitting(false);
    }
  };

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  return (
    <div>
      <div className="mb-6 flex items-center gap-4">
        <Link
          href="/admin/users"
          className="text-sm text-slate-400 hover:text-brand-300"
        >
          ← ユーザー一覧
        </Link>
      </div>
      <h1 className="mb-6 text-xl font-semibold text-slate-100">
        会員を手動登録
      </h1>
      <p className="mb-4 text-sm text-slate-400">
        企業契約で追加する会員は、所属企業を選んで登録してください。WEBから登録する会員は「AIKEN」に所属します。
      </p>

      <form onSubmit={handleSubmit} className="max-w-md space-y-4">
        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">
            メールアドレス <span className="text-red-400">*</span>
          </label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          />
        </div>
        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">
            パスワード <span className="text-red-400">*</span>
          </label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            minLength={6}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          />
          <p className="mt-1 text-xs text-slate-500">6文字以上</p>
        </div>
        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">
            所属企業 <span className="text-red-400">*</span>
          </label>
          <select
            value={organizationId}
            onChange={(e) => setOrganizationId(e.target.value)}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          >
            {organizations.map((org) => (
              <option key={org.id} value={String(org.id)}>
                {org.name}
              </option>
            ))}
          </select>
        </div>
        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">
            表示名（任意）
          </label>
          <input
            type="text"
            value={displayName}
            onChange={(e) => setDisplayName(e.target.value)}
            placeholder="ニックネーム"
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 placeholder-slate-500 outline-none focus:border-brand-500"
          />
        </div>
        {error && (
          <p className="rounded-lg border border-red-800 bg-red-950/30 px-4 py-3 text-sm text-red-300">
            {error}
          </p>
        )}
        {message && (
          <p className="rounded-lg border border-emerald-800 bg-emerald-950/30 px-4 py-3 text-sm text-emerald-300">
            {message}
          </p>
        )}
        <div className="flex gap-3">
          <button
            type="submit"
            disabled={submitting}
            className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500 disabled:opacity-60"
          >
            {submitting ? "登録中..." : "登録する"}
          </button>
          <Link
            href="/admin/users"
            className="rounded-lg border border-slate-600 px-4 py-2 text-sm text-slate-300 hover:bg-slate-800"
          >
            キャンセル
          </Link>
        </div>
      </form>
    </div>
  );
}
