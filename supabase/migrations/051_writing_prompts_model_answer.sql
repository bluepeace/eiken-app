-- 051_writing_prompts_model_answer.sql
-- 英作文・Eメール・要約問題に模範解答を追加

alter table public.writing_prompts
  add column if not exists model_answer text;

comment on column public.writing_prompts.model_answer is '模範解答。ユーザーが参照可能';
