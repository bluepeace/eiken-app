"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { HiEye, HiEyeSlash } from "react-icons/hi2";
import { supabase } from "@/lib/supabase/client";

export default function ResetPasswordPage() {
  const router = useRouter();
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
  const [ready, setReady] = useState(false);
  const [hasSession, setHasSession] = useState(false);

  useEffect(() => {
    const check = async () => {
      const {
        data: { session }
      } = await supabase.auth.getSession();
      setHasSession(!!session);
      setReady(true);
    };
    void check();
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    if (password !== confirmPassword) {
      setError("パスワードが一致しません。");
      return;
    }
    if (password.length < 8) {
      setError("パスワードは8文字以上で入力してください。");
      return;
    }
    setIsLoading(true);
    try {
      const { error: updateError } = await supabase.auth.updateUser({
        password: password.trim()
      });
      if (updateError) throw updateError;
      setSuccess(true);
      setTimeout(() => {
        router.replace("/dashboard");
      }, 2000);
    } catch (err) {
      setError(
        err && typeof err === "object" && "message" in err
          ? String((err as { message: unknown }).message)
          : "パスワードの更新に失敗しました。"
      );
    } finally {
      setIsLoading(false);
    }
  };

  if (!ready) {
    return (
      <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
        <p className="text-slate-600">読み込み中...</p>
      </main>
    );
  }

  if (!hasSession) {
    return (
      <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
        <div className="w-full max-w-md space-y-6 rounded-3xl border border-slate-200 bg-white p-8 shadow-sm text-center">
          <p className="text-slate-600">
            リンクの有効期限が切れているか、無効です。パスワードリセット用メールを再度お送りください。
          </p>
          <Link
            href="/forgot-password"
            className="inline-block rounded-full bg-[#009DC9] px-4 py-2.5 text-sm font-semibold text-white hover:bg-[#0087A8]"
          >
            パスワードをリセット
          </Link>
          <p>
            <Link href="/login" className="text-sm text-[#009DC9] hover:underline">
              サインインへ戻る
            </Link>
          </p>
        </div>
      </main>
    );
  }

  if (success) {
    return (
      <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
        <div className="w-full max-w-md space-y-6 rounded-3xl border border-slate-200 bg-white p-8 shadow-sm text-center">
          <p className="text-green-700 font-medium">
            パスワードを変更しました。ダッシュボードへ移動します…
          </p>
        </div>
      </main>
    );
  }

  return (
    <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
      <div className="w-full max-w-md space-y-6 rounded-3xl border border-slate-200 bg-white p-8 shadow-sm">
        <div className="space-y-2">
          <h1 className="text-2xl font-semibold tracking-tight text-slate-900">
            新しいパスワードを設定
          </h1>
          <p className="text-sm text-slate-600">
            8文字以上の新しいパスワードを入力してください。
          </p>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="space-y-2">
            <label className="block text-xs font-medium text-slate-800">
              新しいパスワード
            </label>
            <div className="relative">
              <input
                type={showPassword ? "text" : "password"}
                required
                minLength={8}
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 pr-10 text-sm text-slate-900 outline-none focus:border-brand-400 focus:ring-2 focus:ring-brand-200"
                placeholder="8文字以上"
              />
              <button
                type="button"
                onClick={() => setShowPassword((v) => !v)}
                className="absolute right-2 top-1/2 -translate-y-1/2 rounded p-1.5 text-slate-400 hover:bg-slate-100 hover:text-slate-600"
                aria-label={showPassword ? "パスワードを隠す" : "パスワードを表示"}
              >
                {showPassword ? (
                  <HiEyeSlash className="h-4 w-4" />
                ) : (
                  <HiEye className="h-4 w-4" />
                )}
              </button>
            </div>
          </div>

          <div className="space-y-2">
            <label className="block text-xs font-medium text-slate-800">
              パスワード（確認）
            </label>
            <input
              type={showPassword ? "text" : "password"}
              required
              minLength={8}
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 outline-none focus:border-brand-400 focus:ring-2 focus:ring-brand-200"
              placeholder="もう一度入力"
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
            {isLoading ? "更新中..." : "パスワードを更新"}
          </button>
        </form>

        <p className="text-center">
          <Link
            href="/login"
            className="text-sm text-slate-500 hover:text-slate-700"
          >
            サインインへ戻る
          </Link>
        </p>
      </div>
    </main>
  );
}
