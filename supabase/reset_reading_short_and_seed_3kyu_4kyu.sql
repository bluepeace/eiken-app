-- reset_reading_short_and_seed_3kyu_4kyu.sql
-- 短文・会話のリーディング問題を全削除し、3級100問・4級100問を投入する
-- 030 マイグレーション実行後に実行
-- 実行方法: Supabase SQL Editor でこのファイルの内容を貼り付けて実行

DELETE FROM reading_short_questions;

-- ========== 3級 短文の語句空所（1〜20問）==========
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

-- ========== 3級 短文の語句空所（21〜100問）==========

-- (21) famous for
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'This town is famous __BLANK__ its beautiful river.', '["for", "from", "with", "about"]', 0, '"〜で有名だ」は "be famous for 〜" という決まった表現です。for の後には有名な理由がきます。');

-- (22) the other day
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Well, I saw her the __BLANK__ day. She just started a new job.', '["other", "next", "same", "last"]', 0, '"先日、この間」は "the other day" という慣用表現です。過去の近い日を漠然と指します。');

-- (23) matter / What's the matter?
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: What''s the __BLANK__, Cindy? B: I studied really hard, but I didn''t do well on my history test.', '["matter", "thing", "wrong", "problem"]', 0, '"どうしたの？」は "What''s the matter?" が定番の表現です。matter は「問題、困ったこと」の意味です。');

-- (24) in time
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'You''re just in __BLANK__ for the movie. It''s about to start.', '["time", "place", "order", "line"]', 0, '"ちょうど間に合って」は "in time for 〜" で、時間に間に合う様子を表します。');

-- (25) would / Would you like
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Hannah, __BLANK__ you like coffee or tea?', '["would", "do", "are", "can"]', 0, '"〜はいかがですか」と丁寧に勧める表現は "Would you like 〜?" です。Would が正解。');

-- (26) climb / should + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'You should __BLANK__ Mt. Fuji if you have time.', '["climb", "climbed", "climbing", "to climb"]', 0, '助動詞 should の後には動詞の原形がきます。"should climb" で「登るべきだ」という意味になります。');

-- (27) to sleep / difficult for 人 to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Katie''s neighbor has a noisy dog, so it is difficult for her __BLANK__ at night.', '["to sleep", "sleep", "sleeping", "slept"]', 0, '"人にとって〜するのは難しい」は "It is difficult for 人 to do" の形。to の後は動詞の原形です。');

-- (28) In fact
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: Can you stay for dinner? B: No, I''m sorry. __BLANK__ fact, I have to leave for a meeting now.', '["In", "On", "At", "For"]', 0, '"実は、実際には」は "In fact" という決まった表現です。文頭でよく使います。');

-- (29) on / on his way to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Mr. Ford often buys a newspaper at the station in the morning __BLANK__ his way to work.', '["at", "by", "on", "to"]', 2, '"通勤途中で」は "on one''s way to 〜" という表現です。on が正解。');

-- (30) right now
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Mr. Jones has a meeting at 5:00. He has to leave __BLANK__ now.', '["right", "some", "very", "also"]', 0, '"今すぐ」は "right now" という副詞句です。right で「まさに、ちょうど」という強調を表します。');

-- (31) checked / have you 過去分詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: Mom, have you __BLANK__ the mail yet today? B: Yes. You got a letter from Aunt Jen.', '["check", "checking", "to check", "checked"]', 3, '"もう〜しましたか」は現在完了 "Have you 過去分詞 〜?" の形。check の過去分詞は "checked" です。');

-- (32) another
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: Mom, I ate my sandwich, but I''m still hungry. B: OK. Wait a minute. I''ll make you __BLANK__ one.', '["another", "near", "every", "much"]', 0, '「もう1つ」は "another" を使います。an + other で「別の1つ」という意味です。');

-- (33) beside
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: Do you know where the library is? B: It''s __BLANK__ the post office.', '["during", "of", "until", "beside"]', 3, '"郵便局の隣に」は "beside the post office" です。beside は「〜の横に、隣に」という前置詞です。');

-- (34) Research
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', '__BLANK__ by scientists shows that global warming is a big problem.', '["Research", "Energy", "Environment", "Danger"]', 0, '「科学者による研究が示している」ので "Research" が正解。research は不可算名詞としても使われ、ここでは「研究」という意味です。');

-- (35) interview
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'John has an __BLANK__ tomorrow. He hopes to get a new job.', '["interview", "airport", "example", "excuse"]', 0, '「新しい仕事を得たい」ので「面接」が文脈に合います。interview は「面接、インタビュー」の意味です。');

-- (36) accident
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The road was closed yesterday because there was an __BLANK__.', '["accident", "appointment", "apartment", "address"]', 0, '「道が閉鎖された」理由として「事故」が自然です。accident は「事故」、appointment は「予約」です。');

-- (37) empty
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: What should I do with this __BLANK__ bottle? B: We can recycle it.', '["glad", "empty", "different", "serious"]', 1, '「リサイクルする」のは「空の」瓶なので "empty" が正解。empty は「空の」という形容詞です。');

-- (38) much / a little など
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'This morning, Pat took a __BLANK__ medicine for his stomachache, but it didn''t get better.', '["little", "lot", "most", "much"]', 0, '不可算名詞の medicine の量は "a little"（少し）で表します。a lot of / much も量を表しますが "a little" が「少し飲んだ」という文脈に合います。正解は little（a little の little）。');

