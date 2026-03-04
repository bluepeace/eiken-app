/**
 * プロフィール表示用の localStorage キャッシュ
 * ダッシュボード等で級・名前・アバター等を即時表示するため
 */

const PROFILE_CACHE_KEY = "eiken_profile_display";

export interface CachedProfile {
  userId: string;
  display_name: string | null;
  target_level: string | null;
  avatar_url: string | null;
  avatar_style: string | null;
  target_exam_year: number | null;
  target_exam_round: number | null;
  target_exam_primary_date: string | null;
  target_exam_secondary_date: string | null;
}

const storage = typeof window !== "undefined" ? localStorage : null;

/** 初回レンダー用: キャッシュを同期的に読み即表示（userId 未検証。ログイン済み想定） */
export function getCachedProfileForInitial(): Omit<CachedProfile, "userId"> | null {
  if (!storage) return null;
  try {
    const raw = storage.getItem(PROFILE_CACHE_KEY);
    if (!raw) return null;
    const parsed = JSON.parse(raw) as CachedProfile;
    const { userId: _u, ...rest } = parsed;
    return rest;
  } catch {
    return null;
  }
}

/** 同期的にキャッシュからプロフィールを取得（userId が一致する場合のみ） */
export function getCachedProfile(userId: string): CachedProfile | null {
  if (!storage) return null;
  try {
    const raw = storage.getItem(PROFILE_CACHE_KEY);
    if (!raw) return null;
    const parsed = JSON.parse(raw) as CachedProfile;
    return parsed.userId === userId ? parsed : null;
  } catch {
    return null;
  }
}

/** プロフィールをキャッシュに保存 */
export function setCachedProfile(userId: string, profile: Omit<CachedProfile, "userId">): void {
  if (!storage) return;
  try {
    storage.setItem(
      PROFILE_CACHE_KEY,
      JSON.stringify({ ...profile, userId } as CachedProfile)
    );
  } catch {
    // ignore
  }
}

/** キャッシュをクリア（ログアウト時など） */
export function clearProfileCache(): void {
  if (!storage) return;
  try {
    storage.removeItem(PROFILE_CACHE_KEY);
  } catch {
    // ignore
  }
}
