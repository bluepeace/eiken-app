-- 042_dedupe_user_profiles_unique_auth_user_id.sql
-- 同一 auth_user_id で複数ある user_profiles を1件にまとめ、auth_user_id に UNIQUE を付与する。
-- 管理者アドレス変更などで旧管理者に重複が残っている場合の解消用。

DO $$
DECLARE
  r RECORD;
  keep_id uuid;
  child_tables text[] := ARRAY[
    'daily_streaks', 'user_activity_log', 'user_vocabulary_progress', 'vocabulary_quiz_results',
    'writing_submissions', 'speaking_sessions', 'reading_attempts', 'listening_attempts',
    'reading_results'
  ];
  drop_ids uuid[];
  t text;
BEGIN
  FOR r IN
    SELECT
      p.auth_user_id,
      array_agg(p.id ORDER BY (p.role = 'admin') DESC, p.id ASC) AS ids
    FROM public.user_profiles p
    GROUP BY p.auth_user_id
    HAVING count(*) > 1
  LOOP
    keep_id := r.ids[1];
    drop_ids := r.ids[2:array_length(r.ids, 1)];

    FOREACH t IN ARRAY child_tables
    LOOP
      EXECUTE format(
        'UPDATE public.%I SET user_id = $1 WHERE user_id = ANY($2)',
        t
      ) USING keep_id, drop_ids;
    END LOOP;

    -- user_badges は (user_id, badge_key) UNIQUE のため、keep に同じ badge_key が無い場合のみ移し、残りは削除
    EXECUTE '
      UPDATE public.user_badges SET user_id = $1
      WHERE user_id = ANY($2)
        AND NOT EXISTS (
          SELECT 1 FROM public.user_badges b2
          WHERE b2.user_id = $1 AND b2.badge_key = public.user_badges.badge_key
        )'
      USING keep_id, drop_ids;
    DELETE FROM public.user_badges WHERE user_id = ANY(drop_ids);

    DELETE FROM public.user_profiles
    WHERE auth_user_id = r.auth_user_id AND id <> keep_id;
  END LOOP;
END $$;

-- 4. auth_user_id の UNIQUE 制約を付与（既存ならスキップ）
ALTER TABLE public.user_profiles
  DROP CONSTRAINT IF EXISTS user_profiles_auth_user_id_key;

ALTER TABLE public.user_profiles
  ADD CONSTRAINT user_profiles_auth_user_id_key UNIQUE (auth_user_id);
