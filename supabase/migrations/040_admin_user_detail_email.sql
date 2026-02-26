-- 040_admin_user_detail_email.sql
-- 管理者用: ユーザー詳細取得（メール・プロバイダー含む）メール編集可否
-- 純粋 SQL 関数にすることで RETURNS TABLE のスコープ問題を回避

CREATE OR REPLACE FUNCTION public.admin_get_user_detail(p_profile_id uuid)
RETURNS TABLE (
  id uuid,
  auth_user_id uuid,
  email text,
  is_email_editable boolean,
  display_name text,
  target_level text,
  role text,
  created_at timestamptz,
  subscription_status text,
  subscription_source text,
  organization_id bigint
)
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT
    p.id,
    p.auth_user_id,
    u.email::text,
    EXISTS (
      SELECT 1 FROM auth.identities i
      WHERE i.user_id = p.auth_user_id AND i.provider = 'email'
    ),
    p.display_name,
    p.target_level,
    COALESCE(p.role, 'user'),
    p.created_at,
    COALESCE(p.subscription_status, 'free'),
    COALESCE(p.subscription_source, 'stripe'),
    p.organization_id
  FROM public.user_profiles p
  JOIN auth.users u ON u.id = p.auth_user_id
  WHERE p.id = p_profile_id
    AND (
      public.is_admin()
      OR (
        public.get_organization_admin_for() IS NOT NULL
        AND p.organization_id = public.get_organization_admin_for()
      )
    )
  LIMIT 1;
$$;
