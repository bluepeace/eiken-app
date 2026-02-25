-- 038_organization_admins.sql
-- 企業管理者: 企業ごとの管理者アカウント

-- user_profiles に企業管理者フラグを追加
ALTER TABLE public.user_profiles
  ADD COLUMN IF NOT EXISTS organization_admin_for_id bigint REFERENCES public.organizations (id) ON DELETE SET NULL;

COMMENT ON COLUMN public.user_profiles.organization_admin_for_id IS 'このユーザーが企業管理者として管理する組織ID。NULL の場合は一般ユーザー';

-- 企業管理者かどうか、管理対象の組織IDを返す（NULL なら一般ユーザー）
CREATE OR REPLACE FUNCTION public.get_organization_admin_for()
RETURNS bigint
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT organization_admin_for_id
  FROM public.user_profiles
  WHERE auth_user_id = auth.uid()
  LIMIT 1;
$$;

-- admin_get_users: スーパー管理者は全件、企業管理者は自組織のユーザーのみ
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
DECLARE
  v_org_filter bigint;
BEGIN
  IF public.is_admin() THEN
    v_org_filter := NULL;  -- 全件
  ELSIF public.get_organization_admin_for() IS NOT NULL THEN
    v_org_filter := public.get_organization_admin_for();
  ELSE
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
  WHERE (v_org_filter IS NULL OR p.organization_id = v_org_filter)
  ORDER BY p.display_id ASC;
END;
$$;

-- 企業管理者が user_profiles を参照: 自組織の所属者のみ
DROP POLICY IF EXISTS "企業管理者は自組織のプロフィールを参照可能" ON public.user_profiles;
CREATE POLICY "企業管理者は自組織のプロフィールを参照可能"
  ON public.user_profiles
  FOR SELECT
  USING (
    organization_id = public.get_organization_admin_for()
    AND public.get_organization_admin_for() IS NOT NULL
  );

-- 企業管理者が各種履歴テーブルを参照: 自組織のユーザーのみ
DROP POLICY IF EXISTS "企業管理者は自組織の活動ログを参照可能" ON public.user_activity_log;
CREATE POLICY "企業管理者は自組織の活動ログを参照可能"
  ON public.user_activity_log FOR SELECT
  USING (
    user_id IN (SELECT id FROM public.user_profiles WHERE organization_id = public.get_organization_admin_for())
    AND public.get_organization_admin_for() IS NOT NULL
  );

DROP POLICY IF EXISTS "企業管理者は自組織のストリークを参照可能" ON public.daily_streaks;
CREATE POLICY "企業管理者は自組織のストリークを参照可能"
  ON public.daily_streaks FOR SELECT
  USING (
    user_id IN (SELECT id FROM public.user_profiles WHERE organization_id = public.get_organization_admin_for())
    AND public.get_organization_admin_for() IS NOT NULL
  );

DROP POLICY IF EXISTS "企業管理者は自組織のクイズ結果を参照可能" ON public.vocabulary_quiz_results;
CREATE POLICY "企業管理者は自組織のクイズ結果を参照可能"
  ON public.vocabulary_quiz_results FOR SELECT
  USING (
    user_id IN (SELECT id FROM public.user_profiles WHERE organization_id = public.get_organization_admin_for())
    AND public.get_organization_admin_for() IS NOT NULL
  );

DROP POLICY IF EXISTS "企業管理者は自組織のライティング提出を参照可能" ON public.writing_submissions;
CREATE POLICY "企業管理者は自組織のライティング提出を参照可能"
  ON public.writing_submissions FOR SELECT
  USING (
    user_id IN (SELECT id FROM public.user_profiles WHERE organization_id = public.get_organization_admin_for())
    AND public.get_organization_admin_for() IS NOT NULL
  );

-- 企業の管理者情報取得（スーパー管理者のみ）
CREATE OR REPLACE FUNCTION public.admin_get_organization_admin(p_org_id bigint)
RETURNS TABLE (profile_id uuid, email text, display_name text)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  IF NOT public.is_admin() THEN
    RAISE EXCEPTION 'Not authorized';
  END IF;
  RETURN QUERY
  SELECT
    p.id,
    u.email::text,
    p.display_name::text
  FROM public.user_profiles p
  JOIN auth.users u ON u.id = p.auth_user_id
  WHERE p.organization_admin_for_id = p_org_id
  LIMIT 1;
END;
$$;