-- (39) perfect
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: Our trip plan looks __BLANK__. B: Yes. I''m really looking forward to it.', '["poor", "cold", "perfect", "slow"]', 2, '「楽しみにしている」と言っているので、プランは「完璧だ」と褒める "perfect" が自然です。');

-- (40) grows
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Mr. Suzuki __BLANK__ some flowers in his garden. They are very beautiful.', '["grows", "impresses", "performs", "fights"]', 0, '「庭で花を」という文脈では「育てる」の "grows" が正解。grow は「成長する、育てる」という動詞です。');

-- (41) baked
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: What is that delicious smell, Mom? B: I just __BLANK__ some cookies. Try one.', '["baked", "met", "believed", "held"]', 0, '「おいしそうなにおい」と「クッキー」から、「焼いた」の "baked" が正解。bake は「（オーブンで）焼く」です。');

-- (42) didn't / 付加疑問
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'A: You walked the dog, __BLANK__ you? B: Yes, I did.', '["weren''t", "couldn''t", "didn''t", "shouldn''t"]', 2, '前の文が "You walked" と過去形なので、付加疑問は "didn''t you?" になります。前が肯定なら後ろは否定形です。');

-- (43) take care of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'My sister will __BLANK__ care of our cat while we are on vacation.', '["take", "make", "get", "have"]', 0, '"〜の世話をする」は "take care of 〜" という句動詞です。take が正解。');

-- (44) found out
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I __BLANK__ out that the concert was canceled.', '["found", "looked", "took", "gave"]', 0, '"〜だと知る、分かる」は "find out that 〜" または "find out 〜" です。過去形なので "found out" が正解。');

-- (45) by the way
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', '__BLANK__ the way, did you see the news about the new park?', '["By", "On", "In", "At"]', 0, '"ところで」と話題を変えるときは "By the way" を使います。決まった表現です。');

-- (46) at the end of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'We will have a party __BLANK__ the end of this month.', '["at", "on", "in", "for"]', 0, '"〜の終わりに」は "at the end of 〜" です。at が正解。in the end は「結局」で別の意味です。');

-- (47) look after
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Can you __BLANK__ after my bag while I buy a ticket?', '["look", "see", "watch", "find"]', 0, '"〜の番をする、目を離さない」は "look after 〜" という句動詞です。look が正解。');

-- (48) give up
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Don''t __BLANK__ up. You can do it!', '["give", "take", "put", "make"]', 0, '"あきらめないで」は "Don''t give up." という励ましの表現です。give up で「諦める」という意味になります。');

-- (49) take off（離陸する・脱ぐ）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The plane will __BLANK__ off in ten minutes.', '["take", "get", "put", "run"]', 0, '飛行機が「離陸する」は "take off" です。take off は「離陸する」「（服を）脱ぐ」などの意味があります。');

-- (50) turn on
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'It''s dark in here. Please __BLANK__ on the light.', '["turn", "take", "put", "get"]', 0, '"（電気などを）つける」は "turn on 〜" です。turn off は「消す」で対になる表現です。');

-- (51) wait for
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I had to __BLANK__ for the bus for 20 minutes.', '["wait", "look", "ask", "pay"]', 0, '"〜を待つ」は "wait for 〜" です。wait の後には必ず for を置いて「何を待つか」を表します。');

-- (52) depend on
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Whether we go to the beach __BLANK__ on the weather.', '["depends", "decides", "discusses", "discovers"]', 0, '"〜次第である」は "depend on 〜" です。Whether で始まる節が主語なので動詞は三人称単数の "depends" になります。');

-- (53) hear from
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I was happy to __BLANK__ from my friend in Canada.', '["hear", "listen", "sound", "speak"]', 0, '"（人から）便りがある、連絡をもらう」は "hear from 人" です。hear が正解。listen は「聞く」行為に焦点があります。');

-- (54) take part in
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Many students will __BLANK__ part in the school festival.', '["take", "make", "get", "have"]', 0, '"〜に参加する」は "take part in 〜" という決まった表現です。take が正解。');

-- (55) get on（乗る）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'We __BLANK__ on the train at the next station.', '["get", "take", "put", "go"]', 0, 'バスや電車に「乗る」は "get on 〜" です。get off は「降りる」で対になります。');

-- (56) run out of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'We __BLANK__ out of milk. I need to buy some.', '["ran", "went", "came", "took"]', 0, '"〜を使い切る、なくなる」は "run out of 〜" です。過去の出来事なので "ran out of" が正解。');

-- (57) instead of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Let''s walk __BLANK__ of taking the bus.', '["instead", "because", "although", "without"]', 0, '"〜の代わりに」は "instead of 〜" です。instead of の後には名詞や動名詞がきます。');

-- (58) be interested in
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'She is interested __BLANK__ learning about different cultures.', '["in", "on", "at", "for"]', 0, '"〜に興味がある」は "be interested in 〜" です。in の後には名詞や動名詞が続きます。');

-- (59) be good at
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Ken is good __BLANK__ playing the guitar.', '["at", "in", "on", "for"]', 0, '"〜が得意だ」は "be good at 〜" です。at の後には名詞や動名詞がきます。');

-- (60) be proud of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'My parents are proud __BLANK__ my brother. He won the race.', '["of", "in", "at", "for"]', 0, '"〜を誇りに思う」は "be proud of 〜" です。of が正解。');

