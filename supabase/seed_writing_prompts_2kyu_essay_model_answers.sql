-- seed_writing_prompts_2kyu_essay_model_answers.sql
-- 英検2級 英作文問題の模範解答を追加
-- 051_writing_prompts_model_answer マイグレーション実行後に実行

-- 問題1: 宇宙旅行について
UPDATE public.writing_prompts
SET model_answer = 'I think it is a good idea for people to travel to space as tourists. First, it would be an amazing experience that could inspire more people to learn about science and technology. Space travel could help us understand our planet better when we see it from above. Second, although the cost is high now, more tourists could help develop safer and cheaper technology in the future. I believe that space tourism will become more common and accessible over time.'
WHERE level = '2級' AND prompt_type = 'essay' AND title = '宇宙旅行について';

-- 問題2: リモートワークについて
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think working from home will become the normal way to work in the future. First, technology has improved so much that we can communicate and share work online easily. Many companies have already seen that remote work is possible. Second, working from home helps people achieve a better work-life balance. They can spend more time with family and avoid long commutes. I believe that more companies will offer flexible work options in the future.'
WHERE level = '2級' AND prompt_type = 'essay' AND title = 'リモートワークについて';

-- 問題3: 学生のアルバイトについて
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is a good idea for students to have part-time jobs. First, they can learn how to manage money and understand the value of work. Earning their own money helps them become more responsible. Second, part-time jobs teach students time management skills. They need to balance work, study, and rest, which is important for their future. I believe that these experiences will help students prepare for adult life.'
WHERE level = '2級' AND prompt_type = 'essay' AND title = '学生のアルバイトについて';

-- 問題4: デジタル教科書について
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think using digital textbooks is better than using paper ones. First, digital textbooks are more convenient because students can carry many books in one device. They can also search for information quickly and easily. Second, digital textbooks are better for the environment because they reduce the need for paper. This helps save trees and reduce waste. I believe that schools will use more digital materials in the future.'
WHERE level = '2級' AND prompt_type = 'essay' AND title = 'デジタル教科書について';
