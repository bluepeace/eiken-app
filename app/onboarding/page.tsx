"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { supabase } from "@/lib/supabase/client";
import { getBuddies, type Buddy } from "@/lib/data/buddies";

const LEVEL_OPTIONS = [
  "英検5級",
  "英検4級",
  "英検3級",
  "英検準2級",
  "英検準2級プラス",
  "英検2級",
  "英検準1級",
  "英検1級"
] as const;

/** 吹き出し＋右側にバディまたはマスコットを表示 */
function BuddySpeech({
  children,
  buddy
}: {
  children: React.ReactNode;
  buddy?: Buddy | null;
}) {
  const imgSrc = buddy?.image_url ?? "/images/mascot-aiken.png";
  const alt = buddy ? `${buddy.name}（バディ）` : "AiKen マスコット";

  return (
    <div className="flex flex-row items-center justify-center gap-3">
      <div className="relative flex-1 max-w-sm rounded-2xl bg-[#009DC9]/15 px-5 py-4 shadow-sm ring-1 ring-[#009DC9]/10">
        <div className="text-center text-base leading-relaxed text-slate-800">
          {children}
        </div>
        <div
          className="absolute -right-3 top-1/2 h-0 w-0 -translate-y-1/2 border-t-[10px] border-b-[10px] border-l-[12px] border-t-transparent border-b-transparent border-l-[#009DC9]/15"
          aria-hidden
        />
      </div>
      <div className="relative h-24 w-24 shrink-0">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src={imgSrc}
          alt={alt}
          className="h-full w-full object-contain object-bottom"
          onError={(e) => {
            (e.target as HTMLImageElement).src = "/logo-aiken.png";
          }}
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
  const [buddies, setBuddies] = useState<Buddy[]>([]);
  const [selectedBuddyId, setSelectedBuddyId] = useState<string | null>(null);
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

      const [profileRes, buddiesList] = await Promise.all([
        supabase
          .from("user_profiles")
          .select("display_name, target_level, buddy_id")
          .eq("auth_user_id", user.id)
          .maybeSingle(),
        getBuddies()
      ]);
      const { data: profile } = profileRes;

      if (profile?.display_name && profile?.target_level) {
        router.replace("/dashboard");
        return;
      }

      setBuddies(buddiesList);
      if (profile?.buddy_id) setSelectedBuddyId(profile.buddy_id);

      if (profile?.display_name) {
        setDisplayName(profile.display_name);
        if (profile.target_level) {
          setTargetLevel(profile.target_level);
          setStep(3);
        } else if (profile.buddy_id != null) {
          setStep(3);
        } else {
          setStep(2);
        }
      }
      if (profile?.target_level) setTargetLevel(profile.target_level);

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
          target_level: null,
          organization_id: 1
        });
      }
      setStep(2);
    } catch (err) {
      setError(err instanceof Error ? err.message : "保存に失敗しました");
    } finally {
      setSaving(false);
    }
  };

  const handleSaveBuddy = async (e: React.FormEvent) => {
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
          .update({ buddy_id: selectedBuddyId || null })
          .eq("id", existing.id);
      } else {
        await supabase.from("user_profiles").insert({
          auth_user_id: user.id,
          display_name: displayName.trim() || null,
          target_level: null,
          buddy_id: selectedBuddyId || null,
          organization_id: 1
        });
      }
      setStep(3);
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
          target_level: targetLevel,
          organization_id: 1
        });
      }
      setStep(4);
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
            <BuddySpeech>
              あなたのお名前（ニックネーム）を教えてください
            </BuddySpeech>
            <form onSubmit={handleSaveName} className="space-y-4">
              <input
                type="text"
                value={displayName}
                onChange={(e) => setDisplayName(e.target.value)}
                placeholder="例: 太郎"
                className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2.5 text-slate-900 outline-none focus:border-[#009DC9] focus:ring-2 focus:ring-[#009DC9]/30"
                autoFocus
              />
              {error && (
                <p className="text-sm text-red-600">{error}</p>
              )}
              <button
                type="submit"
                disabled={saving}
                className="flex w-full items-center justify-center rounded-full bg-[#009DC9] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#0087A8] disabled:opacity-60"
              >
                {saving ? "保存中..." : "次へ"}
              </button>
            </form>
          </>
        )}

        {step === 2 && (
          <>
            <BuddySpeech buddy={buddies.find((b) => b.id === selectedBuddyId) ?? null}>
              一緒に学習するバディを選んでね
            </BuddySpeech>
            <form onSubmit={handleSaveBuddy} className="space-y-4">
              <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
                {buddies.map((b) => (
                  <button
                    key={b.id}
                    type="button"
                    onClick={() => setSelectedBuddyId(selectedBuddyId === b.id ? null : b.id)}
                    className={`flex flex-col items-center gap-1 rounded-xl border-2 p-3 transition ${
                      selectedBuddyId === b.id
                        ? "border-[#009DC9] bg-[#009DC9]/10"
                        : "border-slate-200 bg-slate-50 hover:border-slate-300"
                    }`}
                  >
                    <div className="h-14 w-14 shrink-0">
                      {/* eslint-disable-next-line @next/next/no-img-element */}
                      <img
                        src={b.image_url}
                        alt={b.name}
                        className="h-full w-full object-contain"
                        onError={(e) => {
                          (e.target as HTMLImageElement).src = "/logo-aiken.png";
                        }}
                      />
                    </div>
                    <span className="text-sm font-medium text-slate-800">{b.name}</span>
                  </button>
                ))}
              </div>
              {buddies.length === 0 && (
                <p className="text-sm text-slate-500">バディの読み込み中…</p>
              )}
              <button
                type="submit"
                disabled={saving || !selectedBuddyId || buddies.length === 0}
                className="flex w-full items-center justify-center rounded-full bg-[#009DC9] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#0087A8] disabled:opacity-60"
              >
                {saving ? "保存中..." : "選んで次へ"}
              </button>
              {error && <p className="text-sm text-red-600">{error}</p>}
            </form>
          </>
        )}

        {step === 3 && (
          <>
            <BuddySpeech buddy={buddies.find((b) => b.id === selectedBuddyId) ?? null}>
              あなたの英検目標級を教えてください
            </BuddySpeech>
            <form onSubmit={handleSaveLevel} className="space-y-4">
              <select
                value={targetLevel}
                onChange={(e) => setTargetLevel(e.target.value)}
                className="w-full rounded-lg border border-slate-300 bg-white px-3 py-2.5 text-slate-900 outline-none focus:border-[#009DC9] focus:ring-2 focus:ring-[#009DC9]/30"
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
                className="flex w-full items-center justify-center rounded-full bg-[#009DC9] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#0087A8] disabled:opacity-60"
              >
                {saving ? "保存中..." : "次へ"}
              </button>
            </form>
          </>
        )}

        {step === 4 && (
          <>
            <BuddySpeech buddy={buddies.find((b) => b.id === selectedBuddyId) ?? null}>
              登録ありがとうございます！
              <span className="mt-2 block text-sm font-medium text-[#009DC9]">
                さっそく学習を始めましょう。
              </span>
            </BuddySpeech>
            <button
              type="button"
              onClick={() => router.push("/dashboard")}
              className="flex w-full items-center justify-center rounded-full bg-[#009DC9] px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-[#0087A8]"
            >
              ダッシュボードへ移動
            </button>
          </>
        )}
      </div>
    </main>
  );
}
