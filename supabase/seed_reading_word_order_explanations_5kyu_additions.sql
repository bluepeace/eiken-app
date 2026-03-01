-- seed_reading_word_order_explanations_5kyu_additions.sql
-- 追加した語句整序5級3問の解説（seed_reading_word_order_5kyu_additions.sql 実行後に実行）

UPDATE public.reading_word_order_questions SET explanation = '「何歳」は How old。How old + be動詞 + 主語 の語順。How old is he? で「彼は何歳ですか」。' WHERE level = '5級' AND prompt_ja = '彼は何歳ですか。';
UPDATE public.reading_word_order_questions SET explanation = '初対面の挨拶は Nice to meet you. で「はじめまして」。Nice + to meet + you の語順。' WHERE level = '5級' AND prompt_ja = 'はじめまして。';
UPDATE public.reading_word_order_questions SET explanation = '「何時」は What time。What time is it? で「今何時ですか」。時刻を聞く定型表現。' WHERE level = '5級' AND prompt_ja = '今何時ですか。';