-- (61) apologize for
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I want to __BLANK__ for being late.', '["apologize", "thank", "excuse", "sorry"]', 0, '"〜について謝る」は "apologize for 〜" です。apologize は動詞で、for の後には名詞や動名詞がきます。');

-- (62) thank for
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I want to thank you __BLANK__ your help.', '["for", "to", "with", "about"]', 0, '"〜について感謝する」は "thank 人 for 〜" の形です。for の後に感謝する理由を置きます。');

-- (63) prevent from
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The rain prevented us __BLANK__ going to the park.', '["from", "to", "for", "at"]', 0, '"人が〜するのを妨げる」は "prevent 人 from 〜ing" です。from の後は動名詞がきます。');

-- (64) remind of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'This song reminds me __BLANK__ my childhood.', '["of", "about", "for", "with"]', 0, '"人に〜を思い出させる」は "remind 人 of 〜" です。of が正解。');

-- (65) belong to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'This book __BLANK__ to the school library.', '["belongs", "lends", "returns", "borrows"]', 0, '"〜に属する、〜のものである」は "belong to 〜" です。belong は常に to と一緒に使います。');

-- (66) agree with
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I agree __BLANK__ you. That''s a good idea.', '["with", "to", "on", "for"]', 0, '"人に同意する」は "agree with 人" です。with が正解。agree to は「提案などに同意する」場合に使います。');

-- (67) complain about
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Some people like to __BLANK__ about the weather.', '["complain", "explain", "describe", "discuss"]', 0, '"〜について文句を言う」は "complain about 〜" です。complain が正解。');

-- (68) deal with
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'We need to __BLANK__ with this problem soon.', '["deal", "do", "make", "take"]', 0, '"〜に対処する、扱う」は "deal with 〜" です。deal が正解。');

-- (69) pay for
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Who will __BLANK__ for dinner tonight?', '["pay", "spend", "cost", "take"]', 0, '"〜の代金を払う」は "pay for 〜" です。pay が正解。spend は "spend 時間/お金 on 〜" の形で使います。');

-- (70) prepare for
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'We are preparing __BLANK__ the exam next week.', '["for", "to", "with", "at"]', 0, '"〜の準備をする」は "prepare for 〜" です。for が正解。');

-- (71) prefer A to B
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I prefer tea __BLANK__ coffee.', '["to", "than", "from", "over"]', 0, '"BよりAの方が好き」は "prefer A to B" の形です。to が正解。than は比較級で使います。');

-- (72) succeed in
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'She succeeded __BLANK__ passing the driving test.', '["in", "on", "at", "for"]', 0, '"〜に成功する」は "succeed in 〜ing" です。in の後には動名詞がきます。');

-- (73) consist of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The class __BLANK__ of 30 students.', '["consists", "composes", "contains", "includes"]', 0, '"〜で構成されている」は "consist of 〜" です。consist は常に of と一緒に使い、主語が複数なら "consist" です。ここでは class が単数なので "consists" が正解。');

-- (74) be responsible for
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Who is responsible __BLANK__ cleaning this room?', '["for", "to", "with", "at"]', 0, '"〜に責任がある、〜を担当している」は "be responsible for 〜" です。for が正解。');

-- (75) be different from
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Life in the city is different __BLANK__ life in the country.', '["from", "to", "than", "with"]', 0, '"〜と違う」は "be different from 〜" です。from が正解。different than はアメリカ英語で使われることもありますが、3級では from を覚えましょう。');

-- (76) be full of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The stadium was full __BLANK__ excited fans.', '["of", "with", "in", "for"]', 0, '"〜でいっぱいの」は "be full of 〜" です。of が正解。');

-- (77) be famous for（再出）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Kyoto is famous __BLANK__ its old temples.', '["for", "with", "about", "from"]', 0, '"〜で有名だ」は "be famous for 〜" です。for の後に有名な理由を置きます。');

-- (78) be afraid of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Many children are afraid __BLANK__ the dark.', '["of", "about", "for", "with"]', 0, '"〜を怖がる」は "be afraid of 〜" です。of が正解。');

-- (79) be worried about
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'She is worried __BLANK__ her son''s health.', '["about", "for", "with", "at"]', 0, '"〜を心配している」は "be worried about 〜" です。about が正解。');

-- (80) be satisfied with
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The teacher was satisfied __BLANK__ the students'' work.', '["with", "about", "for", "at"]', 0, '"〜に満足している」は "be satisfied with 〜" です。with が正解。');

-- (81) used to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'My grandfather __BLANK__ to walk in the park every morning.', '["used", "use", "uses", "using"]', 0, '"昔は〜だった、よく〜した」は "used to 動詞の原形" です。過去の習慣を表します。used が正解。');

-- (82) be used to 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I am used __BLANK__ early in the morning.', '["to getting up", "to get up", "get up", "getting up"]', 0, '"〜に慣れている」は "be used to 〜" で、to の後は名詞または動名詞（〜ing）です。"to getting up" が正解。');

-- (83) look forward to 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'We are looking forward to __BLANK__ you again.', '["seeing", "see", "saw", "seen"]', 0, '"look forward to 〜" の to の後は動名詞（〜ing）がきます。「また会うのを楽しみにしている」なので "seeing" が正解。');

-- (84) enjoy 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I enjoy __BLANK__ books in my free time.', '["reading", "read", "to read", "reads"]', 0, '"enjoy 〜" の後には動名詞（〜ing）がきます。「読書を楽しむ」なので "reading" が正解。');

