-- 037_question_counts_passage_count.sql
-- リーディング長文で「問題数」（パッセージ数）と「設問数」の両方を保存・表示する

alter table public.question_counts
  add column if not exists passage_count integer;

comment on column public.question_counts.passage_count is 'リーディング長文のみ: 問題数（パッセージ数）。count は設問数。';

create or replace function public.refresh_question_counts()
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if auth.uid() is not null and not exists (
    select 1 from public.user_profiles where auth_user_id = auth.uid() and role = 'admin'
  ) then
    return;
  end if;

  -- 単語テスト
  insert into question_counts (category, level, question_type, count, passage_count, updated_at)
  select 'vocabulary', level, null, count(*)::integer, null, now()
  from vocabulary
  group by level
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    passage_count = excluded.passage_count,
    updated_at = excluded.updated_at;

  -- ライティング
  insert into question_counts (category, level, question_type, count, passage_count, updated_at)
  select 'writing', level, prompt_type::text, count(*)::integer, null, now()
  from writing_prompts
  group by level, prompt_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    passage_count = excluded.passage_count,
    updated_at = excluded.updated_at;

  -- リーディング短文・会話
  insert into question_counts (category, level, question_type, count, passage_count, updated_at)
  select 'reading', level, question_type::text, count(*)::integer, null, now()
  from reading_short_questions
  group by level, question_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    passage_count = excluded.passage_count,
    updated_at = excluded.updated_at;

  -- リーディング語句整序
  insert into question_counts (category, level, question_type, count, passage_count, updated_at)
  select 'reading', level, 'word_order', count(*)::integer, null, now()
  from reading_word_order_questions
  group by level
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    passage_count = excluded.passage_count,
    updated_at = excluded.updated_at;

  -- リーディング長文 long_content：設問数 count、問題数（パッセージ数）passage_count
  insert into question_counts (category, level, question_type, count, passage_count, updated_at)
  select
    'reading',
    rp.level,
    rp.passage_type::text,
    count(pq.id)::integer,
    count(distinct rp.id)::integer,
    now()
  from reading_passages rp
  left join reading_passage_questions pq on pq.passage_id = rp.id
  where rp.passage_type = 'long_content'
  group by rp.level, rp.passage_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    passage_count = excluded.passage_count,
    updated_at = excluded.updated_at;

  -- リーディング長文 long_fill：空所数 count、問題数（パッセージ数）passage_count
  insert into question_counts (category, level, question_type, count, passage_count, updated_at)
  select
    'reading',
    rp.level,
    rp.passage_type::text,
    count(pb.id)::integer,
    count(distinct rp.id)::integer,
    now()
  from reading_passages rp
  left join reading_passage_blanks pb on pb.passage_id = rp.id
  where rp.passage_type = 'long_fill'
  group by rp.level, rp.passage_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    passage_count = excluded.passage_count,
    updated_at = excluded.updated_at;
end;
$$;
