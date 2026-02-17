-- seed_reading_sample.sql
-- リーディング各形式のサンプル問題（028 マイグレーション実行後に実行）
-- 2級・4級で各1〜2問ずつ入れ、ページ動作確認用

-- ========== 短文の語句空所補充（2級・short_fill）==========
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index)
VALUES
  (
    '2級', 'short_fill',
    'The new policy will __BLANK__ the way we work from next month.',
    '["change", "changing", "changed", "changes"]',
    0
  ),
  (
    '2級', 'short_fill',
    'She has __BLANK__ to finish the report by Friday.',
    '["promised", "promise", "promising", "promises"]',
    0
  );

-- ========== 短文の語句空所（A/B形式の例・2級・short_fill）==========
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index)
VALUES
  (
    '2級', 'short_fill',
    'A: I think we should leave early to avoid the traffic.\nB: __BLANK__\nA: Yes, the highway is always busy on Fridays.',
    '["Do you think it will be crowded?", "What time do you want to leave?", "Is that a good idea?", "Would you like to take the train instead?"]',
    0
  );

-- ========== 語句整序（4級・5級）==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order)
VALUES
  (
    '4級',
    '私は毎日学校に歩いて行きます。',
    '["I", "walk", "to", "school", "every", "day."]',
    '[0, 1, 2, 3, 4, 5]'
  ),
  (
    '5級',
    '彼はサッカーが好きです。',
    '["He", "likes", "soccer."]',
    '[0, 1, 2]'
  );

-- ========== 長文の語句空所補充（2級・1パッセージ＋2空所）==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES
  (
    '2級', 'explanation', 'long_fill',
    'Many people enjoy reading books in their free time. __BLANK__ reading can improve your vocabulary and knowledge, some find it difficult to make time for it. __BLANK__ you can start with just 10 minutes a day, you may soon find yourself wanting to read more.',
    'Reading habits',
    'Many people enjoy reading books in their free time. __BLANK__ reading can improve your vocabulary and knowledge, some find it difficult to make time for it. __BLANK__ you can start with just 10 minutes a day, you may soon find yourself wanting to read more.'
  );

INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Although", "However", "Therefore", "Besides"]', 0 FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["If", "When", "Because", "Until"]', 0 FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 長文の内容一致選択（2級・1パッセージ＋2設問）==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES
  (
    '2級', 'email', 'long_content',
    'From: sales@bookstore.com\nTo: Customers\nSubject: Summer Reading Campaign\n\nWe are happy to announce our summer reading campaign. From July 1st to August 31st, you can get 20% off all English learning books. We have also added new titles for students preparing for exams. Visit our website or your nearest store to learn more. Thank you for your continued support.',
    'Summer Reading Campaign',
    'From: sales@bookstore.com\nTo: Customers\nSubject: Summer Reading Campaign\n\nWe are happy to announce our summer reading campaign. From July 1st to August 31st, you can get 20% off all English learning books. We have also added new titles for students preparing for exams. Visit our website or your nearest store to learn more. Thank you for your continued support.'
  );

INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is the main purpose of this email?',
  '["To announce a discount period.", "To introduce new staff.", "To change the store opening hours.", "To ask for customer feedback."]',
  0, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How long does the campaign last?',
  '["One month.", "Two months.", "Three months.", "Until the end of the year."]',
  1, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
