-- 036_admin_get_users_organization.sql
-- admin_get_users に所属企業を追加

DROP FUNCTION IF EXISTS public.admin_get_users();
CREATE OR REPLACE FUNCTION public.admin_get_users()
RETURNS TABLE (
  id uuid,
  display_id bigint,
  auth_user_id uuid,
  email text,
  display_name text,
  target_level text,
  role text,
  avatar_url text,
  avatar_style text,
  created_at timestamptz,
  total_study_seconds bigint,
  current_streak integer,
  subscription_status text,
  subscription_source text,
  subscription_current_period_end timestamptz,
  stripe_customer_id text,
  organization_id bigint,
  organization_name text
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  IF NOT public.is_admin() THEN
    RAISE EXCEPTION 'Not authorized';
  END IF;
  RETURN QUERY
  WITH activity_totals AS (
    SELECT
      aul.user_id,
      COALESCE(SUM((aul.payload->>'seconds')::bigint), 0)::bigint AS total_sec
    FROM public.user_activity_log aul
    WHERE aul.payload ? 'seconds'
    GROUP BY aul.user_id
  )
  SELECT
    p.id,
    p.display_id,
    p.auth_user_id,
    u.email::text,
    p.display_name,
    p.target_level,
    COALESCE(p.role, 'user'),
    p.avatar_url,
    p.avatar_style,
    p.created_at,
    COALESCE(at.total_sec, 0)::bigint,
    COALESCE(ds.current_streak, 0)::integer,
    COALESCE(p.subscription_status, 'free'),
    COALESCE(p.subscription_source, 'stripe'),
    p.subscription_current_period_end,
    p.stripe_customer_id,
    p.organization_id,
    o.name::text
  FROM public.user_profiles p
  JOIN auth.users u ON u.id = p.auth_user_id
  LEFT JOIN activity_totals at ON at.user_id = p.id
  LEFT JOIN public.daily_streaks ds ON ds.user_id = p.id
  LEFT JOIN public.organizations o ON o.id = p.organization_id
  ORDER BY p.display_id ASC;
END;
$$;
