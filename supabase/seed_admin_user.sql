-- seed_admin_user.sql
-- 初回のみ実行: 指定メールのユーザーを管理者にする
-- 012, 013 マイグレーション実行後に実行すること
--
-- 以下のメールアドレスを管理者に昇格させます。必要に応じて変更してください。
-- （user_profiles が未作成の場合は先に INSERT してから role を設定）

-- 1. auth.users にいるが user_profiles にいない場合、プロフィールを作成して admin 付与
INSERT INTO public.user_profiles (auth_user_id, display_name, role)
SELECT u.id, COALESCE(u.raw_user_meta_data->>'full_name', split_part(u.email, '@', 1)), 'admin'
FROM auth.users u
WHERE u.email = 's_moriyama@writeup.co.jp'
  AND NOT EXISTS (SELECT 1 FROM public.user_profiles p WHERE p.auth_user_id = u.id);

-- 2. 既存の user_profiles を admin に更新
UPDATE public.user_profiles
SET role = 'admin'
WHERE auth_user_id IN (
  SELECT id FROM auth.users WHERE email = 's_moriyama@writeup.co.jp'
);
