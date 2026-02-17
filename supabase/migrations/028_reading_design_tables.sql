-- 028_reading_design_tables.sql
-- リーディング設計（READING_DESIGN.md）に基づくテーブル追加

-- 短文・会話の語句空所補充（大問1・2）
create table if not exists public.reading_short_questions (
  id bigserial primary key,
  level text not null,
  question_type text not null check (question_type in ('short_fill', 'conversation_fill')),
  body text not null,
  choices jsonb not null,
  correct_index smallint not null,
  created_at timestamptz not null default now()
);

create index if not exists idx_reading_short_questions_level_type
  on public.reading_short_questions (level, question_type);

-- 語句整序（5級・4級）
create table if not exists public.reading_word_order_questions (
  id bigserial primary key,
  level text not null,
  prompt_ja text not null,
  words jsonb not null,
  correct_order jsonb not null,
  created_at timestamptz not null default now()
);

create index if not exists idx_reading_word_order_questions_level
  on public.reading_word_order_questions (level);

-- 既存 reading_passages にカラム追加（長文の種別・ジャンル）
alter table public.reading_passages
  add column if not exists genre text,
  add column if not exists passage_type text check (passage_type in ('long_fill', 'long_content')),
  add column if not exists body text;

-- body が null の場合は content をコピー（既存データ互換）
update public.reading_passages set body = content where body is null and content is not null;
alter table public.reading_passages alter column body set default '';

-- 長文の語句空所補充用（空所ごとの選択肢）
create table if not exists public.reading_passage_blanks (
  id bigserial primary key,
  passage_id bigint not null references public.reading_passages (id) on delete cascade,
  blank_index smallint not null,
  choices jsonb not null,
  correct_index smallint not null,
  created_at timestamptz not null default now()
);

create index if not exists idx_reading_passage_blanks_passage_id
  on public.reading_passage_blanks (passage_id);

-- 長文の内容一致用設問（既存 reading_questions と役割が異なるため新規）
create table if not exists public.reading_passage_questions (
  id bigserial primary key,
  passage_id bigint not null references public.reading_passages (id) on delete cascade,
  question_text text not null,
  choices jsonb not null,
  correct_index smallint not null,
  order_num smallint not null default 0,
  created_at timestamptz not null default now()
);

create index if not exists idx_reading_passage_questions_passage_id
  on public.reading_passage_questions (passage_id);

-- 回答履歴
create table if not exists public.reading_results (
  id bigserial primary key,
  user_id uuid not null references public.user_profiles (id) on delete cascade,
  source_type text not null check (source_type in ('short', 'word_order', 'passage_fill', 'passage_content')),
  source_id bigint not null,
  user_answer smallint not null,
  is_correct boolean not null,
  created_at timestamptz not null default now()
);

create index if not exists idx_reading_results_user_id
  on public.reading_results (user_id);

-- RLS: 問題テーブルは全員 SELECT のみ
alter table public.reading_short_questions enable row level security;
alter table public.reading_word_order_questions enable row level security;
alter table public.reading_passage_blanks enable row level security;
alter table public.reading_passage_questions enable row level security;

drop policy if exists "reading_short_questions は全員参照可能" on public.reading_short_questions;
create policy "reading_short_questions は全員参照可能"
  on public.reading_short_questions for select using (true);

drop policy if exists "reading_word_order_questions は全員参照可能" on public.reading_word_order_questions;
create policy "reading_word_order_questions は全員参照可能"
  on public.reading_word_order_questions for select using (true);

drop policy if exists "reading_passage_blanks は全員参照可能" on public.reading_passage_blanks;
create policy "reading_passage_blanks は全員参照可能"
  on public.reading_passage_blanks for select using (true);

drop policy if exists "reading_passage_questions は全員参照可能" on public.reading_passage_questions;
create policy "reading_passage_questions は全員参照可能"
  on public.reading_passage_questions for select using (true);

-- RLS: reading_results は自分の行のみ
alter table public.reading_results enable row level security;

drop policy if exists "自分の reading_results を参照可能" on public.reading_results;
create policy "自分の reading_results を参照可能"
  on public.reading_results for select
  using (
    user_id in (select id from public.user_profiles where auth_user_id = auth.uid())
  );

drop policy if exists "自分の reading_results を挿入可能" on public.reading_results;
create policy "自分の reading_results を挿入可能"
  on public.reading_results for insert
  with check (
    user_id in (select id from public.user_profiles where auth_user_id = auth.uid())
  );
