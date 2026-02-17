import { supabase } from "@/lib/supabase/client";

export type BuddyCommentCategory =
  | "regular"
  | "streak_0"
  | "streak_3_5"
  | "streak_5_10"
  | "streak_11";

/** カテゴリ別にコメント本文一覧を取得（表示用） */
export async function getBuddyCommentBodies(
  category: BuddyCommentCategory
): Promise<string[]> {
  const { data, error } = await supabase
    .from("buddy_comments")
    .select("body")
    .eq("category", category)
    .order("sort_order", { ascending: true });

  if (error) return [];
  return (data ?? []).map((r) => r.body as string);
}

/** 連続日数から表示用のストリークカテゴリを返す（1〜2日はレギュラーのみ） */
export function getStreakCategory(
  streakDays: number
): BuddyCommentCategory | null {
  if (streakDays === 0) return "streak_0";
  if (streakDays >= 3 && streakDays <= 5) return "streak_3_5";
  if (streakDays >= 6 && streakDays <= 10) return "streak_5_10";
  if (streakDays >= 11) return "streak_11";
  return null;
}

/** 配列から1つランダムに選択 */
function pickOneRandom<T>(arr: T[]): T | null {
  if (arr.length === 0) return null;
  return arr[Math.floor(Math.random() * arr.length)];
}

/**
 * バディの表示用コメントを1つ選ぶ。
 * レギュラーと連続日数用を混ぜてランダム表示（ストリーク時は約35%でストリークコメント）。
 * streak_11 の本文の {{days}} は連続日数に置換する。
 */
export async function pickBuddyCommentForUser(
  streakDays: number
): Promise<string> {
  const [regular, streakBodies] = await Promise.all([
    getBuddyCommentBodies("regular"),
    (() => {
      const cat = getStreakCategory(streakDays);
      if (!cat) return Promise.resolve([]);
      return getBuddyCommentBodies(cat);
    })()
  ]);

  const fallback = "今日も一緒に頑張ろう。";
  const useStreak =
    streakBodies.length > 0 && Math.random() < 0.35;
  if (useStreak && streakBodies.length > 0) {
    const body = pickOneRandom(streakBodies);
    if (body) {
      return body.replace(/\{\{days\}\}/g, String(streakDays));
    }
  }
  const regularOne = pickOneRandom(regular);
  return regularOne ?? fallback;
}
