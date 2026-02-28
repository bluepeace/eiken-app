-- 043_reading_passage_questions_explanation.sql
-- 長文の内容一致設問に解説カラムを追加

alter table public.reading_passage_questions
  add column if not exists explanation text;

comment on column public.reading_passage_questions.explanation is '正解の解説（日本語）';
