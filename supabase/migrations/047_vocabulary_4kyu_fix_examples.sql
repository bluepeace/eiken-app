-- 047_vocabulary_4kyu_fix_examples.sql
-- 4級単語の例文 typo 修正（especially, finally, slowly, actually）
-- 046 実行後に実行可能。既存DBの修正用。

UPDATE public.vocabulary
SET example_en = 'I like fruit, especially apples.',
    example_ja = '果物が好きです。特にりんごが。'
WHERE level = '4級' AND word = 'especially';

UPDATE public.vocabulary
SET example_en = 'Finally, the rain stopped.',
    example_ja = 'ついに雨が止みました。'
WHERE level = '4級' AND word = 'finally';

UPDATE public.vocabulary
SET example_en = 'Speak more slowly, please.',
    example_ja = 'もっとゆっくり話してください。'
WHERE level = '4級' AND word = 'slowly';

UPDATE public.vocabulary
SET example_en = 'Actually, I don''t like natto.',
    example_ja = '実は納豆は好きではありません。'
WHERE level = '4級' AND word = 'actually';
