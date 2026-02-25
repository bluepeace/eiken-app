-- 035_question_counts.sql
-- 管理ダッシュボード用：級・問題種別ごとの問題数をバッチ集計して保存するテーブル

create table if not exists public.question_counts (
  id bigserial primary key,
  category text not null check (category in ('vocabulary', 'writing', 'reading')),
  level text not null,
  question_type text,
  count integer not null default 0,
  updated_at timestamptz not null default now(),
  unique (category, level, question_type)
);

create index if not exists idx_question_counts_category
  on public.question_counts (category);

comment on table public.question_counts is '管理用：単語・ライティング・リーディングの級・種別ごとの問題数（バッチで更新）';

alter table public.question_counts enable row level security;

create policy "question_counts は管理者のみ参照可能"
  on public.question_counts for select
  using (
    exists (
      select 1 from public.user_profiles
      where auth_user_id = auth.uid() and role = 'admin'
    )
  );

-- 集計を実行する関数（cron または管理画面の「今すぐ集計」から呼ぶ）
-- 管理者のみ実行可能（cron の場合は service role で呼ぶ想定）
create or replace function public.refresh_question_counts()
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  -- 管理者以外は何もしない（cron で service role の場合は auth.uid() が null のためスキップされないよう、存在チェックで許可）
  if auth.uid() is not null and not exists (
    select 1 from public.user_profiles where auth_user_id = auth.uid() and role = 'admin'
  ) then
    return;
  end if;

  -- 単語テスト：vocabulary テーブルを level で集計
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'vocabulary', level, null, count(*)::integer, now()
  from vocabulary
  group by level
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- 存在しない級の単語は 0 で揃えたい場合は別途；ここでは実在する級のみ挿入

  -- ライティング：writing_prompts を level, prompt_type で集計
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'writing', level, prompt_type::text, count(*)::integer, now()
  from writing_prompts
  group by level, prompt_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- リーディング短文・会話：reading_short_questions
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'reading', level, question_type::text, count(*)::integer, now()
  from reading_short_questions
  group by level, question_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- リーディング語句整序：reading_word_order_questions（question_type = 'word_order'）
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'reading', level, 'word_order', count(*)::integer, now()
  from reading_word_order_questions
  group by level
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- リーディング長文：reading_passages（long_fill / long_content）
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'reading', level, passage_type::text, count(*)::integer, now()
  from reading_passages
  where passage_type in ('long_fill', 'long_content')
  group by level, passage_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;
end;
$$;

-- 管理者（認証済み）および cron 用 service_role から実行可能にする
grant execute on function public.refresh_question_counts() to authenticated;
grant execute on function public.refresh_question_counts() to service_role;

-- 初回実行でデータを入れておく
select public.refresh_question_counts();
