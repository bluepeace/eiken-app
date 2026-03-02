-- fix_reading_short_4kyu_level.sql
-- 短文語句空所 4級のうち、レベルが3級寄りの問題を4級に寄せた修正（既存DB用）
-- 参照: docs/seed_reading_short_4kyu_レビュー.md
-- 実行: 既存の reading_short_questions に4級 short_fill が入っているDBで実行

-- (15) college → scientist（4級範囲外の語彙を修正）
UPDATE public.reading_short_questions
SET
  body = 'A: What does your brother do, Ms. Brown?
B: He''s a __BLANK__. He studies science at a high school.',
  choices = '["scientist", "towel", "mistake", "station"]',
  correct_index = 0,
  explanation = '科学を学んでいる人は「科学者」を目指しているので "scientist" が正解。scientist は「科学者」の意味です。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%Ms. Brown%' AND body LIKE '%computer science%';

-- (38) professional → famous（4級範囲外の語彙を修正）
UPDATE public.reading_short_questions
SET
  body = 'Kentaro wants to be a __BLANK__ baseball player in the future. He practices every day.',
  choices = '["famous", "difficult", "strange", "thick"]',
  correct_index = 0,
  explanation = '「将来有名な野球選手になりたい」は "famous baseball player" です。famous は「有名な」の意味で4級頻出語です。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%Kentaro wants to be a __BLANK__ baseball player%' AND body LIKE '%United States%';

-- (42) castle → museum（4級範囲外の語彙を修正）
UPDATE public.reading_short_questions
SET
  body = 'Yumi visited a __BLANK__ last weekend. She likes learning about history.',
  choices = '["dictionary", "question", "museum", "cloud"]',
  correct_index = 2,
  explanation = '歴史を学ぶために訪れるのは「博物館」なので "museum" が正解。museum は4級でよく出る語です。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%Yumi visited a __BLANK__ last weekend%' AND body LIKE '%history%';

-- (53) since（現在完了）→ when（接続詞・中2範囲）
UPDATE public.reading_short_questions
SET
  body = 'I met her __BLANK__ we were in elementary school. We have been friends since then.',
  choices = '["when", "since", "for", "ago"]',
  correct_index = 0,
  explanation = '「小学校のときに会った」は "when we were in elementary school" です。when は「〜のときに」という接続詞です。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%I have known her __BLANK__ we were in elementary school%';

-- (54) for（現在完了の期間）→ on（曜日・中2範囲）
UPDATE public.reading_short_questions
SET
  body = 'We have soccer practice __BLANK__ Wednesday. I always look forward to it.',
  choices = '["on", "at", "in", "from"]',
  correct_index = 0,
  explanation = '曜日の前には "on" を使います。"on Wednesday" で「水曜日に」という意味です。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%They have lived in this town __BLANK__ ten years%';

-- (79) have taken（現在完了）→ took（過去形）
UPDATE public.reading_short_questions
SET
  body = 'She __BLANK__ many photos of the mountains last summer. They are beautiful.',
  choices = '["take", "takes", "took", "taken"]',
  correct_index = 2,
  explanation = '「去年の夏に撮った」は過去の出来事なので、take の過去形 "took" が正解です。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%She has __BLANK__ many photos of the mountains%';

-- (80) have been to（現在完了）→ went（過去形）
UPDATE public.reading_short_questions
SET
  body = 'I __BLANK__ to Paris two years ago. It was wonderful.',
  choices = '["go", "went", "going", "gone"]',
  correct_index = 1,
  explanation = '「2年前にパリに行った」は過去の出来事なので、go の過去形 "went" が正解です。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%Have you ever __BLANK__ to Paris%';

-- (94) although（逆接・中3範囲）→ So（結果・中2範囲）
UPDATE public.reading_short_questions
SET
  body = 'It was raining. __BLANK__ we took our umbrellas and went to the park.',
  choices = '["Because", "So", "Although", "If"]',
  correct_index = 1,
  explanation = '「雨だった。だから傘を持って公園に行った」は "So we took" です。So は「だから」と結果を表します。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%__BLANK__ it was raining, we went to the park%' AND body LIKE '%umbrellas%';

-- (95) whether（中3範囲）→ when（疑問詞・中2範囲）
UPDATE public.reading_short_questions
SET
  body = 'I don''t know __BLANK__ the train leaves. Let me check the schedule.',
  choices = '["when", "whether", "that", "what"]',
  correct_index = 0,
  explanation = '「電車がいつ出るかわからない」は "I don''t know when the train leaves" です。when は「いつ」を表す疑問詞です。'
WHERE level = '4級' AND question_type = 'short_fill'
  AND body LIKE '%I don''t know __BLANK__ she will come to the party or not%';
