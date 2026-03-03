-- seed_writing_prompts_jun2kyuplus_essay_model_answers.sql
-- 英検準2級プラス 英作文問題の模範解答を追加
-- 051_writing_prompts_model_answer マイグレーション実行後に実行

-- 問題1: 外国人の駅利用
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is difficult for foreign visitors to use train stations in Japan. First, many signs and announcements are only in Japanese. Second, the train system is very complex, and it is hard to find the right platform.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '外国人の駅利用';

-- 問題2: 観光地近くの住居
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is good for people to live near famous sightseeing spots. First, they can enjoy beautiful views and nature every day. Second, they can easily visit these places and learn more about their local culture.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '観光地近くの住居';

-- 問題3: レジ袋とマイバッグ
UPDATE public.writing_prompts
SET model_answer = 'I think it is better for people to bring bags from home. First, it helps reduce plastic waste and protect the environment. Second, reusable bags are stronger and can be used many times, so we save money in the long run.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = 'レジ袋とマイバッグ';

-- 問題4: 公共交通の利用
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think people should use public transportation more often to protect the environment. First, buses and trains produce less pollution than cars when many people use them. Second, it helps reduce traffic and makes our cities cleaner.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '公共交通の利用';

-- 問題5: 図書館の役割
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is good for students to spend time at the library. First, they can focus on studying without distractions from home. Second, libraries have many books and resources that help students learn new things.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '図書館の役割';

-- 問題6: オンライン学習
UPDATE public.writing_prompts
SET model_answer = 'I think it is better for students to study in a classroom. First, they can ask questions directly to the teacher and get immediate help. Second, studying with classmates helps them stay motivated and learn from each other.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = 'オンライン学習';

-- 問題7: リサイクル
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think people should recycle more to help the environment. First, recycling reduces the amount of waste that goes to landfills. Second, it saves natural resources because we can reuse materials instead of making new ones.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = 'リサイクル';

-- 問題8: 観光地と地元住民
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is good for towns to have many tourists. First, tourism brings money to local businesses and helps the economy. Second, tourists can learn about different cultures and share their experiences with others.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '観光地と地元住民';

-- 問題9: 自転車通勤
UPDATE public.writing_prompts
SET model_answer = 'I think it is better for people to go to work by bicycle. First, cycling is good for health and helps people stay fit. Second, it does not produce pollution and is better for the environment than driving a car.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '自転車通勤';

-- 問題10: 英語学習の開始時期
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think children should start learning English at an early age. First, young children can learn new sounds and pronunciation more easily. Second, it gives them more time to practice and become confident in using the language.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '英語学習の開始時期';

-- 問題11: 休日の過ごし方
UPDATE public.writing_prompts
SET model_answer = 'I think it is better for people to spend their free time with friends. First, spending time with others helps reduce stress and makes us happier. Second, we can share experiences and create good memories together.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '休日の過ごし方';

-- 問題12: 地元の食べ物
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is good for people to eat food from their local area. First, local food is often fresher and healthier because it does not travel far. Second, buying local food supports farmers and helps the local economy.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '地元の食べ物';

-- 問題13: ペットを飼うこと
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is good for families to have a pet. First, pets teach children how to be responsible and take care of others. Second, pets can help reduce stress and make family members feel happier.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = 'ペットを飼うこと';

-- 問題14: 若者のスマートフォン
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is difficult for young people to live without smartphones. First, they use them for school, communication, and staying in touch with friends. Second, many apps and services are designed to work mainly on smartphones.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '若者のスマートフォン';

-- 問題15: 読書の習慣
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is good for people to read books regularly. First, reading helps improve vocabulary and language skills. Second, books can teach us about different topics and help us imagine new worlds.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '読書の習慣';

-- 問題16: オンラインショッピングと店舗
UPDATE public.writing_prompts
SET model_answer = 'I think it is better for people to shop at stores. First, they can see and try products before buying them. Second, shopping at stores helps support local businesses and creates jobs in the community.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = 'オンラインショッピングと店舗';

-- 問題17: 運動の習慣
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is important for students to exercise every day. First, exercise helps keep the body healthy and strong. Second, it helps students focus better in class and reduces stress.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '運動の習慣';

-- 問題18: 海外旅行
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is good for young people to travel abroad. First, they can experience different cultures and learn new ways of thinking. Second, traveling helps them improve their language skills and become more independent.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '海外旅行';

-- 問題19: 窓口とセルフ端末
UPDATE public.writing_prompts
SET model_answer = 'I think it is better for customers to use self-service machines. First, they are faster and we do not have to wait in long lines. Second, we can complete our tasks at any time, even when the counter is closed.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '窓口とセルフ端末';

-- 問題20: 公園の役割
UPDATE public.writing_prompts
SET model_answer = 'Yes, I think it is important for cities to have many parks. First, parks provide a place for people to relax and enjoy nature. Second, they are good for children to play and for adults to exercise.'
WHERE level = '準2級プラス' AND prompt_type = 'essay' AND title = '公園の役割';