-- (85) finish 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Have you finished __BLANK__ your homework?', '["doing", "do", "to do", "did"]', 0, '"finish 〜" の後には動名詞（〜ing）がきます。「宿題を終える」なので "doing" が正解。');

-- (86) mind 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Would you mind __BLANK__ the window? It''s cold in here.', '["closing", "close", "to close", "closed"]', 0, '"Would you mind 〜ing?" は「〜してもいいですか」と丁寧に頼む表現です。mind の後は動名詞がきます。');

-- (87) avoid 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Try to avoid __BLANK__ too much sugar.', '["eating", "eat", "to eat", "eats"]', 0, '"avoid 〜" の後には動名詞（〜ing）がきます。「砂糖を多く取るのを避ける」なので "eating" が正解。');

-- (88) suggest 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The doctor suggested __BLANK__ more exercise.', '["doing", "do", "to do", "did"]', 0, '"suggest 〜" の後には動名詞（〜ing）がきます。「もっと運動することを勧めた」なので "doing" が正解。');

-- (89) keep 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Keep __BLANK__ until you see the station on your right.', '["walking", "walk", "to walk", "walked"]', 0, '"keep 〜ing" で「〜し続ける」という意味になります。「駅が見えるまで歩き続けて」なので "walking" が正解。');

-- (90) stop 〜ing / stop to do の区別
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'It started to rain, so we stopped __BLANK__ and went inside.', '["playing", "play", "to play", "played"]', 0, '"stop 〜ing" は「〜するのをやめる」、"stop to do" は「〜するために立ち止まる」です。ここでは「遊ぶのをやめて中に入った」なので "playing" が正解。');

-- (91) too 〜 to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The box was too heavy __BLANK__ carry.', '["to", "for", "of", "at"]', 0, '"あまり〜で・・・できない」は "too 形容詞 to 動詞の原形" の形です。to が正解。');

-- (92) enough to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'She is old enough __BLANK__ drive a car.', '["to", "for", "of", "that"]', 0, '"〜するのに十分〜だ」は "形容詞 enough to 動詞の原形" の形です。to が正解。');

-- (93) so 〜 that
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'The movie was __BLANK__ interesting that I watched it twice.', '["so", "such", "very", "too"]', 0, '"あまりにも〜なので・・・」は "so 形容詞 that 節" の形です。so が正解。such は "such a 形容詞 名詞" の形で使います。');

-- (94) such a 〜 that
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'It was __BLANK__ a nice day that we had a picnic.', '["such", "so", "very", "too"]', 0, '"such a 形容詞 名詞 that 節" で「とても〜な・・・なので」という意味。名詞（day）があるので "such" が正解。');

-- (95) although / 譲歩
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', '__BLANK__ it was raining, we went out to play.', '["Although", "Because", "If", "When"]', 0, '"〜だけれども」と逆接を表すのは "Although 節" です。Although が正解。後ろの文と対照的な内容が続くときに使います。');

-- (96) unless（〜しない限り）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I won''t go to the party __BLANK__ you come with me.', '["unless", "if", "because", "when"]', 0, '"〜しない限り」は "unless 節" です。「あなたが一緒に来ない限りパーティーには行かない」という意味で unless が正解。');

-- (97) since（〜なので）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', '__BLANK__ you are busy, I will go alone.', '["Since", "Although", "Until", "Unless"]', 0, '"〜なので」と理由を表す接続詞は "Since 節" です。Since が正解。Because も理由を表しますが、Since はややフォーマルです。');

-- (98) while（〜している間）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Please don''t talk __BLANK__ I am speaking.', '["while", "because", "if", "until"]', 0, '"〜している間」は "while 節" です。while が正解。when は「〜したとき」と時点を表すことが多いです。');

-- (99) until（〜まで）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'Wait here __BLANK__ I come back.', '["until", "when", "while", "if"]', 0, '"〜まで（ずっと）」は "until 節" です。until が正解。「私が戻ってくるまでここで待って」という意味になります。');

-- (100) as soon as（〜するとすぐに）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'short_fill', 'I will call you __BLANK__ as I get home.', '["soon", "fast", "quick", "early"]', 0, '"〜するとすぐに」は "as soon as 節" です。as soon as でひとまとまりなので "soon" が正解。');

-- ========== 4級 短文の語句空所（1〜20問）==========
-- (1) child / 子供
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'A: Max is a little __BLANK__, so he loves to play with toy cars.
B: Yes. He likes to play video games, too.',
  '["child", "dream", "doll", "color"]',
  0,
  '「おもちゃの車で遊ぶのが好き」という文脈から、年齢が小さい「子供」を表す "child" が正解です。'
);

-- (2) think / I think so
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'A: Will you go to the concert tomorrow?
B: I __BLANK__ so.',
  '["think", "carry", "study", "work"]',
  0,
  '「コンサートに行きますか？」への返答で「そう思います（行くと思います）」は "I think so." という表現です。'
);

-- (3) soap / 石鹸
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'A: Where''s the __BLANK__? I want to wash my hands.
B: It''s over there.',
  '["candy", "tea", "soap", "fish"]',
  2,
  '手を洗うときに使うものは「石鹸」なので "soap" が正解。candy は飴、tea はお茶、fish は魚です。'
);

-- (4) bridge / 橋
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
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
  '4級', 'short_fill',
  'A: Can I watch TV now, Dad?
