-- seed_writing_prompts_jun2kyu_email_additions.sql
-- 英検準2級 ライティング Eメール問題を追加（010 マイグレーション実行後に実行）
-- 形式: 外国人の知り合いからのEメールへの返信（質問への回答＋下線部への質問2つ）
-- 語数: 40〜50語

-- 問題9: Chris - 早起き
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', '早起きについて（Chris）',
  '{"emailFrom":"Chris","emailContent":"Hi!\n\nI started waking up at 5:30 every morning last month. At first it was very difficult, but now I enjoy the quiet morning time. I use this time to study or exercise before school. I feel more energetic during the day.\n\nI usually drink a cup of coffee and read a book for 20 minutes.\n\nDo you think it is good for students to wake up early?\n\nYour friend,\nChris","underlinedPart":"I usually drink a cup of coffee and read a book for 20 minutes.","question":"Do you think it is good for students to wake up early?"}',
  40, 50,
  360, 600
);

-- 問題10: Kate - 映画を英語で観る
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', '英語の映画について（Kate）',
  '{"emailFrom":"Kate","emailContent":"Hi!\n\nI have been watching movies in English with subtitles every week. It helps me learn new words and natural expressions. At first I could not understand much, but now I can follow the story better. I think it is a fun way to study English.\n\nLast week I watched a comedy movie and laughed a lot.\n\nDo you think watching movies in English is good for learning?\n\nYour friend,\nKate","underlinedPart":"Last week I watched a comedy movie and laughed a lot.","question":"Do you think watching movies in English is good for learning?"}',
  40, 50,
  360, 600
);

-- 問題11: Ben - ペット
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', 'ペットについて（Ben）',
  '{"emailFrom":"Ben","emailContent":"Hi!\n\nMy family got a dog last year. His name is Max and he is very friendly. I take him for a walk every morning and evening. Having a pet teaches me responsibility and makes our home happier.\n\nMax likes to play with a ball in the park.\n\nDo you think it is good for children to have a pet?\n\nYour friend,\nBen","underlinedPart":"Max likes to play with a ball in the park.","question":"Do you think it is good for children to have a pet?"}',
  40, 50,
  360, 600
);

-- 問題12: Amy - 朝食
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', '朝食について（Amy）',
  '{"emailFrom":"Amy","emailContent":"Hi!\n\nI always eat breakfast before going to school. My mother makes rice, miso soup, and fish for me every morning. I think breakfast is important because it gives me energy for the day. When I skip breakfast, I cannot concentrate in class.\n\nI eat breakfast at 7 o''clock with my family.\n\nDo you think eating breakfast is important for students?\n\nYour friend,\nAmy","underlinedPart":"I eat breakfast at 7 o''clock with my family.","question":"Do you think eating breakfast is important for students?"}',
  40, 50,
  360, 600
);

-- 問題13: Dan - 図書館利用
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', '図書館について（Dan）',
  '{"emailFrom":"Dan","emailContent":"Hi!\n\nI go to the library near my school every Saturday. It is a quiet place where I can study and read books. I borrow about three books every month. The library also has computers that students can use for free.\n\nI usually stay at the library for two or three hours.\n\nDo you think students should use the library regularly?\n\nYour friend,\nDan","underlinedPart":"I usually stay at the library for two or three hours.","question":"Do you think students should use the library regularly?"}',
  40, 50,
  360, 600
);

-- 問題14: Noah - 外国語学習
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', '外国語学習について（Noah）',
  '{"emailFrom":"Noah","emailContent":"Hi!\n\nAt my school, all students must learn at least one foreign language. I am studying Japanese and Spanish. Learning languages helps me understand different cultures and communicate with more people. It is challenging but very interesting.\n\nI practice Spanish with my friend from Mexico online.\n\nDo you think all students should learn a foreign language?\n\nYour friend,\nNoah","underlinedPart":"I practice Spanish with my friend from Mexico online.","question":"Do you think all students should learn a foreign language?"}',
  40, 50,
  360, 600
);

-- 問題15: Olivia - スポーツ観戦
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', 'スポーツ観戦について（Olivia）',
  '{"emailFrom":"Olivia","emailContent":"Hi!\n\nI love watching sports on TV, especially soccer and tennis. I watch games with my father every weekend. It is exciting to see athletes play their best. I also learn about teamwork and the importance of practice from sports.\n\nWe sometimes go to the stadium to watch live games.\n\nDo you think watching sports is a good way to spend free time?\n\nYour friend,\nOlivia","underlinedPart":"We sometimes go to the stadium to watch live games.","question":"Do you think watching sports is a good way to spend free time?"}',
  40, 50,
  360, 600
);

-- 問題16: Sophie - 地元の観光
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', '地元の観光について（Sophie）',
  '{"emailFrom":"Sophie","emailContent":"Hi!\n\nLast summer I visited many famous places in my country before traveling abroad. I learned a lot about our history and culture. I think it is good to know your own country first. The trip was cheaper than going overseas too.\n\nI visited five different cities in two weeks.\n\nDo you think people should visit their own country before traveling abroad?\n\nYour friend,\nSophie","underlinedPart":"I visited five different cities in two weeks.","question":"Do you think people should visit their own country before traveling abroad?"}',
  40, 50,
  360, 600
);

-- 問題17: Henry - 手書き
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', '手書きについて（Henry）',
  '{"emailFrom":"Henry","emailContent":"Hi!\n\nMy teacher says that handwriting is still important even in the digital age. I write my notes by hand in class because it helps me remember better. We also need to write by hand when we fill out forms or take exams.\n\nI practice handwriting for 10 minutes every day.\n\nDo you think students should still learn handwriting?\n\nYour friend,\nHenry","underlinedPart":"I practice handwriting for 10 minutes every day.","question":"Do you think students should still learn handwriting?"}',
  40, 50,
  360, 600
);

-- 問題18: Emma - 週末の過ごし方
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級', 'email', '週末の過ごし方について（Emma）',
  '{"emailFrom":"Emma","emailContent":"Hi!\n\nI like to spend my weekends with my family. We often go shopping together or have a big dinner at home. Sometimes I meet my friends, but family time is more important to me. I think it helps us stay connected.\n\nWe usually go to the park on Sunday morning.\n\nDo you think it is better to spend weekends with family or with friends?\n\nYour friend,\nEmma","underlinedPart":"We usually go to the park on Sunday morning.","question":"Do you think it is better to spend weekends with family or with friends?"}',
  40, 50,
  360, 600
);
