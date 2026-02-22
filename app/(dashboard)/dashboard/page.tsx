"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { DashboardHeader } from "@/components/features/dashboard/DashboardHeader";
import { StatsGrid } from "@/components/features/dashboard/StatsGrid";
import { LearningModulesGrid } from "@/components/features/dashboard/LearningModulesGrid";
import { BadgePopup } from "@/components/features/badges/BadgePopup";
import { supabase } from "@/lib/supabase/client";
import {
  getProfileId,
  getProfileTargetLevel,
  getVocabularyProficiency,
  getVocabularyQuizSessionCount
} from "@/lib/data/vocabulary-db";
import {
  getTodayStudySeconds,
  getStreak,
  getTotalStudySeconds
} from "@/lib/data/study-activity";
import {
  getWritingSubmissionCount,
  getTotalWritingCount
} from "@/lib/data/writing-db";
import {
  getNearestPrimaryDate,
  formatExamRoundLabel
} from "@/lib/data/eiken-exam-db";
import {
  checkAndEarnBadges,
  checkAndEarnProfileBadges,
  getUnshownBadge,
  markBadgePopupShown,
  getBadgeDef,
  type UserBadge
} from "@/lib/data/badges";

interface ProfileState {
  display_name: string | null;
  target_level: string | null;
  avatar_url: string | null;
  avatar_style: string | null;
  target_exam_year: number | null;
  target_exam_round: number | null;
  target_exam_primary_date: string | null;
  target_exam_secondary_date: string | null;
}

