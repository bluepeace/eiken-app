-- seed_writing_prompts_1kyu_essay_model_answers.sql
-- 英検1級 英作文問題の模範解答を追加
-- 051_writing_prompts_model_answer マイグレーション実行後に実行

-- 問題1: 経済成長を最優先にすべきか
UPDATE public.writing_prompts
SET model_answer = 'I disagree with the idea that economic growth should be the top priority for governments. First, focusing only on growth often leads to environmental destruction and climate change, which will harm future generations. Second, economic growth does not always improve the quality of life for ordinary citizens; inequality can increase while the rich get richer. Third, governments should balance growth with other priorities such as healthcare, education, and social welfare. In conclusion, while economic growth is important, it should not come at the expense of environmental sustainability and social equality.'
WHERE level = '1級' AND prompt_type = 'essay' AND title = '経済成長を最優先にすべきか';

-- 問題2: 男女の真の平等は可能か
UPDATE public.writing_prompts
SET model_answer = 'I believe it is possible to achieve true equality between men and women, though it will require significant effort. First, many countries have already made progress through laws that guarantee equal rights in employment and education. Second, changing attitudes through education can help eliminate stereotypes and discrimination from an early age. Third, increasing the number of women in leadership positions will create role models and accelerate change. In conclusion, while challenges remain, a combination of legal reform, education, and representation can make true equality achievable.'
WHERE level = '1級' AND prompt_type = 'essay' AND title = '男女の真の平等は可能か';

-- 問題3: 再生可能エネルギーで気候変動は止められるか
UPDATE public.writing_prompts
SET model_answer = 'I believe that renewable energy alone will not be sufficient to stop climate change, though it is an essential part of the solution. First, the transition to renewable energy will take decades, and we need to reduce emissions immediately. Second, other sectors such as agriculture and industry also produce significant emissions that require different solutions. Third, we must also change our consumption patterns and reduce overall energy use. In conclusion, renewable energy is crucial, but we need a comprehensive approach including policy changes and lifestyle modifications.'
WHERE level = '1級' AND prompt_type = 'essay' AND title = '再生可能エネルギーで気候変動は止められるか';

-- 問題4: 絶滅危惧言語の保護
UPDATE public.writing_prompts
SET model_answer = 'I strongly believe that more should be done to preserve endangered languages. First, each language carries unique knowledge about culture, history, and the natural world that would be lost forever. Second, language is closely tied to identity; losing a language can cause communities to lose their sense of belonging. Third, linguistic diversity enriches humanity and helps us understand different ways of thinking. In conclusion, preserving endangered languages is not only a cultural duty but also benefits all of humanity.'
WHERE level = '1級' AND prompt_type = 'essay' AND title = '絶滅危惧言語の保護';

-- 問題5: SNS企業の規制
UPDATE public.writing_prompts
SET model_answer = 'I agree that governments should regulate social media companies more strictly. First, these platforms have been used to spread misinformation and hate speech, which can harm democracy and public safety. Second, social media companies collect vast amounts of user data, often without adequate consent or protection. Third, the algorithms that determine what users see can create echo chambers and amplify extreme content. In conclusion, stricter regulation is necessary to protect users and ensure that these powerful platforms serve the public interest.'
WHERE level = '1級' AND prompt_type = 'essay' AND title = 'SNS企業の規制';

-- 問題6: ベーシックインカム
UPDATE public.writing_prompts
SET model_answer = 'I believe universal basic income could be a good idea for modern societies, though it requires careful implementation. First, automation is eliminating many jobs, and a basic income could provide a safety net for those affected. Second, it would reduce poverty and give people the freedom to pursue education or start businesses without financial fear. Third, it could simplify the welfare system and reduce administrative costs. In conclusion, while funding and implementation are complex, basic income deserves serious consideration as societies change.'
WHERE level = '1級' AND prompt_type = 'essay' AND title = 'ベーシックインカム';

-- 問題7: テクノロジーと高齢化
UPDATE public.writing_prompts
SET model_answer = 'I believe technology can help address the problem of an aging population, though it cannot solve it completely. First, robots and AI can assist with caregiving, reducing the burden on healthcare workers and family members. Second, telemedicine and wearable devices can help elderly people live independently longer. Third, automation can compensate for labor shortages as the working-age population shrinks. In conclusion, technology will play an important role, but we also need policy changes such as immigration and retirement reform.'
WHERE level = '1級' AND prompt_type = 'essay' AND title = 'テクノロジーと高齢化';

-- 問題8: 死刑制度
UPDATE public.writing_prompts
SET model_answer = 'I believe the death penalty should be abolished worldwide. First, there is always a risk of executing innocent people, and this irreversible error can never be corrected. Second, studies have not proven that the death penalty effectively deters crime more than life imprisonment. Third, the death penalty is applied unfairly, often depending on the defendant''s race, wealth, or quality of legal representation. In conclusion, the risk of wrongful execution and the lack of proven benefits make abolition the more just and humane choice.'
WHERE level = '1級' AND prompt_type = 'essay' AND title = '死刑制度';
