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

/** ログイン中ユーザーが選択しているバディを1件取得（ダッシュボード用） */
export async function getCurrentUserBuddy(): Promise<Buddy | null> {
  const {
    data: { user }
  } = await supabase.auth.getUser();
  if (!user) return null;

  const { data: profile } = await supabase
    .from("user_profiles")
    .select("buddy_id")
    .eq("auth_user_id", user.id)
    .maybeSingle();

  const buddyId = profile?.buddy_id;
  if (!buddyId) return null;

  const { data: buddy, error } = await supabase
    .from("buddies")
    .select("id, name, kind, image_url")
    .eq("id", buddyId)
    .maybeSingle();

  if (error || !buddy) return null;
  return {
    id: buddy.id as string,
    name: buddy.name as string,
    kind: buddy.kind as string,
    image_url: buddy.image_url as string
  };
}
