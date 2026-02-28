"use client";

import { useState } from "react";
import Link from "next/link";
import { supabase } from "@/lib/supabase/client";

export default function ForgotPasswordPage() {
  const [email, setEmail] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [sent, setSent] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setIsLoading(true);
    try {
      const redirectTo =
        typeof window !== "undefined"
          ? `${window.location.origin}/reset-password`
          : undefined;
      const { error: resetError } = await supabase.auth.resetPasswordForEmail(
        email.trim(),
        { redirectTo }
      );
      if (resetError) throw resetError;
      setSent(true);
    } catch (err) {
      setError(
        err && typeof err === "object" && "message" in err
          ? String((err as { message: unknown }).message)
          : "送信に失敗しました。"
      );
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
      <div className="w-full max-w-md space-y-6 rounded-3xl border border-slate-200 bg-white p-8 shadow-sm">
        <div className="space-y-2">
          <h1 className="text-2xl font-semibold tracking-tight text-slate-900">
            パスワードをリセット
          </h1>
          <p className="text-sm text-slate-600">
            登録したメールアドレスを入力してください。パスワード再設定用のリンクをお送りします。
          </p>
        </div>

        {sent ? (
          <div className="space-y-4">
            <p className="rounded-lg border border-green-200 bg-green-50 px-3 py-2 text-sm text-green-800">
              送信しました。メールをご確認ください。リンクをクリックして新しいパスワードを設定できます。
            </p>
            <Link
              href="/login"
              className="block text-center text-sm font-medium text-[#009DC9] hover:underline"
            >
              サインイン画面へ戻る
            </Link>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-4">
            <div className="space-y-2">
              <label className="block text-xs font-medium text-slate-800">
                メールアドレス
              </label>
              <input
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 outline-none focus:border-brand-400 focus:ring-2 focus:ring-brand-200"
                placeholder="you@example.com"
              />
            </div>

            {error && (
              <p className="text-xs text-red-700 bg-red-50 border border-red-200 rounded-md px-3 py-2">
                {error}
              </p>
            )}

            <button
              type="submit"
              disabled={isLoading}
              className="flex w-full items-center justify-center rounded-full bg-[#009DC9] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#0087A8] disabled:opacity-60"
            >
              {isLoading ? "送信中..." : "送信する"}
            </button>
          </form>
        )}

        <p className="text-center">
          <Link
            href="/login"
            className="text-sm text-slate-500 hover:text-slate-700"
          >
            ← サインインへ戻る
          </Link>
        </p>
      </div>
    </main>
  );
}
