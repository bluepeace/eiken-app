-- seed_writing_prompts_3kyu_email_additions.sql
-- 英検3級 ライティング Eメール問題を追加（010 マイグレーション実行後に実行）
-- 形式: 友達からのEメールへの返信（2つの質問に答える）。語数の目安は15〜25語です。

-- 問題4: 好きな食べ物
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '好きな食べ物',
  '{"emailFrom":"Amy","emailContent":"Hi,\n\nThank you for your e-mail.\nI like to eat Japanese food.\nWhat is your favorite food? And when do you usually eat it?\n\nYour friend,\nAmy"}',
  15, 25,
  300, 480
);

-- 問題5: 好きなスポーツ
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '好きなスポーツ',
  '{"emailFrom":"Ben","emailContent":"Hi,\n\nThank you for your e-mail.\nI play soccer after school.\nWhat is your favorite sport? And how often do you play it?\n\nYour friend,\nBen"}',
  15, 25,
  300, 480
);

-- 問題6: 夏休みの予定
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '夏休みの予定',
  '{"emailFrom":"Kate","emailContent":"Hi,\n\nThank you for your e-mail.\nSummer vacation will start soon.\nWhat do you want to do this summer? And where do you want to go?\n\nYour friend,\nKate"}',
  15, 25,
  300, 480
);

-- 問題7: 音楽について
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '音楽について',
  '{"emailFrom":"Lucy","emailContent":"Hi,\n\nThank you for your e-mail.\nI like to listen to music every day.\nDo you like music? And what kind of music do you like?\n\nYour friend,\nLucy"}',
  15, 25,
  300, 480
);

-- 問題8: 学校のクラブ活動
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '学校のクラブ活動',
  '{"emailFrom":"Mike","emailContent":"Hi,\n\nThank you for your e-mail.\nI joined the tennis club at school.\nDo you belong to any club? And what do you do there?\n\nYour friend,\nMike"}',
  15, 25,
  300, 480
);

-- 問題9: 将来の夢
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '将来の夢',
  '{"emailFrom":"Sam","emailContent":"Hi,\n\nThank you for your e-mail.\nI want to become a doctor in the future.\nWhat do you want to be? And why do you want to do that?\n\nYour friend,\nSam"}',
  15, 25,
  300, 480
);

-- 問題10: ペットについて
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', 'ペットについて',
  '{"emailFrom":"Anna","emailContent":"Hi,\n\nThank you for your e-mail.\nI have a dog at home.\nDo you have a pet? And what is its name?\n\nYour friend,\nAnna"}',
  15, 25,
  300, 480
);

-- 問題11: 誕生日
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '誕生日',
  '{"emailFrom":"Jack","emailContent":"Hi,\n\nThank you for your e-mail.\nMy birthday is in December.\nWhen is your birthday? And what do you usually do on that day?\n\nYour friend,\nJack"}',
  15, 25,
  300, 480
);

-- 問題12: 好きな季節
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '好きな季節',
  '{"emailFrom":"Emma","emailContent":"Hi,\n\nThank you for your e-mail.\nI like spring because of cherry blossoms.\nWhat is your favorite season? And why do you like it?\n\nYour friend,\nEmma"}',
  15, 25,
  300, 480
);

-- 問題13: 朝の過ごし方
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '朝の過ごし方',
  '{"emailFrom":"Tom","emailContent":"Hi,\n\nThank you for your e-mail.\nI wake up at 6:30 every morning.\nWhat time do you get up? And what do you do before school?\n\nYour friend,\nTom"}',
  15, 25,
  300, 480
);

-- 問題14: 好きなテレビ番組
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '好きなテレビ番組',
  '{"emailFrom":"Sarah","emailContent":"Hi,\n\nThank you for your e-mail.\nI watch TV after dinner.\nDo you like to watch TV? And what is your favorite program?\n\nYour friend,\nSarah"}',
  15, 25,
  300, 480
);

-- 問題15: 旅行について
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '旅行について',
  '{"emailFrom":"James","emailContent":"Hi,\n\nThank you for your e-mail.\nI went to Kyoto last month.\nDo you like to travel? And where do you want to go?\n\nYour friend,\nJames"}',
  15, 25,
  300, 480
);

-- 問題16: 読書について
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '読書について',
  '{"emailFrom":"Ryan","emailContent":"Hi,\n\nThank you for your e-mail.\nI like to read books in my free time.\nDo you like reading? And what kind of books do you like?\n\nYour friend,\nRyan"}',
  15, 25,
  300, 480
);

-- 問題17: 学校への行き方
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '学校への行き方',
  '{"emailFrom":"Lisa","emailContent":"Hi,\n\nThank you for your e-mail.\nI go to school by bus every day.\nHow do you go to school? And how long does it take?\n\nYour friend,\nLisa"}',
  15, 25,
  300, 480
);

-- 問題18: 冬の過ごし方
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '3級', 'email', '冬の過ごし方',
  '{"emailFrom":"David","emailContent":"Hi,\n\nThank you for your e-mail.\nWinter is cold but I like it.\nWhat do you like to do in winter? And do you like snow?\n\nYour friend,\nDavid"}',
  15, 25,
  300, 480
);
