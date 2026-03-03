-- seed_writing_prompts_3kyu_email_model_answers.sql
-- 英検3級 Eメール問題の模範解答を追加
-- 051_writing_prompts_model_answer マイグレーション実行後に実行

-- 問題1: スマートフォンについて
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. I use my smartphone for about two hours a day. I use it to watch videos and chat with my friends.'
WHERE level = '3級' AND prompt_type = 'email' AND title = 'スマートフォンについて';

-- 問題2: 好きな科目
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. My favorite subject is English. I like it because I want to talk with people from other countries.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '好きな科目';

-- 問題3: 週末の過ごし方
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. I usually play sports and study on weekends. Next weekend I want to go to the park with my family.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '週末の過ごし方';

-- 問題4: 好きな食べ物
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. My favorite food is sushi. I usually eat it on weekends with my family.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '好きな食べ物';

-- 問題5: 好きなスポーツ
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. My favorite sport is soccer. I play it three times a week after school.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '好きなスポーツ';

-- 問題6: 夏休みの予定
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. I want to go to the beach this summer. I want to go to Okinawa with my family.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '夏休みの予定';

-- 問題7: 音楽について
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. Yes, I like music. I like pop music because it makes me happy.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '音楽について';

-- 問題8: 学校のクラブ活動
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. Yes, I belong to the tennis club. I practice tennis with my friends there.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '学校のクラブ活動';

-- 問題9: 将来の夢
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. I want to become a teacher. I want to help children learn new things.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '将来の夢';

-- 問題10: ペットについて
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. Yes, I have a pet. I have a dog and his name is Pochi.'
WHERE level = '3級' AND prompt_type = 'email' AND title = 'ペットについて';

-- 問題11: 誕生日
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. My birthday is in March. I usually have a party with my family and friends.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '誕生日';

-- 問題12: 好きな季節
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. My favorite season is spring. I like it because I can see cherry blossoms.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '好きな季節';

-- 問題13: 朝の過ごし方
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. I get up at 6:30 every morning. I eat breakfast and read a book before school.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '朝の過ごし方';

-- 問題14: 好きなテレビ番組
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. Yes, I like to watch TV. My favorite program is sports news.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '好きなテレビ番組';

-- 問題15: 旅行について
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. Yes, I like to travel. I want to go to London next year.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '旅行について';

-- 問題16: 読書について
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. Yes, I like reading. I like mystery books because they are exciting.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '読書について';

-- 問題17: 学校への行き方
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. I go to school by bus every day. It takes about 20 minutes.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '学校への行き方';

-- 問題18: 冬の過ごし方
UPDATE public.writing_prompts
SET model_answer = 'Thank you for your e-mail. I like to ski in winter. Yes, I like snow because it is beautiful.'
WHERE level = '3級' AND prompt_type = 'email' AND title = '冬の過ごし方';
