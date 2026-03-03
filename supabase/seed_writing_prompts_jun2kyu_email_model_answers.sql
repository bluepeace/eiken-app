-- seed_writing_prompts_jun2kyu_email_model_answers.sql
-- 英検準2級 Eメール問題の模範解答を追加
-- 051_writing_prompts_model_answer マイグレーション実行後に実行
-- 形式: 感想＋下線部への質問2つ＋相手の質問への回答＋理由（40〜50語）

-- 問題1: ボランティアクラブについて（Emma）
UPDATE public.writing_prompts
SET model_answer = 'It''s great that you joined a volunteer club! Where do you usually do the volunteer work? Do you work alone or with other members? As for your question, I think students should do volunteer activities because it helps them learn about their community and become more caring.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = 'ボランティアクラブについて（Emma）';

-- 問題2: スポーツクラブについて（Ryan）
UPDATE public.writing_prompts
SET model_answer = 'It''s nice that you joined the tennis club! What kind of advice does your coach give you? How many members are in your club? I think joining a sports club is good for students because it helps them stay healthy and make new friends.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = 'スポーツクラブについて（Ryan）';

-- 問題3: 環境保護について（Lisa）
UPDATE public.writing_prompts
SET model_answer = 'It''s wonderful that your family is reducing plastic waste! What color is your water bottle? Where do you usually take it? I think small actions like these can help the environment because many people doing small things together can make a big difference.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '環境保護について（Lisa）';

-- 問題4: 音楽クラブについて（Tom）
UPDATE public.writing_prompts
SET model_answer = 'It''s exciting that you have a band! What songs will you play at the festival? How long have you played the guitar? I think learning a musical instrument is good for students because it helps them express themselves and work with others.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '音楽クラブについて（Tom）';

-- 問題5: 読書クラブについて（Sarah）
UPDATE public.writing_prompts
SET model_answer = 'It''s interesting that you like mystery books! What is your favorite mystery book? How many books do you read each month? I think reading books is important for students because it improves their vocabulary and imagination.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '読書クラブについて（Sarah）';

-- 問題6: 料理について（Jake）
UPDATE public.writing_prompts
SET model_answer = 'It''s nice that you cook with your family! What Italian dishes do you usually make? How often do you cook on weekends? I think learning to cook is useful for students because it is an important life skill for the future.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '料理について（Jake）';

-- 問題7: アルバイトについて（Mia）
UPDATE public.writing_prompts
SET model_answer = 'It''s great that you got a part-time job! What do you do at the cafe? Do you enjoy talking to customers? I think having a part-time job is good for high school students because they can learn responsibility and save money.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = 'アルバイトについて（Mia）';

-- 問題8: ホームステイについて（Alex）
UPDATE public.writing_prompts
SET model_answer = 'It''s exciting that you are going to Australia! How old are the children in your host family? What do you want to do with them? I think studying abroad is a good experience for students because they can improve their English and learn about different cultures.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = 'ホームステイについて（Alex）';

-- 問題9: 早起きについて（Chris）
UPDATE public.writing_prompts
SET model_answer = 'It''s great that you wake up early! What kind of book do you read in the morning? Do you drink coffee every day? I think it is good for students to wake up early because they have more time to prepare for the day.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '早起きについて（Chris）';

-- 問題10: 英語の映画について（Kate）
UPDATE public.writing_prompts
SET model_answer = 'It''s nice that you watch movies in English! What was the comedy movie about? Do you use English or Japanese subtitles? I think watching movies in English is good for learning because it helps you hear natural expressions and new words.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '英語の映画について（Kate）';

-- 問題11: ペットについて（Ben）
UPDATE public.writing_prompts
SET model_answer = 'It''s wonderful that you have a dog! What color is Max? How big is he? I think it is good for children to have a pet because it teaches them responsibility and gives them a friend to play with.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = 'ペットについて（Ben）';

-- 問題12: 朝食について（Amy）
UPDATE public.writing_prompts
SET model_answer = 'It''s nice that you eat breakfast with your family! What do you usually eat for breakfast? Do you help your mother cook? I think eating breakfast is important for students because it gives them energy to study and concentrate in class.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '朝食について（Amy）';

-- 問題13: 図書館について（Dan）
UPDATE public.writing_prompts
SET model_answer = 'It''s great that you go to the library every Saturday! What do you usually do there? Do you use the computers? I think students should use the library regularly because it is a quiet place to study and has many free resources.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '図書館について（Dan）';

-- 問題14: 外国語学習について（Noah）
UPDATE public.writing_prompts
SET model_answer = 'It''s interesting that you study Spanish! How often do you practice with your friend? What do you talk about? I think all students should learn a foreign language because it helps them communicate with people from other countries.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '外国語学習について（Noah）';

-- 問題15: スポーツ観戦について（Olivia）
UPDATE public.writing_prompts
SET model_answer = 'It''s exciting that you watch sports with your father! Which stadium do you go to? How often do you watch live games? I think watching sports is a good way to spend free time because it is fun and you can learn about teamwork.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = 'スポーツ観戦について（Olivia）';

-- 問題16: 地元の観光について（Sophie）
UPDATE public.writing_prompts
SET model_answer = 'It''s wonderful that you visited five cities! Which cities did you visit? What did you learn about your country? I think people should visit their own country first because it is cheaper and helps you understand your culture.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '地元の観光について（Sophie）';

-- 問題17: 手書きについて（Henry）
UPDATE public.writing_prompts
SET model_answer = 'It''s good that you practice handwriting every day! What do you write when you practice? Do you use a pen or pencil? I think students should still learn handwriting because we need it for forms and it helps us remember better.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '手書きについて（Henry）';

-- 問題18: 週末の過ごし方について（Emma）
UPDATE public.writing_prompts
SET model_answer = 'It''s nice that you spend time with your family! What do you do at the park? Do you go there every Sunday? I think it is better to spend weekends with family because it helps us stay connected and relax together.'
WHERE level = '準2級' AND prompt_type = 'email' AND title = '週末の過ごし方について（Emma）';
