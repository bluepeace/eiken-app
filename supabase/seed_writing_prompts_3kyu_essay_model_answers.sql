-- seed_writing_prompts_3kyu_essay_model_answers.sql
-- 英検3級 英作文問題の模範解答を追加
-- 051_writing_prompts_model_answer マイグレーション実行後に実行

-- 問題1: 夏に行きたい場所
UPDATE public.writing_prompts
SET model_answer = 'I would like to go to Hokkaido this summer. First, I want to see beautiful flowers. Second, I like to eat fresh seafood there.'
WHERE level = '3級' AND prompt_type = 'essay' AND title = '夏に行きたい場所';

-- 問題2: 好きなスポーツ
UPDATE public.writing_prompts
SET model_answer = 'My favorite sport is soccer. First, I can play it with my friends. Second, it is exciting to score a goal.'
WHERE level = '3級' AND prompt_type = 'essay' AND title = '好きなスポーツ';

-- 問題3: 週末にしたいこと
UPDATE public.writing_prompts
SET model_answer = 'I like to read books on weekends. First, I can learn many things from them. Second, reading helps me relax.'
WHERE level = '3級' AND prompt_type = 'essay' AND title = '週末にしたいこと';

-- 問題4: 好きな科目
UPDATE public.writing_prompts
SET model_answer = 'My favorite subject is English. First, I want to talk with people from other countries. Second, I like learning new words.'
WHERE level = '3級' AND prompt_type = 'essay' AND title = '好きな科目';

-- 問題5: 将来やりたいこと
UPDATE public.writing_prompts
SET model_answer = 'I want to become a teacher in the future. First, I like to help children learn. Second, teaching is a meaningful job.'
WHERE level = '3級' AND prompt_type = 'essay' AND title = '将来やりたいこと';

-- 問題6: 好きな食べ物
UPDATE public.writing_prompts
SET model_answer = 'My favorite food is sushi. First, it is very delicious and fresh. Second, I can eat many kinds of fish.'
WHERE level = '3級' AND prompt_type = 'essay' AND title = '好きな食べ物';

-- 問題7: 音楽について
UPDATE public.writing_prompts
SET model_answer = 'Yes, I like to listen to music. First, it makes me happy when I feel tired. Second, I can enjoy it while studying.'
WHERE level = '3級' AND prompt_type = 'essay' AND title = '音楽について';

-- 問題8: 雨の日について
UPDATE public.writing_prompts
SET model_answer = 'No, I do not like rainy days. First, I cannot play outside. Second, I feel sleepy when it rains.'
WHERE level = '3級' AND prompt_type = 'essay' AND title = '雨の日について';