export default function DashboardPage() {
  const [profile, setProfile] = useState<ProfileState | null>(null);
  const [todayStudyMinutes, setTodayStudyMinutes] = useState(0);
  const [totalStudyMinutes, setTotalStudyMinutes] = useState(0);
  const [streakDays, setStreakDays] = useState(0);
  const [vocabProficiency, setVocabProficiency] = useState<{
    percentage: number;
    mastered: number;
    total: number;
  } | null>(null);
  const [writingCount, setWritingCount] = useState<number | null>(null);
  const [badgePopup, setBadgePopup] = useState<UserBadge | null>(null);
  const [examCountdown, setExamCountdown] = useState<{
    label: string;
    daysLeft: number;
  } | null>(null);

  useEffect(() => {
    const loadProfile = async () => {
      const {
        data: { user }
      } = await supabase.auth.getUser();
      if (!user) return;

      // 先にキャッシュから級だけ取得して即反映（2級→3級のチラつき防止）
      const cachedLevel = await getProfileTargetLevel();
      if (cachedLevel !== null) {
        setProfile((prev) => ({
          display_name: prev?.display_name ?? null,
          target_level: cachedLevel,
          avatar_url: prev?.avatar_url ?? null,
          avatar_style: prev?.avatar_style ?? null,
          target_exam_year: prev?.target_exam_year ?? null,
          target_exam_round: prev?.target_exam_round ?? null,
          target_exam_primary_date: prev?.target_exam_primary_date ?? null,
          target_exam_secondary_date: prev?.target_exam_secondary_date ?? null
        }));
      }

      const { data } = await supabase
        .from("user_profiles")
        .select(
          "display_name, target_level, avatar_url, avatar_style, target_exam_year, target_exam_round, target_exam_primary_date, target_exam_secondary_date"
        )
        .eq("auth_user_id", user.id)
        .maybeSingle();

      if (data) {
        setProfile({
          display_name: data.display_name,
          target_level: data.target_level,
          avatar_url: data.avatar_url,
          avatar_style: data.avatar_style,
          target_exam_year: data.target_exam_year ?? null,
          target_exam_round: data.target_exam_round ?? null,
          target_exam_primary_date: data.target_exam_primary_date ?? null,
          target_exam_secondary_date: data.target_exam_secondary_date ?? null
        });
      }
    };

    void loadProfile();
  }, []);

  const handleBadgePopupClose = async () => {
    const profileId = await getProfileId();
    if (!profileId || !badgePopup) {
      setBadgePopup(null);
      return;
    }
    await markBadgePopupShown(profileId, badgePopup.badgeKey);
    const next = await getUnshownBadge(profileId);
    setBadgePopup(next);
  };

  const loadStats = async () => {
    const profileId = await getProfileId();
    if (!profileId) return;

    const targetLevel = profile?.target_level ?? null;
    const [
      seconds,
      streak,
      proficiency,
      wCount,
      vocabSessions,
      totalWriting,
      totalStudySecs
    ] = await Promise.all([
      getTodayStudySeconds(profileId),
      getStreak(profileId),
      getVocabularyProficiency(profileId, targetLevel),
      getWritingSubmissionCount(profileId, targetLevel, 7),
      getVocabularyQuizSessionCount(profileId),
      getTotalWritingCount(profileId),
      getTotalStudySeconds(profileId)
    ]);
    setTodayStudyMinutes(Math.round(seconds / 60));
    setTotalStudyMinutes(Math.round(totalStudySecs / 60));
    setStreakDays(streak.current);
    setVocabProficiency(proficiency);
    setWritingCount(wCount);

    const [activityEarned, profileEarned] = await Promise.all([
      checkAndEarnBadges(profileId, {
        vocabQuizCount: vocabSessions,
        writingCount: totalWriting,
        totalStudySeconds: totalStudySecs,
        currentStreak: streak.current,
        hasStudied: totalStudySecs > 0
      }),
      checkAndEarnProfileBadges(profileId, {
        targetLevel: profile?.target_level ?? null,
        targetExamYear: profile?.target_exam_year ?? null,
        targetExamRound: profile?.target_exam_round ?? null,
        targetExamPrimaryDate: profile?.target_exam_primary_date ?? null
      })
    ]);
    const newlyEarned = [...profileEarned, ...activityEarned];
    if (newlyEarned.length > 0) {
      const first = getBadgeDef(newlyEarned[0]);
      if (first) {
        setBadgePopup({
          badgeKey: newlyEarned[0],
          earnedAt: new Date().toISOString(),
          popupShown: false,
          def: first
        });
      }
    } else {
      const unshown = await getUnshownBadge(profileId);
      if (unshown) setBadgePopup(unshown);
    }
  };

  useEffect(() => {
    void loadStats();
  }, [profile?.target_level]);

  useEffect(() => {
    const loadCountdown = async () => {
      // 設定していたらその日へのカウントダウン、未設定なら直近の英検一次へ
      if (profile?.target_exam_primary_date) {
        const target = new Date(profile.target_exam_primary_date);
        target.setHours(0, 0, 0, 0);
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        const diffMs = target.getTime() - today.getTime();
        const daysLeft = Math.ceil(diffMs / (1000 * 60 * 60 * 24));
        const label =
          profile.target_exam_year != null && profile.target_exam_round != null
            ? formatExamRoundLabel(
                profile.target_exam_year,
                profile.target_exam_round
              )
            : "目標";
        setExamCountdown({ label, daysLeft });
        return;
      }

      // 未設定: 直近の英検一次日程へ
      const nearest = await getNearestPrimaryDate();
      if (!nearest) {
        setExamCountdown(null);
        return;
      }
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const target = new Date(nearest.date);
      target.setHours(0, 0, 0, 0);
      const diffMs = target.getTime() - today.getTime();
      const daysLeft = Math.ceil(diffMs / (1000 * 60 * 60 * 24));
      setExamCountdown({
        label: nearest.label,
        daysLeft
      });
    };
    void loadCountdown();
  }, [
    profile?.target_exam_primary_date,
    profile?.target_exam_year,
    profile?.target_exam_round
  ]);

  // タブに戻ったとき・ページ復元時にも再取得（クイズ・ライティング完了後など）
  useEffect(() => {
    const onFocus = () => void loadStats();
    const onPageShow = (e: PageTransitionEvent) => {
      if (e.persisted) void loadStats(); // bfcache からの復元時
    };
    window.addEventListener("focus", onFocus);
    window.addEventListener("pageshow", onPageShow);
    return () => {
      window.removeEventListener("focus", onFocus);
      window.removeEventListener("pageshow", onPageShow);
    };
  }, []);

  const userName = profile?.display_name ?? "ゲスト";
  // 未取得時は「…」にして 2級→3級 のチラつきを防ぐ。取得済みで未設定なら 2級
  const targetLevel =
    profile === null
      ? "…"
      : (profile?.target_level ?? "英検2級");
  const avatarUrl = profile?.avatar_url ?? null;
  const avatarStyle = profile?.avatar_style ?? null;

  return (
    <main className="min-h-[calc(100vh-64px)] px-4 py-8">
      <div className="mx-auto flex max-w-5xl flex-col gap-6">
        <DashboardHeader
          userName={userName}
          targetLevel={targetLevel}
          avatarUrl={avatarUrl}
          avatarStyle={avatarStyle}
          todayStudyMinutes={todayStudyMinutes}
          totalStudyMinutes={totalStudyMinutes}
          streakDays={streakDays}
          rightSlot={
            <Link
              href="/profile"
              className="hidden md:inline-flex items-center rounded-full border border-slate-200 bg-white px-3 py-1.5 text-[11px] font-semibold text-slate-700 hover:bg-slate-50"
            >
              プロフィールを編集
            </Link>
          }
        />
        <div className="flex flex-wrap items-center gap-4 rounded-2xl border border-slate-200 bg-white px-4 py-3 text-sm">
          <span className="text-slate-600">
            現在の目標級：
            <span className="font-semibold text-slate-900">
              {targetLevel || "未設定"}
            </span>
          </span>
          {examCountdown && (
            <span className="text-slate-600">
              英検{examCountdown.label}試験日まであと
              <span className="font-semibold text-slate-900">
                {examCountdown.daysLeft >= 0 ? examCountdown.daysLeft : 0}
              </span>
              日
            </span>
          )}
          <Link
            href="/profile"
            className="text-[#50c2cb] hover:text-[#46adb5] hover:underline"
          >
            目標を変更 →
          </Link>
        </div>
        <StatsGrid
          targetLevel={targetLevel}
          vocabProficiency={vocabProficiency}
          writingCount={writingCount}
        />
        <LearningModulesGrid targetLevel={targetLevel} />
      </div>

      {badgePopup && (
        <BadgePopup badge={badgePopup} onClose={handleBadgePopupClose} />
      )}
    </main>
  );
}

