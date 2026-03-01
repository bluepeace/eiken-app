-- seed_reading_word_order_5kyu_50.sql
-- 英検5級 語句整序問題 50問
-- 過去問（How much, What/Who/Where, Does/Do疑問文、肯定文、Let's、現在進行形など）のレベル・出題傾向を反映
-- 028 マイグレーション実行後に実行

-- ========== How much / How many 疑問文 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', 'これらの靴はいくらですか。', '["are", "how", "much", "these shoes"]', '[1, 2, 0, 3]'),
  ('5級', 'あの本はいくらですか。', '["is", "how", "much", "that book"]', '[1, 2, 0, 3]'),
  ('5級', 'あなたのクラスには何人の生徒がいますか。', '["students", "there", "how many", "are"]', '[2, 0, 3, 1]'),
  ('5級', '机の上にりんごがいくつありますか。', '["are", "there", "how many", "apples"]', '[2, 3, 0, 1]'),
  ('5級', 'あのカバンはいくらですか。', '["is", "how", "much", "that bag"]', '[1, 2, 0, 3]');

-- ========== What / Who / Where / When 疑問文 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', 'この写真の中の女の子はだれですか。', '["the girl", "in", "who", "is"]', '[2, 3, 0, 1]'),
  ('5級', 'あなたは今何をしていますか。', '["you", "doing", "are", "what"]', '[3, 2, 0, 1]'),
  ('5級', 'あなたの本はどこにありますか。', '["your book", "where", "is"]', '[1, 2, 0]'),
  ('5級', 'あなたはいつ学校に行きますか。', '["do", "you", "when", "go to school"]', '[2, 0, 1, 3]'),
  ('5級', '私たちは何が必要ですか。', '["do", "need", "what", "we"]', '[2, 0, 3, 1]'),
  ('5級', 'トムのお父さんは大学で何を教えていますか。', '["does", "what", "teach", "Tom''s father"]', '[1, 0, 3, 2]'),
  ('5級', 'あなたは朝何時に起きますか。', '["do", "you", "when", "get up in the morning"]', '[2, 0, 1, 3]'),
  ('5級', 'あの男の子はだれですか。', '["that boy", "who", "is"]', '[1, 2, 0]'),
  ('5級', 'あなたの誕生日はいつですか。', '["your birthday", "when", "is"]', '[1, 2, 0]'),
  ('5級', 'メアリーは何が好きですか。', '["does", "what", "like", "Mary"]', '[1, 0, 3, 2]');

-- ========== Does / Do 疑問文 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', 'あなたの妹さんは毎年スキーに行きますか。', '["go", "does", "your sister", "skiing"]', '[1, 2, 0, 3]'),
  ('5級', '彼は毎日勉強しますか。', '["study", "every day", "he", "does"]', '[3, 2, 0, 1]'),
  ('5級', 'あなたは日曜日にテニスをしますか。', '["play tennis", "you", "on Sundays", "do"]', '[3, 1, 0, 2]'),
  ('5級', '彼女は英語を話しますか。', '["she", "English", "speak", "does"]', '[3, 0, 2, 1]'),
  ('5級', 'あなたは野球が好きですか。', '["you", "baseball", "do", "like"]', '[2, 0, 3, 1]');

-- ========== 肯定文（SVO, SVC, 時・場所の前置詞句）==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', 'その花屋は毎日10時に開きます。', '["opens", "ten o''clock", "the flower shop", "at"]', '[2, 0, 3, 1]'),
  ('5級', '今日は私たちの修学旅行の初日です。', '["of", "is", "the first day", "today"]', '[3, 1, 2, 0]'),
  ('5級', '私の叔母はロンドンに住んでいます。', '["my aunt", "London", "lives", "in"]', '[0, 2, 3, 1]'),
  ('5級', '彼は毎朝7時に起きます。', '["gets up", "he", "at seven", "every morning"]', '[1, 0, 3, 2]'),
  ('5級', '私は浩のために朝食を作っています。', '["for", "breakfast", "am", "cooking"]', '[2, 3, 1, 0]'),
  ('5級', '彼女は音楽が好きです。', '["likes", "she", "music"]', '[1, 0, 2]'),
  ('5級', '私たちは公園でサッカーをします。', '["soccer", "we", "in the park", "play"]', '[1, 3, 0, 2]'),
  ('5級', '彼は月曜日に泳ぎます。', '["swims", "he", "on Mondays"]', '[1, 0, 2]'),
  ('5級', 'その猫はソファの上にいます。', '["the cat", "on", "is", "the sofa"]', '[0, 2, 3, 1]'),
  ('5級', '彼女は毎週土曜日にピアノを練習します。', '["the piano", "she", "every Saturday", "practices"]', '[1, 3, 0, 2]'),
  ('5級', 'その犬は庭にいます。', '["the dog", "in", "is", "the garden"]', '[0, 2, 3, 1]');

-- ========== Let's / Would you like ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', '放課後、公園でサッカーをしましょう。', '["play", "let''s", "in the park", "soccer"]', '[1, 0, 3, 2]'),
  ('5級', 'コーヒーのお代わりはいかがですか。', '["would", "like", "you", "some more coffee"]', '[0, 2, 1, 3]'),
  ('5級', '今から映画を見ましょう。', '["see", "now", "a movie", "let''s"]', '[3, 0, 2, 1]'),
  ('5級', 'ジュースをいかがですか。', '["would", "like", "you", "some juice"]', '[0, 2, 1, 3]'),
  ('5級', '今から宿題をしましょう。', '["do", "now", "our homework", "let''s"]', '[3, 0, 2, 1]');

-- ========== 現在進行形・Can ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', '彼女は今ピアノを弾いています。', '["is", "she", "playing", "the piano"]', '[1, 0, 2, 3]'),
  ('5級', 'あなたは英語を話せますか。', '["you", "English", "can", "speak"]', '[2, 0, 3, 1]'),
  ('5級', '私は泳ぐことができます。', '["swim", "can", "I"]', '[1, 2, 0]'),
  ('5級', '彼は今宿題をしています。', '["doing", "he", "his homework", "is"]', '[1, 3, 0, 2]'),
  ('5級', 'あなたは自転車に乗れますか。', '["you", "a bicycle", "can", "ride"]', '[2, 0, 3, 1]'),
  ('5級', '母は今夕食を作っています。', '["is", "my mother", "cooking", "dinner"]', '[1, 0, 2, 3]'),
  ('5級', '私は日本語を話すことができます。', '["speak", "Japanese", "I", "can"]', '[2, 3, 0, 1]');

-- ========== その他（否定・依頼・挨拶応答など）==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', '彼は今日学校にいません。', '["isn''t", "he", "at school", "today"]', '[1, 0, 2, 3]'),
  ('5級', '窓を開けてもいいですか。', '["open", "can", "I", "the window"]', '[2, 1, 0, 3]'),
  ('5級', '私の弟は魚が好きではありません。', '["doesn''t", "my brother", "like", "fish"]', '[1, 0, 2, 3]'),
  ('5級', '私は今日宿題がありません。', '["don''t", "I", "have", "any homework today"]', '[1, 0, 2, 3]'),
  ('5級', '彼女は昨日家にいませんでした。', '["wasn''t", "she", "at home", "yesterday"]', '[1, 0, 2, 3]'),
  ('5級', '水をいただけますか。', '["have", "can", "I", "some water"]', '[2, 1, 0, 3]'),
  ('5級', '彼は昨日学校に来ました。', '["came", "he", "to school", "yesterday"]', '[1, 0, 2, 3]');
