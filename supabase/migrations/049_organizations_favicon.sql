-- 049_organizations_favicon.sql
-- 企業ファビコン用カラムとストレージポリシー

alter table public.organizations
  add column if not exists favicon_url text;

comment on column public.organizations.favicon_url is '企業ファビコン画像のURL（ストレージの public URL）。未設定の場合はデフォルトの AiKen ファビコンを表示';

-- ストレージ: avatars バケットに organization-favicons/ で画像を保存可能（管理者のみ）
drop policy if exists "avatars organization-favicons 管理者アップロード" on storage.objects;
create policy "avatars organization-favicons 管理者アップロード"
  on storage.objects for insert
  with check (
    bucket_id = 'avatars' and (name like 'organization-favicons/%') and public.is_admin()
  );

drop policy if exists "avatars organization-favicons 管理者更新" on storage.objects;
create policy "avatars organization-favicons 管理者更新"
  on storage.objects for update
  using (
    bucket_id = 'avatars' and (name like 'organization-favicons/%') and public.is_admin()
  );

drop policy if exists "avatars organization-favicons 管理者削除" on storage.objects;
create policy "avatars organization-favicons 管理者削除"
  on storage.objects for delete
  using (
    bucket_id = 'avatars' and (name like 'organization-favicons/%') and public.is_admin()
  );
