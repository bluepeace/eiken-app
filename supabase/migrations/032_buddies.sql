-- 032_buddies.sql
-- 一緒に学習する「バディ」（犬・猫など）を管理。オンボーディングでユーザーが選択する。

-- ストレージ: avatars バケットに buddies/ で画像を保存可能
drop policy if exists "avatars buddies 管理者アップロード" on storage.objects;
create policy "avatars buddies 管理者アップロード"
  on storage.objects for insert
  with check (
    bucket_id = 'avatars' and (name like 'buddies/%') and public.is_admin()
  );

drop policy if exists "avatars buddies 管理者削除" on storage.objects;
create policy "avatars buddies 管理者削除"
  on storage.objects for delete
  using (
    bucket_id = 'avatars' and (name like 'buddies/%') and public.is_admin()
  );

create table if not exists public.buddies (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  kind text not null default 'dog',
  image_url text not null,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

comment on column public.buddies.kind is 'dog, cat, sheep など。表示用ラベルにも利用';

alter table public.buddies enable row level security;

create policy "buddies 全員閲覧"
  on public.buddies for select
  using (true);

create policy "buddies 管理者のみ挿入"
  on public.buddies for insert
  with check (public.is_admin());

create policy "buddies 管理者のみ更新"
  on public.buddies for update
  using (public.is_admin());

create policy "buddies 管理者のみ削除"
  on public.buddies for delete
  using (public.is_admin());

alter table public.user_profiles
  add column if not exists buddy_id uuid references public.buddies (id) on delete set null;

comment on column public.user_profiles.buddy_id is 'オンボーディングで選択した「一緒に学習するバディ」';

-- 初期データ: 犬バディを数件（画像は既存マスコットを流用可能。管理画面で差し替え可）
insert into public.buddies (name, kind, image_url, sort_order)
select v.name, v.kind, v.image_url, v.sort_order
from (values
  ('バディ', 'dog', '/images/mascot-aiken.png', 0),
  ('ポチ', 'dog', '/images/mascot-aiken.png', 1),
  ('コロ', 'dog', '/images/mascot-aiken.png', 2)
) as v(name, kind, image_url, sort_order)
where not exists (select 1 from public.buddies);
