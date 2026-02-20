-- 035_organizations.sql
-- 企業管理: 企業テーブルと会員の所属企業

-- 企業テーブル
create table if not exists public.organizations (
  id bigserial primary key,
  name text not null,
  created_at timestamptz not null default now()
);

alter table public.organizations enable row level security;

-- 管理者のみ参照・更新可能（会員用ポリシーは organization_id 追加後に作成）
drop policy if exists "管理者は organizations を全件参照可能" on public.organizations;
create policy "管理者は organizations を全件参照可能"
  on public.organizations for select
  using (public.is_admin());

drop policy if exists "管理者は organizations を挿入可能" on public.organizations;
create policy "管理者は organizations を挿入可能"
  on public.organizations for insert
  with check (public.is_admin());

drop policy if exists "管理者は organizations を更新可能" on public.organizations;
create policy "管理者は organizations を更新可能"
  on public.organizations for update
  using (public.is_admin());

-- デフォルト企業（WEBから登録したユーザーはすべてここに所属）
insert into public.organizations (id, name)
values (1, 'AIKEN')
on conflict (id) do nothing;

-- 既存の id シーケンスを 2 以降に（手動登録企業用）
select setval(
  pg_get_serial_sequence('public.organizations', 'id'),
  greatest((select coalesce(max(id), 1) from public.organizations), 1)
);

-- user_profiles に所属企業を追加（ポリシーで参照するため先に追加）
alter table public.user_profiles
  add column if not exists organization_id bigint references public.organizations (id) on delete set null;

comment on column public.user_profiles.organization_id is '所属企業。WEB登録は 1 (AIKEN)、企業契約時は管理者が手動で設定';

-- 既存ユーザーはすべて AIKEN (1) に所属
update public.user_profiles
set organization_id = 1
where organization_id is null;

-- 会員は自分が所属する企業のみ参照可能（organization_id 追加後に作成）
drop policy if exists "会員は自分が所属する企業のみ参照可能" on public.organizations;
create policy "会員は自分が所属する企業のみ参照可能"
  on public.organizations for select
  using (
    id in (
      select organization_id from public.user_profiles
      where auth_user_id = auth.uid() and organization_id is not null
    )
  );
