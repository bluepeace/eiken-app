-- 030_reading_short_questions_explanation.sql
-- 短文・会話問題に解説カラムを追加

alter table public.reading_short_questions
  add column if not exists explanation text;

comment on column public.reading_short_questions.explanation is '正解の解説（日本語）';