B: Yes, but you must __BLANK__ the kitchen after dinner.',
  '["clean", "meet", "stay", "answer"]',
  0,
  '食事の後にする家事として「台所を掃除する」は "clean the kitchen" です。clean が正解。'
);

-- (7) try / 試す
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'A: I got a new game for my computer. Let''s __BLANK__ it.
B: OK.',
  '["cook", "buy", "try", "wash"]',
  2,
  '新しいゲームを「試す」は "try it" という表現です。cook は料理する、buy は買う、wash は洗うです。'
);

-- (8) moment / Just a moment
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
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
  '4級', 'short_fill',
  'A: Is your train __BLANK__ to Osaka in your pocket?
B: No, it''s on the table.',
  '["car", "pencil", "shirt", "ticket"]',
  3,
  '電車で大阪まで行くときに必要なのは「切符」なので "ticket" が正解。train ticket で「電車の切符」です。'
);

-- (14) news / ニュース
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'A: Did you see the __BLANK__ on TV, Mom? A giraffe at the zoo had a baby.
B: Yes, I saw it. It was so cute.',
  '["news", "weather", "sport", "bag"]',
  0,
  'テレビで動物園の話題を見るのは「ニュース」なので "news" が正解。weather は天気、sport はスポーツです。'
);

-- (15) college / 大学
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
  'A: What does your brother do, Ms. Brown?
B: He''s a __BLANK__ student. He studies computer science.',
  '["towel", "mistake", "college", "station"]',
  2,
  'コンピュータ科学を学ぶのは「大学生」なので "college student" が正解。college は大学です。'
);

-- (16) finish / 終える
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '4級', 'short_fill',
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
  '4級', 'short_fill',
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

-- ========== 4級 短文の語句空所（21〜100問）==========

-- (21) swim / can + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Kate can __BLANK__ very well. She goes to the pool every week.', '["swam", "swim", "swims", "to swim"]', 1, '助動詞 can の後には動詞の原形がきます。"can swim" で「泳げる」という意味になります。');

-- (22) must / must + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Can I eat this cake now? B: No. You __BLANK__ wash your hands first.', '["must", "are", "have", "were"]', 0, '「まず手を洗わなければならない」は "You must wash your hands." です。must の後は動詞の原形です。');

-- (23) watching / was 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Taro was __BLANK__ a movie when his friend called him.', '["watching", "watches", "watch", "watched"]', 0, '「電話がかかってきたとき映画を見ていた」は過去進行形 "was watching" を使います。');

-- (24) ask / ask for help
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: I can''t understand this math problem. B: Let''s __BLANK__ the teacher for help.', '["tell", "listen", "ask", "shut"]', 2, '「先生に助けを求める」は "ask 人 for help" という表現です。ask が正解。');

-- (25) had / have a hard time
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Bill''s math teacher gave him a lot of homework yesterday. Bill __BLANK__ a hard time because it was difficult.', '["played", "took", "had", "talked"]', 2, '「大変な思いをした」は "have a hard time" という表現です。過去形で "had a hard time" になります。');

-- (26) of / a cup of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: It''s so cold today. Can you make me a cup __BLANK__ hot chocolate, please? B: Sure. Just a minute.', '["at", "to", "as", "of"]', 3, '「コップ1杯の〜」は "a cup of 〜" です。of が正解。');

-- (27) kind / what kind of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: What __BLANK__ of dog do you want? B: I want a big dog because I love to go on long walks.', '["room", "wind", "kind", "side"]', 2, '「どんな種類の」は "What kind of 〜?" という表現です。kind が正解。');

-- (28) Why / 理由を聞く
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ are you going to go to the park today? B: I want to paint a picture.', '["When", "What", "Where", "Why"]', 3, '「絵を描きたい」は理由なので、理由を聞く "Why 〜?" が正解です。');

-- (29) to watch / like to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: What do you do on weekends? B: I don''t like __BLANK__ TV, so I usually read a book.', '["to watch", "watch", "watches", "watched"]', 0, '「〜するのが好きではない」は "don''t like to do" の形。like の後は "to + 動詞の原形" です。');

-- (30) oldest / the 最上級
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: What animal is the __BLANK__ in this zoo? B: This elephant is.', '["too old", "older", "oldest", "much older"]', 2, '「この動物園でいちばん年を取っている」は最上級 "the oldest" を使います。');

-- (31) trouble / have trouble with
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Mom, I''m having __BLANK__ with my homework. B: OK, I''ll help you with it.', '["trouble", "help", "homework", "time"]', 0, '「〜で困っている」は "have trouble with 〜" という表現です。trouble が正解。');

-- (32) do / do the housework
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Mr. Smith usually __BLANK__ the housework on Sunday mornings. After that, he likes to read magazines.', '["do", "have", "make", "take"]', 0, '「家事をする」は "do the housework" という表現です。do が正解。');

-- (33) time / have a good time
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Bye, Mom. Dan and I are going to a party. B: OK, have a good __BLANK__.', '["time", "party", "day", "trip"]', 0, '「楽しんでね」は "Have a good time." という決まったあいさつです。');

-- (34) old / years old
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Daniel is fourteen years __BLANK__. He is very good at sports.', '["old", "age", "long", "much"]', 0, '「14歳」は "fourteen years old" という表現です。年齢を言うときに使います。');

-- (35) came / 過去形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Henry __BLANK__ home from school early yesterday because he was sick.', '["came", "comes", "come", "coming"]', 0, '「昨日早く帰った」は過去の出来事なので、come の過去形 "came" が正解です。');

