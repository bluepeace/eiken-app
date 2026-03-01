-- fix_reading_short_5kyu_level.sql
-- 短文語句空所 5級のうち、レベルがやや高めの3問を5級に寄せた修正（既存DB用）
-- 参照: docs/seed_reading_short_5kyu_レビュー.md
-- 実行: 既存の reading_short_questions に5級 short_fill が入っているDBで実行

-- (37) musician → music teacher
UPDATE public.reading_short_questions
SET
  body = 'Henry is a music __BLANK__. He plays the guitar and the piano.',
  choices = '["teacher", "rabbit", "jacket", "team"]',
  correct_index = 0,
  explanation = 'ギターとピアノを弾く人は「音楽の先生」なので "teacher" が正解。music teacher で「音楽の先生」。'
WHERE level = '5級' AND question_type = 'short_fill'
  AND body LIKE '%Henry is a __BLANK__%' AND body LIKE '%guitar and the piano%';

-- (42) trumpet → piano
UPDATE public.reading_short_questions
SET
  body = 'Mr. Brown is a music teacher. He plays the __BLANK__ very well.',
  choices = '["piano", "cup", "clock", "pencil"]',
  correct_index = 0,
  explanation = '音楽の先生が弾く「楽器」は piano（ピアノ）が自然。play the 〜 で楽器を演奏する。'
WHERE level = '5級' AND question_type = 'short_fill'
  AND body LIKE '%Mr. Brown is a music teacher%' AND body LIKE '%plays the __BLANK__%';

-- (46) I'd like → I want（What do you want to drink? / I want some water.）
UPDATE public.reading_short_questions
SET
  body = 'A: What do you __BLANK__ to drink? B: I want some water, please.',
  choices = '["want", "like", "have", "need"]',
  correct_index = 0,
  explanation = '「何が飲みたい？」は "What do you want to drink?" です。「水がほしい」は "I want some water." で答えます。'
WHERE level = '5級' AND question_type = 'short_fill'
  AND body LIKE '%What would you like to drink%' AND body LIKE '%I''d __BLANK__ some water%';
