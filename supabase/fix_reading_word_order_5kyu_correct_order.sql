-- fix_reading_word_order_5kyu_correct_order.sql
-- 既に登録済みの5級語句整序の [0,1,2,3] / [0,1,2] を解消（語句並びの変更）
-- 045 マイグレーション適用済み・語句整序5級データが入っているDBで実行してください

-- ========== 正解並びの誤り修正（「let's see now a movie」→「let's see a movie now」） ==========
UPDATE public.reading_word_order_questions
SET words = '["see", "now", "a movie", "let''s"]', correct_order = '[3, 0, 2, 1]'
WHERE level = '5級' AND prompt_ja = '今から映画を見ましょう。';

-- ========== How many 疑問文 ==========
UPDATE public.reading_word_order_questions
SET words = '["students", "there", "how many", "are"]', correct_order = '[2, 0, 3, 1]'
WHERE level = '5級' AND prompt_ja = 'あなたのクラスには何人の生徒がいますか。';

UPDATE public.reading_word_order_questions
SET words = '["are", "there", "how many", "apples"]', correct_order = '[2, 3, 0, 1]'
WHERE level = '5級' AND prompt_ja = '机の上にりんごがいくつありますか。';

-- ========== What do we need ==========
UPDATE public.reading_word_order_questions
SET words = '["do", "need", "what", "we"]', correct_order = '[2, 0, 3, 1]'
WHERE level = '5級' AND prompt_ja = '私たちは何が必要ですか。';

-- ========== Does / Do 疑問文 ==========
-- 彼は毎日勉強しますか → 正解表示を「does he every day study」→「Does he study every day?」に修正
UPDATE public.reading_word_order_questions
SET words = '["study", "every day", "he", "does"]', correct_order = '[3, 2, 0, 1]'
WHERE level = '5級' AND prompt_ja = '彼は毎日勉強しますか。';

UPDATE public.reading_word_order_questions
SET words = '["play tennis", "you", "on Sundays", "do"]', correct_order = '[3, 1, 0, 2]'
WHERE level = '5級' AND prompt_ja = 'あなたは日曜日にテニスをしますか。';

UPDATE public.reading_word_order_questions
SET words = '["she", "English", "speak", "does"]', correct_order = '[3, 0, 2, 1]'
WHERE level = '5級' AND prompt_ja = '彼女は英語を話しますか。';

UPDATE public.reading_word_order_questions
SET words = '["you", "baseball", "do", "like"]', correct_order = '[2, 0, 3, 1]'
WHERE level = '5級' AND prompt_ja = 'あなたは野球が好きですか。';

-- ========== Let's ==========
UPDATE public.reading_word_order_questions
SET words = '["do", "now", "our homework", "let''s"]', correct_order = '[3, 0, 2, 1]'
WHERE level = '5級' AND prompt_ja = '今から宿題をしましょう。';

-- ========== Can ==========
UPDATE public.reading_word_order_questions
SET words = '["you", "English", "can", "speak"]', correct_order = '[2, 0, 3, 1]'
WHERE level = '5級' AND prompt_ja = 'あなたは英語を話せますか。';

UPDATE public.reading_word_order_questions
SET words = '["swim", "can", "I"]', correct_order = '[1, 2, 0]'
WHERE level = '5級' AND prompt_ja = '私は泳ぐことができます。';

UPDATE public.reading_word_order_questions
SET words = '["you", "a bicycle", "can", "ride"]', correct_order = '[2, 0, 3, 1]'
WHERE level = '5級' AND prompt_ja = 'あなたは自転車に乗れますか。';

UPDATE public.reading_word_order_questions
SET words = '["speak", "Japanese", "I", "can"]', correct_order = '[2, 3, 0, 1]'
WHERE level = '5級' AND prompt_ja = '私は日本語を話すことができます。';
