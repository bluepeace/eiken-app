-- seed_reading_short_4kyu.sql
-- 英検4級 短文の語句空所補充（大問1形式）＋解説
-- 030 マイグレーション実行後に実行

-- (1) child / 子供
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: Max is a little __BLANK__, so he loves to play with toy cars.
B: Yes. He likes to play video games, too.',
  '["child", "dream", "doll", "color"]',
  0,
  '「おもちゃの車で遊ぶのが好き」という文脈から、年齢が小さい「子供」を表す "child" が正解です。'
);

-- (2) think / I think so
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: Will you go to the concert tomorrow?
B: I __BLANK__ so.',
  '["think", "carry", "study", "work"]',
  0,
  '「コンサートに行きますか？」への返答で「そう思います（行くと思います）」は "I think so." という表現です。'
);

-- (3) soap / 石鹸
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: Where''s the __BLANK__? I want to wash my hands.
B: It''s over there.',
  '["candy", "tea", "soap", "fish"]',
  2,
  '手を洗うときに使うものは「石鹸」なので "soap" が正解。candy は飴、tea はお茶、fish は魚です。'
);

-- (4) bridge / 橋
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: The water is so deep here.
B: It''s OK. Just walk across that __BLANK__.',
  '["class", "station", "bridge", "food"]',
  2,
  '深い水を渡るために使うのは「橋」なので "bridge" が正解。class は授業、station は駅、food は食べ物です。'
);

-- (5) doctor / 医者
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'Kelly wants to be a __BLANK__. She likes to help sick people.',
  '["hobby", "class", "present", "doctor"]',
  3,
  '病気の人を助ける仕事は「医者」なので "doctor" が正解。hobby は趣味、class は授業、present はプレゼントです。'
);

-- (6) clean / 掃除する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: Can I watch TV now, Dad?
B: Yes, but you must __BLANK__ the kitchen after dinner.',
  '["clean", "meet", "stay", "answer"]',
  0,
  '食事の後にする家事として「台所を掃除する」は "clean the kitchen" です。clean が正解。'
);

-- (7) try / 試す
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: I got a new game for my computer. Let''s __BLANK__ it.
B: OK.',
  '["cook", "buy", "try", "wash"]',
  2,
  '新しいゲームを「試す」は "try it" という表現です。cook は料理する、buy は買う、wash は洗うです。'
);

-- (8) moment / Just a moment
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: Hello, Mrs. Smith. This is Anna. Is Tracy there?
B: Just a __BLANK__. I''ll go and get her.',
  '["moment", "shower", "number", "program"]',
  0,
  '「少々お待ちください」は "Just a moment." という決まった表現です。moment は「瞬間、少しの間」の意味です。'
);

-- (9) understand / 理解する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'Last night, Paul studied with his sister. She couldn''t __BLANK__ her homework, so Paul helped her.',
  '["wash", "understand", "play", "open"]',
  1,
  '「宿題ができなかったので手伝った」という流れから、宿題を「理解する」の "understand" が正解です。'
);

-- (10) end / 終わる
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'Helen''s tennis lesson will __BLANK__ at five o''clock on Saturday.',
  '["take", "end", "put", "make"]',
  1,
  '「レッスンが5時に終わる」は "lesson will end" です。end は「終わる」という動詞です。'
);

-- (11) holiday / 休日
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'After the big game yesterday, the soccer team was very happy. Today is a __BLANK__, so the players can relax.',
  '["holiday", "bank", "friend", "pool"]',
  0,
  '試合の翌日に休んでリラックスする日は「休日」なので "holiday" が正解。bank は銀行、pool はプールです。'
);

-- (12) from / from 〜 to 〜
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'The library is open __BLANK__ nine to seven. Many people go there in the morning.',
  '["among", "from", "over", "with"]',
  1,
  '「〜から〜まで」と時間の範囲を表すときは "from 〜 to 〜" を使います。from が正解。'
);

-- (13) ticket / 切符
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: Is your train __BLANK__ to Osaka in your pocket?
B: No, it''s on the table.',
  '["car", "pencil", "shirt", "ticket"]',
  3,
  '電車で大阪まで行くときに必要なのは「切符」なので "ticket" が正解。train ticket で「電車の切符」です。'
);

-- (14) news / ニュース
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: Did you see the __BLANK__ on TV, Mom? A giraffe at the zoo had a baby.
B: Yes, I saw it. It was so cute.',
  '["news", "weather", "sport", "bag"]',
  0,
  'テレビで動物園の話題を見るのは「ニュース」なので "news" が正解。weather は天気、sport はスポーツです。'
);

-- (15) college / 大学
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: What does your brother do, Ms. Brown?
B: He''s a __BLANK__ student. He studies computer science.',
  '["towel", "mistake", "college", "station"]',
  2,
  'コンピュータ科学を学ぶのは「大学生」なので "college student" が正解。college は大学です。'
);

-- (16) finish / 終える
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: When will you __BLANK__ cleaning your room?
B: By six o''clock.',
  '["visit", "finish", "remember", "leave"]',
  1,
  '「いつ部屋の掃除を終えますか」は "When will you finish 〜?" です。finish は「終える」という動詞です。'
);

-- (17) caught / catch a cold
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'Brian __BLANK__ a cold. He is staying home today.',
  '["caught", "told", "forgot", "played"]',
  0,
  '「風邪をひく」は "catch a cold" という決まった表現です。過去形で "caught a cold" になります。'
);

-- (18) glass / a glass of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'Jeff drank a __BLANK__ of water. He was very thirsty.',
  '["glass", "boat", "country", "floor"]',
  0,
  '「コップ1杯の水」は "a glass of water" です。glass は「グラス、コップ」の意味です。'
);

-- (19) other / each other
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'conversation_fill',
  'A: In our cooking class, we help each __BLANK__ when we cook.
B: Yes, we do. That''s important.',
  '["any", "some", "other", "another"]',
  2,
  '「お互いに助け合う」は "help each other" という表現です。each other で「お互い」を表します。'
);

-- (20) with / friends with
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'Ken became good friends __BLANK__ him when they were in the same class.',
  '["with", "through", "by", "into"]',
  0,
  '「〜と仲良くなる」は "become friends with 〜" という表現です。with が正解。'
);
