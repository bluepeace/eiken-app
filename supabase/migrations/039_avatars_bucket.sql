-- 039_avatars_bucket.sql
-- avatars バケット作成（プロフィールアバター・企業ロゴ・バディ画像等で使用）

insert into storage.buckets (id, name, public)
values ('avatars', 'avatars', true)
on conflict (id) do update set public = true;

-- 全員閲覧可能（公開バケット）
drop policy if exists "avatars 全員閲覧" on storage.objects;
create policy "avatars 全員閲覧"
  on storage.objects for select
  using (bucket_id = 'avatars');