-- (36) largest / the 最上級
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Many of the buildings in this city are very big. B: Yes, but this one is the __BLANK__.', '["large", "largest", "larger", "too large"]', 1, '「この中でいちばん大きい」は最上級 "the largest" を使います。');

-- (37) There / There are
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: What''s your town like, Tom? B: It''s nice. __BLANK__ are lots of parks and a big pool.', '["They", "Those", "There", "Their"]', 2, '「たくさんの公園がある」と存在を表すときは "There are 〜" を使います。There が正解。');

-- (38) professional / プロの
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Kentaro wants to be a __BLANK__ baseball player in the future. He wants to play in the United States someday.', '["difficult", "professional", "strange", "thick"]', 1, '「アメリカでプレーしたい」という夢から、「プロの」選手を表す "professional" が正解です。');

-- (39) umbrella / 傘
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: It''ll rain this evening, Peter. Don''t forget your __BLANK__. B: Thanks, Lisa.', '["umbrella", "dream", "mirror", "sandwich"]', 0, '雨の日に持っていくのは「傘」なので "umbrella" が正解。dream は夢、mirror は鏡です。');

-- (40) useful / 役に立つ
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Do you know any good sports websites? B: Yes. This website is very __BLANK__.', '["quiet", "thirsty", "tall", "useful"]', 3, '良いサイトは「役に立つ」ので "useful" が正解。quiet は静かな、thirsty は喉が渇いた、tall は背が高いです。');

-- (41) heavy / 重い
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Takeru''s bag has many large books in it. It is very __BLANK__, so Takeru can''t carry it.', '["heavy", "nervous", "late", "fast"]', 0, 'たくさんの本で「持てない」のは「重い」からなので "heavy" が正解。nervous は緊張した、late は遅いです。');

-- (42) castle / 城
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Yumi visited a __BLANK__ last weekend. She likes learning about history.', '["dictionary", "question", "castle", "cloud"]', 2, '歴史を学ぶために訪れるのは「城」のような場所なので "castle" が正解。dictionary は辞書です。');

-- (43) garden / 庭
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Peter grows potatoes in his __BLANK__. He also has an apple tree.', '["cake", "song", "meat", "garden"]', 3, '野菜や果物の木があるのは「庭」なので "garden" が正解。cake はケーキ、song は歌です。');

-- (44) part / 部分
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Did you like the book, Andy? B: Well, the first __BLANK__ of the book was interesting, but the ending wasn''t very good.', '["country", "part", "way", "road"]', 1, '「本の最初の部分」は "the first part of the book" です。part は「部分」の意味。');

-- (45) airport / 空港
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Yuta loves flying. He often goes to the __BLANK__ to watch the planes.', '["floor", "hospital", "airport", "mall"]', 2, '飛行機を見に行く場所は「空港」なので "airport" が正解。floor は床、hospital は病院です。');

-- (46) forget / forget to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Don''t __BLANK__ to turn off the light when you leave. B: I won''t.', '["forget", "remember", "want", "need"]', 0, '「〜するのを忘れないで」は "Don''t forget to do" です。forget が正解。');

-- (47) same / the same as
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My sister''s bag is the __BLANK__ as mine. We bought them together.', '["same", "different", "other", "another"]', 0, '「私のと同じ」は "the same as 〜" という表現です。same が正解。');

-- (48) already / すでに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Can you help me with this? B: I''ve __BLANK__ finished it. Here you are.', '["already", "yet", "still", "again"]', 0, '「もう終わらせた」は "I''ve already finished" です。already は「すでに、もう」の意味。');

-- (49) never / 一度も〜ない
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Emma has __BLANK__ been to London. She wants to go there next year.', '["never", "ever", "always", "often"]', 0, '「まだ行ったことがない」は "has never been to" です。never は「一度も〜ない」の意味。');

-- (50) better / 比較級
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Today I feel __BLANK__ than yesterday. I had a good sleep last night.', '["good", "better", "best", "well"]', 1, '「昨日より良く感じる」は比較級 "feel better than" を使います。good の比較級は better。');

-- (51) much / how much
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ is this T-shirt? B: It''s twenty dollars.', '["How much", "How many", "How long", "How old"]', 0, '値段を聞くときは "How much is 〜?" を使います。much は不可算や金額に使います。');

-- (52) many / how many
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ books did you read last month? B: I read five books.', '["How much", "How many", "How long", "How often"]', 1, '数えられる名詞の数を聞くときは "How many 〜?" を使います。books は複数なので many。');

-- (53) since / since 過去
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I have known her __BLANK__ we were in elementary school.', '["when", "since", "for", "ago"]', 1, '「小学校のときから知っている」は "have known 〜 since" で、since の後は過去の起点を表します。');

-- (54) for / for 期間
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'They have lived in this town __BLANK__ ten years.', '["since", "for", "from", "during"]', 1, '「10年間」と期間を表すときは "for + 期間" を使います。for が正解。');

-- (55) if / 条件
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I will go to the park __BLANK__ it is sunny tomorrow.', '["if", "because", "but", "so"]', 0, '「晴れなら行く」は条件を表す "if" を使います。if は「もし〜なら」の意味。');

-- (56) because / 理由
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'She didn''t go to school __BLANK__ she had a fever.', '["but", "because", "so", "and"]', 1, '「熱があったので学校に行かなかった」は理由の "because" を使います。because は「〜なので」。');

