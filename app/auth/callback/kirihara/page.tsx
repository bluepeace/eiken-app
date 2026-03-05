"use client";

import { useEffect, useState, Suspense } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { supabase } from "@/lib/supabase/client";

function KiriharaCallbackContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const run = async () => {
      const code = searchParams.get("code");
      const state = searchParams.get("state");

      if (!code) {
        setError("認可コードがありません");
        return;
      }

      // state の簡易検証（sessionStorage に保存した値と一致するか）
      if (typeof window !== "undefined") {
        const savedState = sessionStorage.getItem("kirihara_oauth_state");
        if (savedState && state !== savedState) {
          setError("不正なリクエストです");
          sessionStorage.removeItem("kirihara_oauth_state");
          return;
        }
        sessionStorage.removeItem("kirihara_oauth_state");
      }

      try {
        const res = await fetch("/api/auth/kirihara", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ code, state })
        });

        const data = (await res.json()) as {
          token_hash?: string;
          error?: string;
        };

        if (!res.ok || data.error) {
          setError(data.error ?? "認証に失敗しました");
          return;
        }

        if (!data.token_hash) {
          setError("セッションの確立に失敗しました");
          return;
        }

        const { error: verifyError } = await supabase.auth.verifyOtp({
          token_hash: data.token_hash,
          type: "magiclink"
        });

        if (verifyError) {
          setError(verifyError.message);
          return;
        }

        // プロフィール確認してリダイレクト先を決定
        const { data: { user } } = await supabase.auth.getUser();
        if (user) {
          const { data: profileRows } = await supabase
            .from("user_profiles")
            .select("id, display_name, target_level")
            .eq("auth_user_id", user.id)
            .limit(1);
          const profile = Array.isArray(profileRows) ? profileRows[0] : profileRows;

          if (profile?.display_name && profile?.target_level) {
            router.push("/dashboard");
          } else {
            router.push("/onboarding?s=kirihara");
          }
        } else {
          router.push("/login/kirihara");
        }
      } catch (err) {
        console.error("[kirihara callback]", err);
        setError("認証処理中にエラーが発生しました");
      }
    };

    run();
  }, [searchParams, router]);

  if (error) {
    return (
      <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
        <div className="w-full max-w-md space-y-4 rounded-3xl border border-slate-200 bg-white p-8 shadow-sm text-center">
          <h1 className="text-xl font-semibold text-slate-900">ログインエラー</h1>
          <p className="text-sm text-red-600">{error}</p>
          <button
            type="button"
            onClick={() => router.push("/login/kirihara")}
            className="rounded-full bg-[#009DC9] px-4 py-2 text-sm font-semibold text-white hover:bg-[#0087A8]"
          >
            ログイン画面に戻る
          </button>
        </div>
      </main>
    );
  }

  return (
    <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
      <p className="text-slate-600">ログイン処理中...</p>
    </main>
  );
}

export default function KiriharaCallbackPage() {
  return (
    <Suspense
      fallback={
        <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
          <p className="text-slate-600">読み込み中...</p>
        </main>
      }
    >
      <KiriharaCallbackContent />
    </Suspense>
  );
}
