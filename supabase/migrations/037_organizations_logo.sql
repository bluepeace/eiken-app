-- 037_organizations_logo.sql
-- 企業ロゴ用カラムとストレージポリシー

alter table public.organizations
  add column if not exists logo_url text;

comment on column public.organizations.logo_url is '企業ロゴ画像のURL（ストレージの public URL）。未設定の場合は AiKen ロゴを表示';

-- ストレージ: avatars バケットに organization-logos/ で画像を保存可能（管理者のみ）
drop policy if exists "avatars organization-logos 管理者アップロード" on storage.objects;
create policy "avatars organization-logos 管理者アップロード"
  on storage.objects for insert
  with check (
    bucket_id = 'avatars' and (name like 'organization-logos/%') and public.is_admin()
  );

drop policy if exists "avatars organization-logos 管理者更新" on storage.objects;
create policy "avatars organization-logos 管理者更新"
  on storage.objects for update
  using (
    bucket_id = 'avatars' and (name like 'organization-logos/%') and public.is_admin()
  );

drop policy if exists "avatars organization-logos 管理者削除" on storage.objects;
create policy "avatars organization-logos 管理者削除"
  on storage.objects for delete
  using (
    bucket_id = 'avatars' and (name like 'organization-logos/%') and public.is_admin()
  );
