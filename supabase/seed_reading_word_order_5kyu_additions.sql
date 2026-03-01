-- seed_reading_word_order_5kyu_additions.sql
-- レベルチェック５級の頻出パターン（How old / Nice to meet you）を補強する追加問
-- 参照: docs/seed_reading_word_order_5kyu_レビュー.md
-- 実行: seed_reading_word_order_5kyu_50.sql 実行後に実行可

-- How old 疑問文（彼は何歳ですか。）
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', '彼は何歳ですか。', '["old", "how", "is", "he"]', '[1, 0, 2, 3]');

-- 挨拶（はじめまして。）
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', 'はじめまして。', '["to", "nice", "meet", "you"]', '[1, 0, 2, 3]');

-- What time 疑問文（今何時ですか。）※ 4語句
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('5級', '今何時ですか。', '["time", "what", "is", "it"]', '[1, 0, 2, 3]');
