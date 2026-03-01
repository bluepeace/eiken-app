-- 044_user_profiles_buddy_image_url.sql
-- バディの名前はそのままで画像だけ差し替える用（user_profiles にオーバーライド URL を保存）

alter table public.user_profiles
  add column if not exists buddy_image_url text;

comment on column public.user_profiles.buddy_image_url is 'バディ画像の上書きURL。指定時は buddy の image_url の代わりにこれを表示する';
