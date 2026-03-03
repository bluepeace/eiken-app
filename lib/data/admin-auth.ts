import { supabase } from "@/lib/supabase/client";

/** 管理者かどうか */
export async function checkIsAdmin(): Promise<boolean> {
  const {
    data: { user }
  } = await supabase.auth.getUser();
  if (!user) return false;

  const { data: rows } = await supabase
    .from("user_profiles")
    .select("role")
    .eq("auth_user_id", user.id)
    .limit(1);

  const profile = Array.isArray(rows) ? rows[0] : rows;
  return profile?.role === "admin";
}

/** 企業管理者かどうか。管理対象の組織IDを返す。一般ユーザーなら null */
export async function checkIsOrganizationAdmin(): Promise<number | null> {
  const {
    data: { user }
  } = await supabase.auth.getUser();
  if (!user) return null;

  const { data } = await supabase
    .from("user_profiles")
    .select("organization_admin_for_id")
    .eq("auth_user_id", user.id)
    .maybeSingle();

  const id = data?.organization_admin_for_id;
  return id != null ? (id as number) : null;
}

/** 管理画面にアクセス可能か（スーパー管理者 or 企業管理者） */
export async function canAccessAdmin(): Promise<
  | { type: "super_admin" }
  | { type: "org_admin"; organizationId: number }
  | null
> {
  if (await checkIsAdmin()) return { type: "super_admin" };
  const orgId = await checkIsOrganizationAdmin();
  if (orgId != null) return { type: "org_admin", organizationId: orgId };
  return null;
}
