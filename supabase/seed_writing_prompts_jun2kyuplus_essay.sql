-- seed_writing_prompts_jun2kyuplus_essay.sql
-- 英検準2級プラス ライティング 英作文問題（010 マイグレーション実行後に実行）
-- 形式: QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。語数の目安は50～60語です。
-- 出題傾向: 日常生活・社会・環境・観光など身近なトピック。意見＋理由2つ。50～60語。

-- 問題1: 駅の利用（過去問ベース）
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '外国人の駅利用',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is difficult for foreign visitors to use train stations in Japan?',
  50, 60,
  600, 900
);

-- 問題2: 観光地の近くに住む（過去問ベース）
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '観光地近くの住居',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for people to live near famous sightseeing spots?',
  50, 60,
  600, 900
);

-- 問題3: レジ袋とマイバッグ（過去問ベース）
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', 'レジ袋とマイバッグ',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is better for people to use plastic bags from stores or to bring bags from home?',
  50, 60,
  600, 900
);

-- 問題4: 公共交通機関
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '公共交通の利用',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think people should use public transportation more often to protect the environment?',
  50, 60,
  600, 900
);

-- 問題5: 図書館
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '図書館の役割',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for students to spend time at the library?',
  50, 60,
  600, 900
);

-- 問題6: オンライン学習
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', 'オンライン学習',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is better for students to study online or to study in a classroom?',
  50, 60,
  600, 900
);

-- 問題7: リサイクル
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', 'リサイクル',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think people should recycle more to help the environment?',
  50, 60,
  600, 900
);

-- 問題8: 観光客と地元住民
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '観光地と地元住民',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for towns to have many tourists?',
  50, 60,
  600, 900
);

-- 問題9: 自転車通勤
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '自転車通勤',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is better for people to go to work by bicycle or by car?',
  50, 60,
  600, 900
);

-- 問題10: 学校での英語学習
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '英語学習の開始時期',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think children should start learning English at an early age?',
  50, 60,
  600, 900
);

-- 問題11: 休日の過ごし方
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '休日の過ごし方',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is better for people to spend their free time alone or with friends?',
  50, 60,
  600, 900
);

-- 問題12: 地元の食べ物
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '地元の食べ物',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for people to eat food from their local area?',
  50, 60,
  600, 900
);

-- 問題13: ペット
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', 'ペットを飼うこと',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for families to have a pet?',
  50, 60,
  600, 900
);

-- 問題14: スマートフォン
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '若者のスマートフォン',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is difficult for young people to live without smartphones?',
  50, 60,
  600, 900
);

-- 問題15: 読書
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '読書の習慣',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for people to read books regularly?',
  50, 60,
  600, 900
);

-- 問題16: 店での買い物
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', 'オンラインショッピングと店舗',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is better for people to shop online or to shop at stores?',
  50, 60,
  600, 900
);

-- 問題17: 運動
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '運動の習慣',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is important for students to exercise every day?',
  50, 60,
  600, 900
);

-- 問題18: 海外旅行
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '海外旅行',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is good for young people to travel abroad?',
  50, 60,
  600, 900
);

-- 問題19: 窓口と機械
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '窓口とセルフ端末',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is better for customers to use self-service machines or to talk to staff at counters?',
  50, 60,
  600, 900
);

-- 問題20: 公園
INSERT INTO public.writing_prompts (
  level, prompt_type, title, prompt,
  word_count_min, word_count_max,
  time_limit_min_seconds, time_limit_max_seconds
) VALUES (
  '準2級プラス', 'essay', '公園の役割',
  'QUESTIONについて、あなたの意見とその理由を2つ英文で書きなさい。
語数の目安は50～60語です。

QUESTION:
Do you think it is important for cities to have many parks?',
  50, 60,
  600, 900
);
