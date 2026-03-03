-- seed_writing_prompts_jun2kyu_essay_model_answers.sql
-- 英検準2級 英作文問題の模範解答を追加
-- 051_writing_prompts_model_answer マイグレーション実行後に実行

-- 問題1: アルバイトについて
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think students should do part-time jobs while they are in high school. First, they can learn how to manage money and become more responsible. Second, working helps them understand the real world and develop useful skills for their future.'
WHERE level = '準2級' AND prompt_type = 'essay' AND title = 'アルバイトについて';

-- 問題2: スマートフォンについて
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is good for high school students to have smartphones. First, they can use them to study and look up information quickly. Second, smartphones help them stay in touch with family and friends, especially in emergencies.'
WHERE level = '準2級' AND prompt_type = 'essay' AND title = 'スマートフォンについて';

-- 問題3: 留学について
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think more Japanese students should study abroad. First, they can improve their English skills by using the language every day. Second, living in another country helps them understand different cultures and become more open-minded.'
WHERE level = '準2級' AND prompt_type = 'essay' AND title = '留学について';

-- 問題4: 制服について
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think all high school students should wear school uniforms. First, uniforms help reduce the gap between rich and poor students. Second, students can focus more on their studies instead of worrying about what to wear every day.'
WHERE level = '準2級' AND prompt_type = 'essay' AND title = '制服について';

-- 問題5: 環境保護について
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think people should use more public transportation to protect the environment. First, buses and trains produce less pollution than cars when many people use them. Second, using public transportation helps reduce traffic and makes our cities cleaner.'
WHERE level = '準2級' AND prompt_type = 'essay' AND title = '環境保護について';
