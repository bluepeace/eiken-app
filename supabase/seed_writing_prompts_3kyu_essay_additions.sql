-- seed_writing_prompts_3kyu_essay_additions.sql
-- 英検3級 英作文問題を追加（051 マイグレーション実行後に実行）
-- 形式: QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。語数の目安は25語〜35語です。

-- 問題9: 好きな季節
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', '好きな季節',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
What is your favorite season?',
  25, 35,
  300, 480,
  'My favorite season is spring. First, I like to see cherry blossoms. Second, the weather is warm and comfortable.'
);

-- 問題10: 犬と猫
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', '犬と猫',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
Do you like dogs or cats better?',
  25, 35,
  300, 480,
  'I like dogs better than cats. First, dogs are friendly and like to play. Second, I can take them for a walk.'
);

-- 問題11: 好きな映画
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', '好きな映画',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
What kind of movies do you like?',
  25, 35,
  300, 480,
  'I like action movies. First, they are exciting and fun to watch. Second, I enjoy the special effects.'
);

-- 問題12: 学校で好きな場所
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', '学校で好きな場所',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
What is your favorite place at school?',
  25, 35,
  300, 480,
  'My favorite place at school is the library. First, it is quiet and I can study well. Second, there are many interesting books.'
);

-- 問題13: 冬にしたいこと
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', '冬にしたいこと',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
What do you like to do in winter?',
  25, 35,
  300, 480,
  'I like to ski in winter. First, I enjoy the snow and cold weather. Second, skiing with friends is very fun.'
);

-- 問題14: 旅行について
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', '旅行について',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
Do you like to travel?',
  25, 35,
  300, 480,
  'Yes, I like to travel. First, I can see new places and learn about them. Second, I enjoy trying different foods.'
);

-- 問題15: お弁当について
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', 'お弁当について',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
Do you like to bring lunch to school?',
  25, 35,
  300, 480,
  'Yes, I like to bring lunch to school. First, my mother makes delicious food for me. Second, I can eat with my friends.'
);

-- 問題16: テレビについて
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', 'テレビについて',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
Do you like to watch TV?',
  25, 35,
  300, 480,
  'Yes, I like to watch TV. First, I can watch sports and news programs. Second, it helps me relax after school.'
);

-- 問題17: 好きな動物
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', '好きな動物',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
What is your favorite animal?',
  25, 35,
  300, 480,
  'My favorite animal is the panda. First, it is cute and black and white. Second, I like to see them eat bamboo.'
);

-- 問題18: 朝と夜
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds,
  model_answer
) VALUES (
  '3級', 'essay', '朝と夜',
  'QUESTIONについて、あなたの考えとその理由を２つ英文で書きなさい。
語数の目安は25語〜35語です。

QUESTION:
Do you like mornings or evenings better?',
  25, 35,
  300, 480,
  'I like evenings better than mornings. First, I can relax after school. Second, I have time to do my hobbies.'
);