-- (57) before / 前に
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Please wash your hands __BLANK__ you eat lunch.', '["after", "before", "when", "until"]', 1, '「食事の前に手を洗う」は "before you eat" です。before は「〜の前に」。');

-- (58) after / 後に
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'We played soccer __BLANK__ school yesterday.', '["before", "after", "during", "for"]', 1, '「昨日放課後にサッカーをした」は "after school" です。after は「〜の後に」。');

-- (59) enough / 十分
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'This box is not big __BLANK__ for all the books.', '["too", "very", "enough", "so"]', 2, '「すべての本を入れるには十分大きくない」は "not big enough for" です。enough は形容詞の後におきます。');

-- (60) too / too 〜 to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'The coffee was __BLANK__ hot to drink. I waited for a few minutes.', '["too", "very", "enough", "so"]', 0, '「飲むには熱すぎた」は "too 〜 to do" の形です。too が正解。');

-- (61) something / 何か
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: I''m hungry. B: There''s __BLANK__ in the fridge. Help yourself.', '["something", "anything", "nothing", "everything"]', 0, '「冷蔵庫に何かある」は肯定文なので "something" を使います。something は「何か」の意味。');

-- (62) anything / 何か（疑問・否定）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Do you need __BLANK__ from the store? B: No, I have everything.', '["something", "anything", "nothing", "everything"]', 1, '疑問文で「何か」と言うときは "anything" を使います。anything は疑問文・否定文で使います。');

-- (63) everyone / みんな
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', '__BLANK__ in our class passed the test. We were all happy.', '["Everyone", "Someone", "Anyone", "No one"]', 0, '「クラスのみんなが」は "Everyone in our class" です。everyone は「みんな、誰もが」の意味。');

-- (64) myself / 再帰代名詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I made this cake __BLANK__. My mom taught me how.', '["myself", "yourself", "himself", "herself"]', 0, '「自分で作った」は "made it myself" です。主語が I のときは myself を使います。');

-- (65) interested / be interested in
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Tom is __BLANK__ in science. He wants to be a scientist.', '["interest", "interested", "interesting", "interests"]', 1, '「〜に興味がある」は "be interested in 〜" です。人を主語にするときは interested を使います。');

-- (66) exciting / 形容詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'The game was very __BLANK__. We all enjoyed it.', '["excite", "excited", "exciting", "excitement"]', 2, '「試合がわくわくする」は物・事が主語なので "exciting" を使います。exciting は「わくわくさせる」という意味の形容詞。');

-- (67) carefully / 副詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Please read the instructions __BLANK__ before you start.', '["careful", "carefully", "care", "caring"]', 1, '動詞 read を修飾するのは副詞なので "carefully" が正解。careful は形容詞、carefully は副詞です。');

-- (68) quickly / 副詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'The bus is coming. We need to run __BLANK__ to the stop.', '["quick", "quicker", "quickly", "quickest"]', 2, '動詞 run を修飾するのは副詞なので "quickly" が正解。quickly は「速く」の意味。');

-- (69) better / had better
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: I have a headache. B: You __BLANK__ better go to bed early tonight.', '["have", "had", "has", "having"]', 1, '「〜したほうがいい」は "had better do" という表現です。had が正解。');

-- (70) could / 過去の能力
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'When I was five, I __BLANK__ not swim. I learned when I was seven.', '["can", "could", "will", "would"]', 1, '「5歳のときは泳げなかった」は過去の能力なので "could not swim" を使います。can の過去形は could。');

-- (71) would / Would you like
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ you like some orange juice? B: Yes, please.', '["Do", "Would", "Are", "Can"]', 1, '「オレンジジュースはいかがですか」は丁寧な "Would you like 〜?" を使います。Would が正解。');

-- (72) shall / Shall we
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ we go to the library together? B: Good idea.', '["Do", "Will", "Shall", "Can"]', 2, '「一緒に図書館に行きませんか」と提案するときは "Shall we 〜?" を使います。');

-- (73) going / be going to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My family is __BLANK__ to visit my grandparents next week.', '["go", "going", "goes", "went"]', 1, '「来週祖父母を訪ねる予定」は "be going to do" の形です。is の後は going。');

-- (74) reading / enjoy 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Sara enjoys __BLANK__ books. She has many books in her room.', '["read", "reads", "reading", "to read"]', 2, '「読むことを楽しむ」は "enjoy 〜ing" の形です。enjoy の後は動詞の -ing 形。');

-- (75) to go / want to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I want __BLANK__ to the movie theater this weekend. There is a good film.', '["go", "goes", "going", "to go"]', 3, '「〜したい」は "want to do" の形です。want の後は "to + 動詞の原形"。');

-- (76) made / 過去形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My father __BLANK__ a big cake for my birthday last Sunday.', '["make", "makes", "making", "made"]', 3, '「先週の日曜日に作った」は過去の出来事なので、make の過去形 "made" が正解です。');

-- (77) written / 過去分詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'This book was __BLANK__ by a famous writer. Many people have read it.', '["wrote", "writes", "writing", "written"]', 3, '「有名な作家によって書かれた」は受動態 "was written by" です。write の過去分詞は written。');

-- (78) found / 過去形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I __BLANK__ my key under the table. I was so glad.', '["find", "finds", "found", "finding"]', 2, '「鍵をテーブルの下で見つけた」は過去の出来事なので、find の過去形 "found" が正解。');

