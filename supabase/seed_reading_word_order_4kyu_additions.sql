-- seed_reading_word_order_4kyu_additions.sql
-- 英検4級 語句整序 追加問題（レベルチェック４級 4.5 の例題より）
-- 実行: seed_reading_word_order_4kyu_50.sql 実行後に実行

-- レベルチェック４級 例題: 数学のテストの間、教室はとても静かでした。
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', '数学のテストの間、教室はとても静かでした。', '["during the math test", "was", "quiet", "very", "The classroom"]', '[4, 1, 3, 2, 0]');
