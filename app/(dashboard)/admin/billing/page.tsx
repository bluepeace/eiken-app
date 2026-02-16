"use client";

import { useEffect, useState, useMemo } from "react";
import Link from "next/link";
import { adminGetUsers } from "@/lib/data/admin-db";
import {
  getSubscriptionDisplayStatus,
  getSubscriptionSourceLabel
} from "@/lib/subscription";
import { PREMIUM_MONTHLY_PRICE } from "@/lib/constants/billing";

export default function AdminBillingPage() {
  const [users, setUsers] = useState<Awaited<ReturnType<typeof adminGetUsers>>>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [filterStatus, setFilterStatus] = useState<"all" | "active" | "canceled" | "free">("all");
  const [searchQuery, setSearchQuery] = useState("");

  useEffect(() => {
    const load = async () => {
      try {
        const data = await adminGetUsers();
        setUsers(data);
      } catch (e) {
        setError(e instanceof Error ? e.message : "読み込みに失敗しました");
      } finally {
        setLoading(false);
      }
    };
    void load();
  }, []);

  const filteredUsers = useMemo(() => {
    let list = users;
    if (filterStatus === "active") {
      list = list.filter((u) => u.subscription_status === "active" || u.subscription_status === "trialing");
    } else if (filterStatus === "canceled") {
      list = list.filter(
        (u) =>
          u.subscription_status === "canceled" ||
          u.subscription_status === "unpaid" ||
          u.subscription_status === "past_due"
      );
    } else if (filterStatus === "free") {
      list = list.filter((u) => !u.subscription_status || u.subscription_status === "free");
    }
    if (searchQuery.trim()) {
      const q = searchQuery.trim().toLowerCase();
      list = list.filter((u) => {
        const idStr = String(u.display_id);
        const name = (u.display_name ?? "").toLowerCase();
        const email = (u.email ?? "").toLowerCase();
        return idStr.includes(q) || name.includes(q) || email.includes(q);
      });
    }
    return list;
  }, [users, filterStatus, searchQuery]);

  const stats = useMemo(() => {
    const active = users.filter(
      (u) => u.subscription_status === "active" || u.subscription_status === "trialing"
    ).length;
    const canceled = users.filter(
      (u) =>
        u.subscription_status === "canceled" ||
        u.subscription_status === "unpaid" ||
        u.subscription_status === "past_due"
    ).length;
    const free = users.filter((u) => !u.subscription_status || u.subscription_status === "free").length;
    return { active, canceled, free, mrr: active * PREMIUM_MONTHLY_PRICE };
  }, [users]);

  if (loading) {
    return <p className="text-slate-400">読み込み中...</p>;
  }

  if (error) {
    return (
      <p className="rounded-lg border border-red-800 bg-red-950/30 px-4 py-3 text-red-300">
        {error}
      </p>
    );
  }

  return (
    <div>
      <h1 className="mb-6 text-xl font-semibold text-slate-100">決済管理</h1>

      <div className="mb-6 grid grid-cols-2 gap-4 sm:grid-cols-4">
        <div className="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
          <p className="text-xs text-slate-500">継続中</p>
          <p className="text-2xl font-semibold text-emerald-400">{stats.active}</p>
        </div>
        <div className="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
          <p className="text-xs text-slate-500">解約済</p>
          <p className="text-2xl font-semibold text-slate-300">{stats.canceled}</p>
        </div>
        <div className="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
          <p className="text-xs text-slate-500">未契約</p>
          <p className="text-2xl font-semibold text-slate-400">{stats.free}</p>
        </div>
        <div className="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
          <p className="text-xs text-slate-500">MRR（月額換算）</p>
          <p className="text-2xl font-semibold text-brand-400">
            ¥{stats.mrr.toLocaleString()}
          </p>
        </div>
      </div>

      <p className="mb-4 text-sm text-slate-500">
        月額 ¥{PREMIUM_MONTHLY_PRICE.toLocaleString()} / ステータス: 継続・解約・未契約
      </p>

      <div className="mb-4 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div className="flex flex-wrap items-center gap-2">
          <button
            type="button"
            onClick={() => setFilterStatus("all")}
            className={`rounded-lg px-3 py-1.5 text-sm ${
              filterStatus === "all"
                ? "bg-brand-600 text-white"
                : "border border-slate-600 text-slate-400 hover:bg-slate-800"
            }`}
          >
            全て
          </button>
          <button
            type="button"
            onClick={() => setFilterStatus("active")}
            className={`rounded-lg px-3 py-1.5 text-sm ${
              filterStatus === "active"
                ? "bg-emerald-600 text-white"
                : "border border-slate-600 text-slate-400 hover:bg-slate-800"
            }`}
          >
            継続中
          </button>
          <button
            type="button"
            onClick={() => setFilterStatus("canceled")}
            className={`rounded-lg px-3 py-1.5 text-sm ${
              filterStatus === "canceled"
                ? "bg-amber-600 text-white"
                : "border border-slate-600 text-slate-400 hover:bg-slate-800"
            }`}
          >
            解約済
          </button>
          <button
            type="button"
            onClick={() => setFilterStatus("free")}
            className={`rounded-lg px-3 py-1.5 text-sm ${
              filterStatus === "free"
                ? "bg-slate-600 text-white"
                : "border border-slate-600 text-slate-400 hover:bg-slate-800"
            }`}
          >
            未契約
          </button>
        </div>
        <div className="relative max-w-xs flex-1">
          <input
            type="search"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder="ID・名前・メールで検索"
            className="w-full rounded-lg border border-slate-700 bg-slate-900 px-3 py-2 pl-9 text-sm text-slate-100 placeholder-slate-500 outline-none focus:border-brand-500"
          />
          <svg
            className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-500"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
            />
          </svg>
        </div>
      </div>

      <div className="overflow-x-auto rounded-lg border border-slate-700">
        <table className="w-full text-left text-sm">
          <thead className="border-b border-slate-700 bg-slate-800/50">
            <tr>
              <th className="px-4 py-3 font-medium text-slate-300">ID</th>
              <th className="px-4 py-3 font-medium text-slate-300">メール</th>
              <th className="px-4 py-3 font-medium text-slate-300">表示名</th>
              <th className="px-4 py-3 font-medium text-slate-300">ステータス</th>
              <th className="px-4 py-3 font-medium text-slate-300">課金ソース</th>
              <th className="px-4 py-3 font-medium text-slate-300">期間終了</th>
              <th className="px-4 py-3 font-medium text-slate-300" />
            </tr>
          </thead>
          <tbody>
            {filteredUsers.map((u) => {
              const statusLabel = getSubscriptionDisplayStatus(u.subscription_status);
              const sourceLabel = getSubscriptionSourceLabel(u.subscription_source);
              const isActive = u.subscription_status === "active" || u.subscription_status === "trialing";
              return (
                <tr
                  key={u.id}
                  className="border-b border-slate-800 transition hover:bg-slate-800/30"
                >
                  <td className="px-4 py-3 font-mono text-slate-300">{u.display_id}</td>
                  <td className="px-4 py-3 text-slate-200">{u.email ?? "-"}</td>
                  <td className="px-4 py-3 text-slate-200">{u.display_name ?? "-"}</td>
                  <td className="px-4 py-3">
                    <span
                      className={`rounded px-2 py-0.5 text-xs ${
                        isActive
                          ? "bg-emerald-900/50 text-emerald-300"
                          : statusLabel === "解約"
                            ? "bg-amber-900/50 text-amber-300"
                            : "bg-slate-700 text-slate-400"
                      }`}
                    >
                      {statusLabel}
                    </span>
                  </td>
                  <td className="px-4 py-3 text-slate-400">{sourceLabel}</td>
                  <td className="px-4 py-3 text-slate-400">
                    {u.subscription_current_period_end
                      ? new Date(u.subscription_current_period_end).toLocaleDateString("ja-JP")
                      : "-"}
                  </td>
                  <td className="px-4 py-3">
                    <Link
                      href={`/admin/users/${u.id}`}
                      className="text-brand-400 hover:text-brand-300 hover:underline"
                    >
                      編集
                    </Link>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>

      {filteredUsers.length === 0 && (
        <p className="mt-6 text-center text-slate-500">
          {searchQuery || filterStatus !== "all"
            ? "条件に一致するユーザーはいません"
            : "ユーザーはいません"}
        </p>
      )}

      <p className="mt-6 text-xs text-slate-500">
        手動でプレミアムを付与する場合は、ユーザー編集画面でステータスを「継続」に変更し、課金ソースを「手動」に設定してください。（ビジネス会員・銀行振込など）
      </p>
    </div>
  );
}
