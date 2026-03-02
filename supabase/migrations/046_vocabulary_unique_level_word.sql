-- 046_vocabulary_unique_level_word.sql
-- vocabulary に (level, word) のユニーク制約を追加し、シードの再実行を冪等にする
-- 既存の重複がある場合は id が小さい方を残す

-- 1. 重複を削除（id が大きい方を削除）
DELETE FROM public.vocabulary a
USING public.vocabulary b
WHERE a.id > b.id
  AND a.level = b.level
  AND a.word = b.word;

-- 2. ユニーク制約を追加
ALTER TABLE public.vocabulary
  ADD CONSTRAINT vocabulary_level_word_unique UNIQUE (level, word);
