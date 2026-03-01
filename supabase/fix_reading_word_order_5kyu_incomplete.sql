-- fix_reading_word_order_5kyu_incomplete.sql
-- 語句だけでは正解英文が不完全だった3問を、日本文・語句・正解並びで完結する形に修正（既存DB用）
-- 参照: docs/seed_reading_word_order_5kyu_レビュー.md
-- 実行: 語句整序5級データが入っているDBで実行

-- 問6: この写真の中の女の子はだれですか → あの女の子はだれですか。Who is that girl?
UPDATE public.reading_word_order_questions
SET prompt_ja = 'あの女の子はだれですか。',
    words = '["that girl", "who", "is"]',
    correct_order = '[1, 2, 0]'
WHERE level = '5級' AND prompt_ja = 'この写真の中の女の子はだれですか。';

-- 問36: 今日は私たちの修学旅行の初日です → 今日は初日です。Today is the first day.
UPDATE public.reading_word_order_questions
SET prompt_ja = '今日は初日です。',
    words = '["today", "is", "the first day"]',
    correct_order = '[0, 1, 2]'
WHERE level = '5級' AND prompt_ja = '今日は私たちの修学旅行の初日です。';

-- 問39: 私は浩のために朝食を作っています → 私は朝食を作っています。I am cooking breakfast.
UPDATE public.reading_word_order_questions
SET prompt_ja = '私は朝食を作っています。',
    words = '["I", "am", "cooking", "breakfast"]',
    correct_order = '[0, 1, 2, 3]'
WHERE level = '5級' AND prompt_ja = '私は浩のために朝食を作っています。';

-- 解説も新しい日本文に合わせて更新（上記3問）
UPDATE public.reading_word_order_questions SET explanation = '「だれ」は Who。Who の疑問文は Who + be動詞 + 主語。That girl で「あの女の子」。' WHERE level = '5級' AND prompt_ja = 'あの女の子はだれですか。';
UPDATE public.reading_word_order_questions SET explanation = 'Today is the first day. で「今日は初日です」。SVC の文です。' WHERE level = '5級' AND prompt_ja = '今日は初日です。';
UPDATE public.reading_word_order_questions SET explanation = '現在進行形は am + -ing。I am cooking breakfast で「私は朝食を作っている」。' WHERE level = '5級' AND prompt_ja = '私は朝食を作っています。';
