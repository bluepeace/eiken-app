-- seed_reading_long_content_4kyu_additions.sql
-- 英検4級 長文の内容一致 追加問題（レベルチェック４級 5.5 の例題「Lucy's First Pet」より）
-- 実行: seed_reading_long_content_4kyu_50.sql 実行後に実行

-- Passage: Lucy's First Pet（レベルチェック例題）
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'narrative', 'long_content',
  'Lucy''s First Pet

Lucy is 9 years old. She likes to play with her cousin Jane and Jane''s cat at Jane''s house. Jane is 10 years old. One day, Jane''s cat had four baby cats. Lucy asked Jane''s mother, "Can I have one?" Jane''s mother said, "Ask your parents."

Lucy went home and asked her mother. Her mother said, "Can you promise to take care of it every day?" Lucy said, "Yes, I can!" Her mother said, "OK. You can have a cat." Lucy was very happy. She said, "I''m the happiest girl in the whole world!"',
  'Lucy''s First Pet',
  'Lucy''s First Pet

Lucy is 9 years old. She likes to play with her cousin Jane and Jane''s cat at Jane''s house. Jane is 10 years old. One day, Jane''s cat had four baby cats. Lucy asked Jane''s mother, "Can I have one?" Jane''s mother said, "Ask your parents."

Lucy went home and asked her mother. Her mother said, "Can you promise to take care of it every day?" Lucy said, "Yes, I can!" Her mother said, "OK. You can have a cat." Lucy was very happy. She said, "I''m the happiest girl in the whole world!"'
);

INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How old is Lucy?',
  '["She is 8 years old.", "She is 9 years old.", "She is 10 years old.", "She is 11 years old."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Lucy''s First Pet' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Lucy like to do?',
  '["She likes to read books.", "She likes to play with her cousin.", "She likes to cook.", "She likes to study."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Lucy''s First Pet' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What kind of animal will Lucy have?',
  '["She will have a dog.", "She will have a cat.", "She will have a bird.", "She will have a fish."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Lucy''s First Pet' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Who will take care of Lucy''s cat?',
  '["Jane will.", "Lucy''s mother will.", "Lucy will.", "Jane''s mother will."]', 2, 3
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Lucy''s First Pet' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why did Lucy say "I''m the happiest girl in the whole world!"?',
  '["Because she played with Jane.", "Because she saw the baby cats.", "Because she can have a pet.", "Because she went home."]', 2, 4
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Lucy''s First Pet' ORDER BY id DESC LIMIT 1;
