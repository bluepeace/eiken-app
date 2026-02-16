"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { supabase } from "@/lib/supabase/client";

export default function SubscribePage() {
  const [loading, setLoading] = useState(true);
  const [checkingOut, setCheckingOut] = useState(false);
  const [user, setUser] = useState<{ id: string; email?: string } | null>(null);
  const [subscriptionStatus, setSubscriptionStatus] = useState<string | null>(
    null
  );
  const [error, setError] = useState("");

  useEffect(() => {
    const load = async () => {
      const {
        data: { user: u }
      } = await supabase.auth.getUser();
      if (!u) {
        setLoading(false);
        return;
      }
      setUser({ id: u.id, email: u.email ?? undefined });

      const { data: profile } = await supabase
        .from("user_profiles")
        .select("subscription_status")
        .eq("auth_user_id", u.id)
        .maybeSingle();

      setSubscriptionStatus(profile?.subscription_status ?? "free");
      setLoading(false);
    };
    void load();
  }, []);

  const handleSubscribe = async () => {
    if (!user?.email) {
      setError("メールアドレスが設定されていません");
      return;
    }
    setError("");
    setCheckingOut(true);
    try {
      const res = await fetch("/api/stripe/checkout", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          auth_user_id: user.id,
          email: user.email
        })
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "決済の準備に失敗しました");
      if (data.url) {
        window.location.href = data.url;
      } else {
        throw new Error("Checkout URL が取得できませんでした");
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : "エラーが発生しました");
      setCheckingOut(false);
    }
  };

  const handleManageSubscription = async () => {
    if (!user) return;
    setError("");
    setCheckingOut(true);
    try {
      const res = await fetch("/api/stripe/portal", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ auth_user_id: user.id })
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error ?? "ポータルの準備に失敗しました");
      if (data.url) {
        window.location.href = data.url;
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : "エラーが発生しました");
      setCheckingOut(false);
    }
  };

  if (loading) {
    return (
      <main className="mx-auto max-w-2xl px-4 py-12">
        <p className="text-slate-600">読み込み中...</p>
      </main>
    );
  }

  if (!user) {
    return (
      <main className="mx-auto max-w-2xl px-4 py-12">
        <div className="rounded-2xl border border-slate-200 bg-white p-8 text-center shadow-sm">
          <h1 className="text-xl font-semibold text-slate-900">
            プレミアムプラン
          </h1>
          <p className="mt-2 text-slate-600">
            プレミアムプランをご利用いただくには、ログインが必要です。
          </p>
          <Link
            href="/login"
            className="mt-6 inline-flex rounded-full bg-[#50c2cb] px-6 py-2.5 text-sm font-semibold text-white hover:bg-[#46adb5]"
          >
            ログイン
          </Link>
        </div>
      </main>
    );
  }

  const isActive =
    subscriptionStatus === "active" || subscriptionStatus === "trialing";

  return (
    <main className="mx-auto max-w-2xl px-4 py-12">
      <div className="rounded-2xl border border-slate-200 bg-white p-8 shadow-sm">
        <h1 className="text-2xl font-semibold text-slate-900">
          プレミアムプラン
        </h1>
        <p className="mt-2 text-slate-600">
          AI添削を無制限にご利用いただけます。
        </p>

        <div className="mt-8 rounded-xl border border-slate-200 bg-slate-50/50 p-6">
          <p className="text-2xl font-bold text-slate-900">
            ¥980 <span className="text-sm font-normal text-slate-500">/ 月</span>
          </p>
          <ul className="mt-4 space-y-2 text-sm text-slate-600">
            <li>✓ ライティング AI 添削を無制限に利用</li>
            <li>✓ 単語学習の全級にアクセス</li>
            <li>✓ いつでも解約可能</li>
          </ul>
        </div>

        {error && (
          <p className="mt-4 text-sm text-red-600">{error}</p>
        )}

        {isActive ? (
          <button
            type="button"
            onClick={handleManageSubscription}
            disabled={checkingOut}
            className="mt-6 flex w-full items-center justify-center rounded-full border border-slate-300 bg-white px-4 py-2.5 text-sm font-semibold text-slate-800 hover:bg-slate-50 disabled:opacity-60"
          >
            {checkingOut ? "処理中..." : "サブスクリプションを管理"}
          </button>
        ) : (
          <button
            type="button"
            onClick={handleSubscribe}
            disabled={checkingOut}
            className="mt-6 flex w-full items-center justify-center rounded-full bg-[#50c2cb] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#46adb5] disabled:opacity-60"
          >
            {checkingOut ? "決済ページへ移動中..." : "プレミアムに登録"}
          </button>
        )}

        <div className="mt-4 flex flex-col items-center gap-2">
          <Link
            href="/tokushoho"
            className="text-xs text-slate-500 hover:text-slate-700 hover:underline"
          >
            特定商取引法に基づく表記
          </Link>
          <Link
            href="/dashboard"
            className="text-sm text-slate-500 hover:text-slate-700"
          >
            ダッシュボードに戻る
          </Link>
        </div>
      </div>
    </main>
  );
}
