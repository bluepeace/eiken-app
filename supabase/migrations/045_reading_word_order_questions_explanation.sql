-- 045_reading_word_order_questions_explanation.sql
-- 語句整序問題に解説カラムを追加

alter table public.reading_word_order_questions
  add column if not exists explanation text;

comment on column public.reading_word_order_questions.explanation is '正解の解説（日本語）';
