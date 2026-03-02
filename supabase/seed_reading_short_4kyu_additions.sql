-- seed_reading_short_4kyu_additions.sql
-- 英検4級 短文の語句空所補充 追加問題（レベルチェック４級の例題より）
-- 実行: seed_reading_short_4kyu.sql, seed_reading_short_4kyu_extra.sql 実行後に実行

-- member / 会員（レベルチェック例題）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'My father is a __BLANK__ of a sports club. He plays tennis there every Wednesday night.',
  '["member", "festival", "picnic", "group"]',
  0,
  'スポーツクラブでテニスをしている人は「会員」なので "member" が正解。member は「会員、メンバー」の意味です。'
);

-- story / stories（レベルチェック例題）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'Mr. Clark told us many interesting __BLANK__ about his trip to India.',
  '["pictures", "books", "stories", "magazines"]',
  2,
  '「インド旅行についての面白い話」は "interesting stories" です。story の複数形 stories が正解。'
);

-- win（レベルチェック例題）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'Did you __BLANK__ in the speech contest? — Yes, I did. I''m happy.',
  '["walk", "fall", "ride", "win"]',
  3,
  '「スピーチコンテストで優勝しましたか」は "Did you win in the speech contest?" です。後半の "I''m happy" から良い結果＝勝った、と判断。win が正解。'
);

-- Good job（会話文・レベルチェック例題：ねぎらい）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'Boy: "I finished cleaning the bathroom, Dad." Father: "__BLANK__" Father: "You can play video games now."',
  '["Take care.", "I don''t know.", "Good job.", "You, too."]',
  2,
  'お風呂掃除を終えた息子へのねぎらいとして「よくやった」の "Good job." が自然。その後に「ゲームやっていいよ」と続く流れになります。'
);
