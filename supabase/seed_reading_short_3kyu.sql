-- seed_reading_short_3kyu.sql
-- 英検3級 短文の語句空所補充（大問1形式）＋解説
-- 030 マイグレーション実行後に実行

-- (1) lend / 貸す
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Can I borrow your book?
B: Sure. I''ll __BLANK__ it to you, but please give it back to me next week.',
  '["lend", "catch", "cost", "close"]',
  0,
  '「borrow（借りる）」に対する返答なので「lend（貸す）」が正解。borrow は「借りる」、lend は「貸す」で対になる動詞です。'
);

-- (2) deep / 深い
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: This pool is so __BLANK__ that I can''t see the bottom.
B: Don''t get into it. It can be dangerous.',
  '["high", "cold", "short", "deep"]',
  3,
  '「底が見えない」という文脈から、池の「深さ」を表す形容詞 "deep" が適切です。high は高さ、cold は温度、short は長さが短い場合に使います。'
);

-- (3) total / 合計の
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: What was my __BLANK__ score on the test, Ms. Green?
B: It was 80 points, John.',
  '["quick", "clean", "happy", "total"]',
  3,
  'テストの「合計点」を聞く表現なので "total score" が正解。total は「合計の、総計の」という意味の形容詞です。'
);

-- (4) aquarium / 水族館
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Let''s go to the new __BLANK__ and see the fish.
B: Good idea! I want to see the dolphins.',
  '["aquarium", "cafeteria", "stadium", "university"]',
  0,
  '魚やイルカを見られる場所は「水族館」なので "aquarium" が正解。cafeteria は食堂、stadium は競技場、university は大学です。'
);

-- (5) enough / 十分な
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'Mr. Yamamoto is a very busy man. He doesn''t have __BLANK__ time to read newspapers.',
  '["many", "high", "enough", "little"]',
  2,
  '「忙しくて新聞を読む時間が十分にない」という意味なので "enough（十分な）" が正解。time は不可算名詞なので many は使えません。little は「ほとんどない」で文の意味が変わります。'
);

-- (6) blanket / 毛布
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: It''s getting cold. Do you need a __BLANK__?
B: Yes, please.',
  '["cousin", "bottle", "blanket", "castle"]',
  2,
  '寒いときに必要なものとして「毛布」を表す "blanket" が正解。cousin はいとこ、bottle は瓶、castle は城です。'
);

-- (7) recorded / 録画した
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'Yumi __BLANK__ a video of her dance class. She sent it to her grandfather.',
  '["recorded", "opened", "painted", "celebrated"]',
  0,
  '「ビデオを送った」という流れから、その前に「録画した」という意味の "recorded" が正解。have + 過去分詞や動詞の過去形で「〜した」と完了を表します。'
);

-- (8) hurry / in a hurry（急いで）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'Ken left home __BLANK__ because he didn''t want to be late for school.',
  '["in a hurry", "in a promise", "in a calendar", "in a package"]',
  0,
  '「遅刻したくない」ので「急いで」家を出たという意味。"in a hurry" は決まった表現で「急いで」を表します。'
);

-- (9) for / for the first time（初めて）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'I went to Tokyo __BLANK__ the first time last year.',
  '["for", "from", "out", "over"]',
  0,
  '「初めて」は "for the first time" という決まった表現です。for が正解。from / out / over はこの形では使いません。'
);

-- (10) all / all the time（いつも）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'My sister listens to music __BLANK__ the time.',
  '["both", "all", "that", "our"]',
  1,
  '「いつも音楽を聴く」は "all the time" で「常に、いつも」という意味になります。both は「両方」、that は「あの」、our は「私たちの」です。'
);

-- (11) absent / absent from（欠席して）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'Tom was __BLANK__ from school yesterday because he had a cold.',
  '["silent", "narrow", "straight", "absent"]',
  3,
  '「風邪で学校を休んだ」なので "absent from school"（学校を欠席して）が正解。absent は「欠席した、いない」という意味の形容詞です。'
);

-- (12) forward / look forward to（〜を楽しみにしている）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'I''m looking __BLANK__ to going to the summer festival.',
  '["right", "forward", "up", "after"]',
  1,
  '「〜を楽しみにしている」は "look forward to 〜" という熟語です。to の後は名詞または動名詞（〜ing）が続きます。'
);

-- (13) to drink / 不定詞（anything to drink）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Would you like anything __BLANK__?
B: Yes, some water, please.',
  '["drank", "drinking", "to drink", "drinks"]',
  2,
  '「何か飲み物はいかがですか」は "Would you like anything to drink?" です。to + 動詞の原形（不定詞）が「〜するための」という意味で名詞を修飾します。'
);

-- (14) turn / turn down（音量を下げる）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Can you __BLANK__ down the radio, please?
B: OK.',
  '["turn", "get", "go", "make"]',
  0,
  '「ラジオの音量を下げる」は "turn down" という句動詞です。turn down で「（音量を）小さくする」という意味になります。'
);

-- (15) in / in front of（〜の前に）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Where do you want to meet, Kate?
B: Let''s meet __BLANK__ front of the flower shop.',
  '["on", "for", "in", "to"]',
  2,
  '「〜の前に（場所）」は "in front of 〜" という決まった表現です。in が正解。on the front of は「〜の前面に」で別の意味になります。'
);

-- (16) best / do your best（最善を尽くす）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Good luck, Jim. Do your __BLANK__ in the baseball game.
B: I will, Dad.',
  '["best", "widest", "longest", "deepest"]',
  0,
  '「頑張って」と励ます表現 "Do your best!" は「最善を尽くしなさい」という意味の決まった言い方です。best が正解。'
);

-- (17) taken / 受動態（was taken）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Was this picture __BLANK__ in Australia?
B: Yes. My father sent it to me when he was working there.',
  '["take", "took", "taking", "taken"]',
  3,
  '「この写真はオーストラリアで撮られましたか」は受動態なので "was + 過去分詞" の形になります。take の過去分詞は "taken" です。'
);

-- (18) cooler / 比較級（cooler than）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Was it hot in Vancouver during your trip?
B: No, it was __BLANK__ than my hometown.',
  '["cooling", "cooler", "coolest", "cool"]',
  1,
  '「故郷より涼しかった」と比較しているので、形容詞 cool の比較級 "cooler" が正解。than の前には比較級（〜er または more 〜）がきます。'
);

-- (19) athletes / 運動選手
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: Who takes part in the Olympic Games?
B: Many famous __BLANK__ from around the world.',
  '["passengers", "travelers", "animals", "athletes"]',
  3,
  'オリンピックに「参加する」のは「選手」なので "athletes" が正解。passengers は乗客、travelers は旅行者、animals は動物です。'
);

-- (20) follow / 従う・たどる
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '3級', 'short_fill',
  'A: When you get off the train, please __BLANK__ the signs to the exit.
B: OK.',
  '["spend", "reach", "meet", "follow"]',
  3,
  '「案内表示に従って出口へ行く」という意味で "follow the signs" が正解。follow は「〜に従う、〜をたどる」という動詞です。'
);
