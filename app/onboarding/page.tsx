"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { supabase } from "@/lib/supabase/client";

const LEVEL_OPTIONS = [
  "英検5級",
  "英検4級",
  "英検3級",
  "英検準2級",
  "英検2級",
  "英検準1級",
  "英検1級"
] as const;

function MascotSpeech({ children }: { children: React.ReactNode }) {
  const [mascotSrc, setMascotSrc] = useState("/images/mascot-aiken.png");

  return (
    <div className="flex flex-row items-center justify-center gap-3">
      {/* 吹き出しカード（尻尾は右向き＝犬に向かう） */}
      <div className="relative flex-1 max-w-sm rounded-2xl bg-[#50c2cb]/15 px-5 py-4 shadow-sm ring-1 ring-[#50c2cb]/10">
        <div className="text-center text-base leading-relaxed text-slate-800">
          {children}
        </div>
        {/* 吹き出しの尻尾（右向き・犬側） */}
        <div
          className="absolute -right-3 top-1/2 h-0 w-0 -translate-y-1/2 border-t-[10px] border-b-[10px] border-l-[12px] border-t-transparent border-b-transparent border-l-[#50c2cb]/15"
          aria-hidden
        />
      </div>
      {/* マスコット（右側） */}
      <div className="relative h-24 w-24 shrink-0 overflow-hidden rounded-full border-2 border-white bg-gradient-to-br from-[#50c2cb]/20 to-[#50c2cb]/5 shadow-lg ring-2 ring-[#50c2cb]/20">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src={mascotSrc}
          alt="AiKen マスコット"
          className="h-full w-full object-cover"
          onError={() => setMascotSrc("/logo-aiken.png")}
        />
      </div>
    </div>
  );
}

export default function OnboardingPage() {
  const router = useRouter();
  const [step, setStep] = useState(1);
  const [displayName, setDisplayName] = useState("");
  const [targetLevel, setTargetLevel] = useState("英検2級");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    const check = async () => {
      const {
        data: { user }
      } = await supabase.auth.getUser();
      if (!user) {
        router.replace("/login");
        return;
      }

      const { data: profile } = await supabase
        .from("user_profiles")
        .select("display_name, target_level")
        .eq("auth_user_id", user.id)
        .maybeSingle();

      if (profile?.display_name && profile?.target_level) {
        router.replace("/dashboard");
        return;
      }

      if (profile?.display_name) {
        setDisplayName(profile.display_name);
        setStep(2);
      }
      if (profile?.target_level) {
        setTargetLevel(profile.target_level);
      }

      setLoading(false);
    };
    void check();
  }, [router]);

  const handleSaveName = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!displayName.trim()) {
      setError("お名前を入力してください");
      return;
    }
    setError("");
    setSaving(true);
    try {
      const {
        data: { user }
      } = await supabase.auth.getUser();
      if (!user) throw new Error("ログインが必要です");

      const { data: existing } = await supabase
        .from("user_profiles")
        .select("id")
        .eq("auth_user_id", user.id)
        .maybeSingle();

      if (existing) {
        await supabase
          .from("user_profiles")
          .update({ display_name: displayName.trim() })
          .eq("id", existing.id);
      } else {
        await supabase.from("user_profiles").insert({
          auth_user_id: user.id,
          display_name: displayName.trim(),
          target_level: null
        });
      }
      setStep(2);
    } catch (err) {
      setError(err instanceof Error ? err.message : "保存に失敗しました");
    } finally {
      setSaving(false);
    }
  };

  const handleSaveLevel = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setSaving(true);
    try {
      const {
        data: { user }
      } = await supabase.auth.getUser();
      if (!user) throw new Error("ログインが必要です");

      const { data: existing } = await supabase
        .from("user_profiles")
        .select("id")
        .eq("auth_user_id", user.id)
        .maybeSingle();

      if (existing) {
        await supabase
          .from("user_profiles")
          .update({ target_level: targetLevel })
          .eq("id", existing.id);
      } else {
        await supabase.from("user_profiles").insert({
          auth_user_id: user.id,
          display_name: displayName.trim() || null,
          target_level: targetLevel
        });
      }
      setStep(3);
    } catch (err) {
      setError(err instanceof Error ? err.message : "保存に失敗しました");
    } finally {
      setSaving(false);
    }
  };

  if (loading) {
    return (
      <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
        <p className="text-slate-600">読み込み中...</p>
      </main>
    );
  }

  return (
    <main className="flex min-h-[calc(100vh-64px)] items-center justify-center px-4 bg-slate-50">
      <div className="w-full max-w-md space-y-8 rounded-3xl border border-slate-200 bg-white p-8 shadow-sm">
        {step === 1 && (
          <>
            <MascotSpeech>
              あなたのお名前（ニックネーム）を教えてください
            </MascotSpeech>
            <form onSubmit={handleSaveName} className="space-y-4">
              <input
                type="text"
                value={displayName}
                onChange={(e) => setDisplayName(e.target.value)}
                placeholder="例: 太郎"
                className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2.5 text-slate-900 outline-none focus:border-[#50c2cb] focus:ring-2 focus:ring-[#50c2cb]/30"
                autoFocus
              />
              {error && (
                <p className="text-sm text-red-600">{error}</p>
              )}
              <button
                type="submit"
                disabled={saving}
                className="flex w-full items-center justify-center rounded-full bg-[#50c2cb] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#46adb5] disabled:opacity-60"
              >
                {saving ? "保存中..." : "次へ"}
              </button>
            </form>
          </>
        )}

        {step === 2 && (
          <>
            <MascotSpeech>
              あなたの英検目標級を教えてください
            </MascotSpeech>
            <form onSubmit={handleSaveLevel} className="space-y-4">
              <select
                value={targetLevel}
                onChange={(e) => setTargetLevel(e.target.value)}
                className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2.5 text-slate-900 outline-none focus:border-[#50c2cb] focus:ring-2 focus:ring-[#50c2cb]/30"
              >
                {LEVEL_OPTIONS.map((l) => (
                  <option key={l} value={l}>
                    {l}
                  </option>
                ))}
              </select>
              {error && (
                <p className="text-sm text-red-600">{error}</p>
              )}
              <button
                type="submit"
                disabled={saving}
                className="flex w-full items-center justify-center rounded-full bg-[#50c2cb] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#46adb5] disabled:opacity-60"
              >
                {saving ? "保存中..." : "次へ"}
              </button>
            </form>
          </>
        )}

        {step === 3 && (
          <>
            <MascotSpeech>
              登録ありがとうございます！
              <span className="mt-2 block text-sm font-medium text-[#50c2cb]">
                さっそく学習を始めましょう。
              </span>
            </MascotSpeech>
            <button
              type="button"
              onClick={() => router.push("/dashboard")}
              className="flex w-full items-center justify-center rounded-full bg-[#50c2cb] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#46adb5]"
            >
              ダッシュボードへ移動
            </button>
          </>
        )}
      </div>
    </main>
  );
}
