-- 050_organizations_slug.sql
-- 企業スラッグ: ログイン・会員登録URLで企業ロゴを切り替えるため

alter table public.organizations
  add column if not exists slug text unique;

comment on column public.organizations.slug is 'URL用識別子（例: worldtalk）。ログイン/会員登録の /login/worldtalk, ?s=worldtalk で企業ロゴを表示';

-- AIKEN (id=1) にデフォルトスラッグを設定
update public.organizations set slug = 'aiken' where id = 1 and slug is null;

-- スラッグが設定された企業は未認証ユーザーも参照可能（ロゴ表示用）
drop policy if exists "スラッグ付き企業は未認証でも参照可能" on public.organizations;
create policy "スラッグ付き企業は未認証でも参照可能"
  on public.organizations for select
  using (slug is not null);
