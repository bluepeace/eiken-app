"use client";

import { useParams, useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import Link from "next/link";
import {
  adminGetUserProfile,
  adminUpdateUserProfile,
  adminGetOrganizations,
} from "@/lib/data/admin-db";
import type { AdminOrganization } from "@/lib/data/admin-db";

const LEVEL_OPTIONS = [
  "英検5級",
  "英検4級",
  "英検3級",
  "英検準2級",
  "英検準2級プラス",
  "英検2級",
  "英検準1級",
  "英検1級"
];

export default function AdminUserEditPage() {
  const params = useParams();
  const router = useRouter();
  const id = params.id as string;

  const [displayName, setDisplayName] = useState("");
  const [targetLevel, setTargetLevel] = useState("英検2級");
  const [role, setRole] = useState<"user" | "admin">("user");
  const [subscriptionStatus, setSubscriptionStatus] = useState<string>("free");
  const [subscriptionSource, setSubscriptionSource] = useState<string>("stripe");
  const [organizationId, setOrganizationId] = useState<string>("");
  const [organizations, setOrganizations] = useState<AdminOrganization[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);
  const [createdAt, setCreatedAt] = useState<string | null>(null);

  useEffect(() => {
    const load = async () => {
      try {
        const [data, orgs] = await Promise.all([
          adminGetUserProfile(id),
          adminGetOrganizations(),
        ]);
        setOrganizations(orgs);
        if (!data) {
          setError("ユーザーが見つかりません");
          return;
        }
        setDisplayName(data.display_name ?? "");
        setTargetLevel(
          data.target_level && LEVEL_OPTIONS.includes(data.target_level)
            ? data.target_level
            : "英検2級"
        );
        setRole((data.role as "user" | "admin") || "user");
        setSubscriptionStatus((data.subscription_status as string) ?? "free");
        setSubscriptionSource((data.subscription_source as string) ?? "stripe");
        setOrganizationId(
          data.organization_id != null ? String(data.organization_id) : "1"
        );
        setCreatedAt(data.created_at ?? null);
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
    setMessage(null);
    setSaving(true);
    try {
      await adminUpdateUserProfile(id, {
        display_name: displayName || null,
        target_level: targetLevel,
        role,
        subscription_status: subscriptionStatus,
        subscription_source: subscriptionSource === "manual" ? "manual" : "stripe",
        organization_id: organizationId ? parseInt(organizationId, 10) : 1,
      });
      setMessage("保存しました");
      setTimeout(() => setMessage(null), 3000);
    } catch (e) {
      setError(e instanceof Error ? e.message : "保存に失敗しました");
    } finally {
      setSaving(false);
    }
  };

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  if (error && !createdAt) {
    return (
      <div>
        <p className="mb-4 rounded-lg border border-red-800 bg-red-950/30 px-4 py-3 text-red-300">
          {error}
        </p>
        <Link href="/admin/users" className="text-brand-400 hover:underline">
          ← ユーザー一覧へ
        </Link>
      </div>
    );
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
        ユーザー編集
      </h1>

      <form onSubmit={handleSubmit} className="max-w-md space-y-4">
        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">
            表示名
          </label>
          <input
            type="text"
            value={displayName}
            onChange={(e) => setDisplayName(e.target.value)}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          />
        </div>
        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">
            所属企業
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
            目標級
          </label>
          <select
            value={targetLevel}
            onChange={(e) => setTargetLevel(e.target.value)}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          >
            {LEVEL_OPTIONS.map((l) => (
              <option key={l} value={l}>
                {l}
              </option>
            ))}
          </select>
        </div>
        <div>
          <label className="mb-1 block text-xs font-medium text-slate-400">
            ロール
          </label>
          <select
            value={role}
            onChange={(e) => setRole(e.target.value as "user" | "admin")}
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
          >
            <option value="user">user</option>
            <option value="admin">admin</option>
          </select>
        </div>
        <div className="rounded-lg border border-slate-700 bg-slate-900/50 p-4">
          <p className="mb-3 text-xs font-medium text-slate-400">プレミアム（課金）</p>
          <div className="space-y-3">
            <div>
              <label className="mb-1 block text-xs text-slate-500">ステータス</label>
              <select
                value={subscriptionStatus}
                onChange={(e) => setSubscriptionStatus(e.target.value)}
                className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
              >
                <option value="free">未契約</option>
                <option value="active">継続</option>
                <option value="canceled">解約</option>
                <option value="past_due">支払い遅延</option>
              </select>
            </div>
            <div>
              <label className="mb-1 block text-xs text-slate-500">課金ソース</label>
              <select
                value={subscriptionSource}
                onChange={(e) => setSubscriptionSource(e.target.value)}
                className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 text-slate-100 outline-none focus:border-brand-500"
              >
                <option value="stripe">Stripe（カード決済）</option>
                <option value="manual">手動（ビジネス会員・銀行振込等）</option>
              </select>
            </div>
          </div>
        </div>
        {createdAt && (
          <p className="text-xs text-slate-500">
            登録日: {new Date(createdAt).toLocaleString("ja-JP")}
          </p>
        )}
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
            disabled={saving}
            className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-medium text-white hover:bg-brand-500 disabled:opacity-60"
          >
            {saving ? "保存中..." : "保存"}
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
