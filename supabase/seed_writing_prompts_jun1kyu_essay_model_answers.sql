-- seed_writing_prompts_jun1kyu_essay_model_answers.sql
-- 英検準1級 英作文問題の模範解答を追加
-- 051_writing_prompts_model_answer マイグレーション実行後に実行

-- 問題1: スポーツ・体育への投資
UPDATE public.writing_prompts
SET model_answer = 'I believe governments should invest more in sports and physical education. First, from the perspective of public health, regular exercise helps prevent obesity and heart disease, which reduces healthcare costs in the long run. Second, youth engagement in sports teaches teamwork and discipline, helping young people develop important life skills. While some may argue that academic subjects deserve more funding, I think a balance between education and physical activity is essential. In conclusion, investing in sports benefits both individual health and society as a whole.'
WHERE level = '準1級' AND prompt_type = 'essay' AND title = 'スポーツ・体育への投資';

-- 問題2: 自転車の利用促進
UPDATE public.writing_prompts
SET model_answer = 'I think people should be encouraged to use bicycles instead of cars in cities. First, from an environmental perspective, bicycles produce no pollution and help reduce carbon emissions. Second, cycling improves health by providing regular exercise, which can reduce stress and prevent lifestyle-related diseases. Although safety is a concern in busy cities, better cycling lanes can address this issue. In conclusion, promoting bicycle use would make our cities cleaner and healthier for everyone.'
WHERE level = '準1級' AND prompt_type = 'essay' AND title = '自転車の利用促進';

-- 問題3: 宇宙開発への投資
UPDATE public.writing_prompts
SET model_answer = 'I believe governments should spend more money on space exploration. First, scientific discovery from space research has led to many innovations that we use in daily life, such as GPS and medical technology. Second, space exploration inspires national pride and encourages young people to study science and engineering. While some argue that budget priorities should focus on Earth''s problems, I think space research can help us find solutions to environmental issues too. In conclusion, investing in space exploration benefits both science and society.'
WHERE level = '準1級' AND prompt_type = 'essay' AND title = '宇宙開発への投資';

-- 問題4: 気候変動の学校教育
UPDATE public.writing_prompts
SET model_answer = 'I strongly believe schools should teach more about climate change and environmental issues. First, future generations need to understand these problems so they can make informed decisions and take action. Second, scientific literacy about the environment helps students understand the world around them and think critically. Although some worry about curriculum balance, environmental education can be integrated into existing subjects. In conclusion, teaching about climate change is essential for preparing students to address global challenges.'
WHERE level = '準1級' AND prompt_type = 'essay' AND title = '気候変動の学校教育';

-- 問題5: 週4日労働制
UPDATE public.writing_prompts
SET model_answer = 'I think companies should adopt a four-day work week. First, studies show that productivity can increase when workers have more rest, as they return to work more focused and energetic. Second, a shorter work week improves well-being by giving people more time for family, hobbies, and rest. While some argue that tradition and economy may suffer, many companies that have tried this have reported positive results. In conclusion, the four-day work week could benefit both employees and employers.'
WHERE level = '準1級' AND prompt_type = 'essay' AND title = '週4日労働制';

-- 問題6: 大学の無償化
UPDATE public.writing_prompts
SET model_answer = 'I believe university education should be free for all students. First, from the perspective of equality, free education would allow talented students from poor families to attend university, regardless of their financial situation. Second, a more educated workforce benefits the economy and society as a whole. Although government budget is a concern, the long-term benefits of an educated population outweigh the costs. In conclusion, making university free would create a fairer and more prosperous society.'
WHERE level = '準1級' AND prompt_type = 'essay' AND title = '大学の無償化';

-- 問題7: 投票年齢の引き下げ
UPDATE public.writing_prompts
SET model_answer = 'I think the voting age should be lowered to 16. First, lowering the age would increase political engagement among young people, as they would feel that their opinions matter. Second, 16-year-olds are affected by many government policies, such as education and climate change, so they deserve a say in these decisions. Although some question the maturity of 16-year-olds, many countries have successfully lowered the voting age. In conclusion, giving young people the right to vote would strengthen democratic representation.'
WHERE level = '準1級' AND prompt_type = 'essay' AND title = '投票年齢の引き下げ';
