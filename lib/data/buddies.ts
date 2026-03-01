import { supabase } from "@/lib/supabase/client";

export interface Buddy {
  id: string;
  name: string;
  kind: string;
  image_url: string;
}

/** オンボーディング・プロフィールで選択可能なバディ一覧 */
export async function getBuddies(): Promise<Buddy[]> {
  const { data, error } = await supabase
    .from("buddies")
    .select("id, name, kind, image_url")
    .order("sort_order", { ascending: true })
    .order("created_at", { ascending: true });

  if (error) return [];
  return (data ?? []).map((r) => ({
    id: r.id as string,
    name: r.name as string,
    kind: r.kind as string,
    image_url: r.image_url as string
  }));
}

/** ウィジェット用のデフォルトバディ（未選択・テーブル空時） */
const DEFAULT_BUDDY: Buddy = {
  id: "",
  name: "バディ",
  kind: "dog",
  image_url: "/images/mascot-aiken.png"
};

/**
 * ログイン中ユーザーが表示するバディを1件取得（ダッシュボード右下用）。
 * 未選択の場合は先頭のバディ、登録が無い場合はデフォルト（マスコット）を返す。
 */
export async function getCurrentUserBuddy(): Promise<Buddy | null> {
  const {
    data: { user }
  } = await supabase.auth.getUser();
  if (!user) return null;

  const { data: profile } = await supabase
    .from("user_profiles")
    .select("buddy_id, buddy_image_url")
    .eq("auth_user_id", user.id)
    .maybeSingle();

  const buddyId = profile?.buddy_id;
  const overrideImageUrl = (profile?.buddy_image_url as string)?.trim() || null;

  if (buddyId) {
    const { data: buddy, error } = await supabase
      .from("buddies")
      .select("id, name, kind, image_url")
      .eq("id", buddyId)
      .maybeSingle();

    if (!error && buddy) {
      return {
        id: buddy.id as string,
        name: buddy.name as string,
        kind: buddy.kind as string,
        image_url: overrideImageUrl ?? (buddy.image_url as string)
      };
    }
  }

  const all = await getBuddies();
  if (all.length > 0) return all[0];
  return DEFAULT_BUDDY;
}
