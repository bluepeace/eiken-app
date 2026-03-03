-- seed_writing_prompts_jun2kyu_essay_additions.sql
-- 英検準2級 英作文問題を追加（051 マイグレーション実行後に実行）
-- 形式: QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。語数の目安は50～60語です。

-- 問題6: 読書
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '読書の習慣',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for students to read books every day?',
  50, 60,
  600, 900,
  'Yes, I think it is good for students to read books every day. First, reading helps improve their vocabulary and language skills. Second, books can teach them about different topics and help them imagine new worlds.'
);

-- 問題7: 朝食
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '朝食について',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is important for students to eat breakfast every morning?',
  50, 60,
  600, 900,
  'Yes, I think it is important for students to eat breakfast every morning. First, breakfast gives them energy to study and concentrate in class. Second, students who eat breakfast tend to be healthier and perform better at school.'
);

-- 問題8: ペット
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', 'ペットを飼うこと',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for children to have a pet?',
  50, 60,
  600, 900,
  'Yes, I think it is good for children to have a pet. First, pets teach children how to be responsible and take care of others. Second, having a pet can help reduce stress and make children feel happier.'
);

-- 問題9: 外国語学習
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '外国語学習',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think all students should learn a foreign language at school?',
  50, 60,
  600, 900,
  'Yes, I think all students should learn a foreign language at school. First, it helps them communicate with people from other countries. Second, learning another language can open up more job opportunities in the future.'
);

-- 問題10: スポーツ観戦
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', 'スポーツ観戦',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think watching sports on TV is a good way to spend free time?',
  50, 60,
  600, 900,
  'Yes, I think watching sports on TV is a good way to spend free time. First, it is exciting and can help people relax after a busy day. Second, watching sports can teach us about teamwork and the importance of practice.'
);

-- 問題11: 図書館
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '図書館の利用',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for students to use the library regularly?',
  50, 60,
  600, 900,
  'Yes, I think it is good for students to use the library regularly. First, libraries have many books and resources that students can use for free. Second, the library is a quiet place where students can focus on studying.'
);

-- 問題12: 料理
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '料理を学ぶこと',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think students should learn how to cook at school?',
  50, 60,
  600, 900,
  'Yes, I think students should learn how to cook at school. First, cooking is an important life skill that everyone needs. Second, learning to cook healthy meals can help students live a healthier life when they grow up.'
);

-- 問題13: ボランティア
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', 'ボランティア活動',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think high school students should do volunteer work?',
  50, 60,
  600, 900,
  'Yes, I think high school students should do volunteer work. First, it helps them understand the needs of others and become more caring. Second, volunteer work gives students useful experience that can help them in the future.'
);

-- 問題14: 映画
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '映画を英語で観ること',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for students to watch movies in English?',
  50, 60,
  600, 900,
  'Yes, I think it is good for students to watch movies in English. First, it helps them improve their listening skills and learn natural expressions. Second, watching movies can make learning English more fun and interesting.'
);

-- 問題15: 早起き
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '早起きについて',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is better to wake up early in the morning?',
  50, 60,
  600, 900,
  'Yes, I think it is better to wake up early in the morning. First, you have more time to prepare for the day and avoid rushing. Second, many people feel more productive in the morning when their mind is fresh.'
);

-- 問題16: 地元の観光
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '地元の観光',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for people to visit tourist spots in their own country first?',
  50, 60,
  600, 900,
  'Yes, I think it is good for people to visit tourist spots in their own country first. First, it is cheaper and easier than traveling abroad. Second, you can learn more about your own culture and history before exploring other countries.'
);

-- 問題17: 手書き
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '手書きの重要性',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is still important for students to learn handwriting?',
  50, 60,
  600, 900,
  'Yes, I think it is still important for students to learn handwriting. First, we still need to write by hand in many situations, such as filling out forms. Second, studies show that writing by hand helps us remember things better.'
);

-- 問題18: 週末の過ごし方
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '準2級', 'essay', '週末の過ごし方',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is better to spend weekends with family or with friends?',
  50, 60,
  600, 900,
  'I think it depends on the person, but spending time with family is important. First, family time helps us stay connected and support each other. Second, we can relax and be ourselves with our family without worrying about anything.'
);
