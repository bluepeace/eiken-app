-- seed_reading_short_5kyu_additions.sql
-- レベルチェック５級の話題（道案内・教科・時刻・買い物・映画・音楽）を補強する追加問
-- 参照: docs/seed_reading_short_5kyu_レビュー.md
-- 実行: seed_reading_short_5kyu.sql および seed_reading_short_5kyu_extra.sql の後に実行可

-- 道案内（Turn right）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: Where is the post office? B: Turn __BLANK__ at the corner. You will see it.',
  '["right", "left", "up", "down"]',
  0,
  '「角を右に曲がって」は "Turn right at the corner." です。right は「右」、left は「左」。'
);

-- 教科（science）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: What is your favorite subject? B: I like __BLANK__. It is interesting.',
  '["science", "soccer", "breakfast", "Sunday"]',
  0,
  '「好きな教科」の答えとして「理科」は "science" です。subject は「教科」。'
);

-- 時刻（at）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I get up __BLANK__ seven every morning. Then I eat breakfast.',
  '["at", "on", "in", "for"]',
  0,
  '「7時に起きる」は "get up at seven" です。時刻の前には at を使います。'
);

-- 買い物（How much）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: How __BLANK__ is this bag? B: It is 3,000 yen.',
  '["many", "much", "old", "long"]',
  1,
  '「いくらですか」は "How much is 〜?" です。much は値段や量を聞くときに使います。'
);

-- 映画（movie）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'Let''s see a __BLANK__ tonight. There is a good one at the cinema.',
  '["movie", "book", "song", "game"]',
  0,
  '「今夜映画を見よう」は "Let''s see a movie." です。movie は「映画」。cinema は「映画館」。'
);

-- 音楽（music）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I like __BLANK__. I listen to it every day.',
  '["music", "homework", "soccer", "window"]',
  0,
  '「音楽が好き」は "I like music." です。music は「音楽」という名詞。'
);