-- (79) taken / have 過去分詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'She has __BLANK__ many photos of the mountains. They are beautiful.', '["take", "takes", "took", "taken"]', 3, '「たくさんの写真を撮ってきた」は現在完了 "has taken" です。take の過去分詞は taken。');

-- (80) been / have been to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Have you ever __BLANK__ to Paris? I went there two years ago.', '["go", "went", "gone", "been"]', 3, '「〜に行ったことがある」は "have been to 〜" です。go の過去分詞は been（行ったことがあるの意味で使う）。');

-- (81) yet / まだ（否定・疑問）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: Have you done your homework? B: Not __BLANK__. I will do it after dinner.', '["already", "yet", "still", "just"]', 1, '否定文で「まだ」と言うときは "not yet" を使います。yet は疑問・否定で「まだ」の意味。');

-- (82) just / たった今
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I have __BLANK__ finished my lunch. I need to go back to class now.', '["already", "yet", "still", "just"]', 3, '「たった今昼食を終えた」は "have just finished" です。just は「たった今」の意味。');

-- (83) ever / 今までに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Have you __BLANK__ tried Japanese food? It is very delicious.', '["never", "ever", "already", "yet"]', 1, '「今までに〜したことがあるか」と聞くときは "Have you ever 過去分詞?" を使います。ever が正解。');

-- (84) once / 一度
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I have been to that museum __BLANK__. I went there with my school last year.', '["one", "once", "first", "only"]', 1, '「一度行ったことがある」は "have been 〜 once" です。once は「一度、一度だけ」の意味。');

-- (85) always / いつも
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My brother __BLANK__ gets up early. He likes to run in the morning.', '["always", "never", "sometimes", "once"]', 0, '「いつも早起きする」は "always gets up early" です。always は「いつも」の意味の副詞。');

-- (86) sometimes / ときどき
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I __BLANK__ play tennis with my friends on weekends.', '["always", "never", "sometimes", "usually"]', 2, '「週末にときどきテニスをする」は "sometimes play" です。sometimes は「ときどき」の意味。');

-- (87) both / 両方
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My parents __BLANK__ work at the same hospital. They are doctors.', '["all", "both", "each", "every"]', 1, '「両親とも」は2人なので "both" を使います。both は「両方とも」の意味。');

-- (88) all / みんな
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'We __BLANK__ enjoyed the party. Thank you for inviting us.', '["all", "both", "each", "every"]', 0, '「私たちはみんなパーティーを楽しんだ」は "We all enjoyed" です。all は「みんな」の意味。');

-- (89) another / もう一つ
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: This pen doesn''t work. B: Here is __BLANK__ one. You can use it.', '["other", "another", "the other", "others"]', 1, '「もう1本」は "another one" です。another は「別の1つ、もう1つ」の意味。');

-- (90) other / the other
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I have two cats. One is black and the __BLANK__ is white.', '["other", "another", "others", "another one"]', 0, '「2つのうちもう1方は」は "the other" です。2つあるとき、残り1つを指します。');

-- (91) during / 〜の間
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Please don''t talk __BLANK__ the lesson. Listen to the teacher.', '["for", "since", "during", "while"]', 2, '「授業の間は話さないで」は "during the lesson" です。during は「〜の間に」の意味。');

-- (92) until / 〜まで
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I will wait here __BLANK__ you come back. Don''t be late.', '["when", "until", "after", "before"]', 1, '「あなたが戻ってくるまで待つ」は "wait until 〜" です。until は「〜まで」の意味。');

-- (93) while / 〜している間
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My mother was cooking __BLANK__ I was doing my homework.', '["during", "while", "when", "as"]', 1, '「母が料理している間、私は宿題をしていた」は "while I was doing" です。while は「〜している間に」。');

-- (94) although / けれども
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', '__BLANK__ it was raining, we went to the park. We had umbrellas.', '["Because", "Although", "So", "If"]', 1, '「雨だったけれど公園に行った」は "Although it was raining" です。although は「〜だけれども」の意味。');

-- (95) whether / 〜かどうか
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I don''t know __BLANK__ she will come to the party or not.', '["if", "whether", "that", "what"]', 1, '「彼女がパーティーに来るかどうかわからない」は "whether 〜 or not" を使います。whether が正解。');

-- (96) that / 接続詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I think __BLANK__ this book is very interesting. You should read it.', '["what", "which", "that", "if"]', 2, '「この本はとても面白いと思う」は "I think that 〜" です。that は文をつなぐ接続詞。');

-- (97) which / どちら
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ bag is yours, the red one or the blue one? B: The blue one.', '["What", "Which", "Whose", "Who"]', 1, '「どちらのかばんがあなたの？」は "Which bag is yours?" です。限られた選択肢から選ぶときは which。');

-- (98) whose / 誰の
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ notebook is this? B: I think it''s Ken''s.', '["Who", "Whose", "Which", "Whom"]', 1, '「これは誰のノート？」は "Whose notebook is this?" です。whose は「誰の」という意味。');

-- (99) how / How long
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ long did you stay in Tokyo? B: I stayed for three days.', '["How", "What", "When", "Where"]', 0, '「どのくらいの間」は "How long 〜?" で聞きます。期間をたずねる表現です。');

-- (100) often / How often
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'A: __BLANK__ often do you play soccer? B: I play twice a week.', '["How", "What", "When", "Why"]', 0, '「どのくらいの頻度で」は "How often 〜?" で聞きます。often が正解。');
