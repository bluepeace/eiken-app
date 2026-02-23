-- 036_question_counts_reading_by_questions.sql
-- リーディング長文の集計を「パッセージ数」→「問題数（設問数・空所数）」に変更
-- これによりダッシュボードに 3級・4級・準2級 の長文内容一致の問題数が正しく反映される

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
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'vocabulary', level, null, count(*)::integer, now()
  from vocabulary
  group by level
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- ライティング
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'writing', level, prompt_type::text, count(*)::integer, now()
  from writing_prompts
  group by level, prompt_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- リーディング短文・会話
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'reading', level, question_type::text, count(*)::integer, now()
  from reading_short_questions
  group by level, question_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- リーディング語句整序
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'reading', level, 'word_order', count(*)::integer, now()
  from reading_word_order_questions
  group by level
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- リーディング長文：問題数で集計
  -- long_content = 設問数（reading_passage_questions）
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'reading', rp.level, rp.passage_type::text, count(pq.id)::integer, now()
  from reading_passages rp
  left join reading_passage_questions pq on pq.passage_id = rp.id
  where rp.passage_type = 'long_content'
  group by rp.level, rp.passage_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;

  -- long_fill = 空所数（reading_passage_blanks）
  insert into question_counts (category, level, question_type, count, updated_at)
  select 'reading', rp.level, rp.passage_type::text, count(pb.id)::integer, now()
  from reading_passages rp
  left join reading_passage_blanks pb on pb.passage_id = rp.id
  where rp.passage_type = 'long_fill'
  group by rp.level, rp.passage_type
  on conflict (category, level, question_type) do update set
    count = excluded.count,
    updated_at = excluded.updated_at;
end;
$$;
