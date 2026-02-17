-- seed_reading_short_jun2kyu.sql
-- 英検準2級 短文の語句空所補充（大問1形式）＋解説
-- 030 マイグレーション実行後に実行
-- 準2級＝単語約10問・熟語約7問・文法約3問の割合。語彙・イディオム・文脈が中心。

-- (1) joy / 喜び
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'Kate''s son''s eyes were filled with __BLANK__ when he saw the new toy train that she had bought for his birthday present.',
  '["skill", "audio", "joy", "rent"]',
  2,
  '「目が〜でいっぱいになった」という文脈から、うれしさを表す名詞 "joy"（喜び）が正解。skill は技術、audio は音声、rent は家賃。'
);

-- (2) value / 価値
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'Gold is harder to find than silver. Because of this, gold has a higher __BLANK__.',
  '["shadow", "talent", "pattern", "value"]',
  3,
  '希少だから「価値が高い」という意味で "value" が正解。value は「価値、値段」。shadow は影、talent は才能。'
);

-- (3) impression / 印象
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: Have you met Josh yet? B: Yes, we only talked for a few minutes, but I had a very good __BLANK__ of him. He seems really friendly.',
  '["impression", "survey", "requirement", "purse"]',
  0,
  '「彼についてとても良い〜を持った」は「印象」なので "impression" が正解。have a good impression of 〜 で「〜に良い印象を持つ」。'
);

-- (4) journey / 旅
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'Last summer, Audrey took a trip across Europe for two months. She saw many interesting places on her __BLANK__.',
  '["statement", "product", "failure", "journey"]',
  3,
  '「旅の途中で」は "on one''s journey" です。journey は「旅、旅程」。statement は声明、product は製品。'
);

-- (5) disappeared / 消えた
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: Are you feeling better, Pete? B: Yes, my headache has totally __BLANK__. I went to bed early last night, and when I woke up, the pain had gone.',
  '["wondered", "disappeared", "supposed", "entered"]',
  1,
  '「頭痛がすっかり〜した」は「消えた」なので "disappeared" が正解。disappear は「消える、なくなる」。'
);

-- (6) altogether / 合計で
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'Daniela worked on her report for a few hours each day for over a week. She spent about twenty hours on it __BLANK__.',
  '["forward", "loudly", "worldwide", "altogether"]',
  3,
  '「合計で約20時間かけた」は "twenty hours altogether" です。altogether は「合計で、全部で」という副詞。'
);

-- (7) cheap / 安い
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: I want to buy a new computer, but they''re all so expensive. B: You can get a __BLANK__ one at that store. It''s having a sale this week.',
  '["cold", "shy", "cheap", "guilty"]',
  2,
  'セールで「安い」パソコンが買えるという文脈なので "cheap" が正解。cheap は「安い」。shy は内気な、guilty は罪悪感のある。'
);

-- (8) erase / 消す
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: Justin, please do not __BLANK__ the words on the board. I want to use them for my next class. B: OK, Mrs. Brown.',
  '["rest", "attend", "erase", "hire"]',
  2,
  '「板の字を消さないで」は "do not erase" です。erase は「（字を）消す」。attend は出席する、hire は雇う。'
);

-- (9) In addition to / 〜に加えて（熟語）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  '__BLANK__ her full-time job, Sheila teaches guitar lessons on the weekends. She is always so busy.',
  '["On account of", "For fear of", "In addition to", "By means of"]',
  2,
  '「本業に加えて」週末も教えているという意味なので "In addition to"（〜に加えて）が正解。On account of は〜の理由で、By means of は〜によって。'
);

-- (10) take it easy / 気楽にね（熟語）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: I have a history test tomorrow, and I''m really worried. B: Just __BLANK__. You''ve studied hard, so you should be ready for it.',
  '["see it off", "learn by heart", "come of age", "take it easy"]',
  3,
  '心配している相手を励ます「気楽にね、落ち着いて」は "take it easy" です。see it off は見送る、learn by heart は暗記する。'
);

-- (11) and so on / など（熟語）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'The students had a meeting to prepare for their class party. They discussed what foods to bring, which games to play, __BLANK__.',
  '["by all means", "in no time", "out of date", "and so on"]',
  3,
  'リストの続きを表す「など」は "and so on" です。by all means はぜひ、in no time はすぐに、out of date は時代遅れ。'
);

-- (12) on my own / 一人で（熟語）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: Did your mom help you make this cake, Jenny? B: No. No one helped me. I made it __BLANK__.',
  '["on my own", "for good", "from day to day", "in a word"]',
  0,
  '「誰にも手伝ってもらわず一人で作った」は "I made it on my own" です。on my own は「一人で、独力で」。'
);

-- (13) in good shape / 健康で（熟語）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: I saw you running in the park yesterday. Do you like to run? B: Yes. It''s a good way to keep __BLANK__.',
  '["on your side", "in good shape", "at the front", "with any luck"]',
  1,
  '「健康を保つ」は "keep in good shape" です。in good shape は「良い体調で、健康で」。'
);

-- (14) editor / 編集者
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'After working as a reporter for a newspaper for several years, Angela became its __BLANK__. It is her job to decide which news stories will appear in the newspaper.',
  '["architect", "engineer", "editor", "astronaut"]',
  2,
  'どの記事を載せるか決める仕事は「編集者」なので "editor" が正解。editor は「編集者」。architect は建築家、astronaut は宇宙飛行士。'
);

-- (15) suggestions / 提案
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: I''m looking for ideas for this year''s company trip. Does anyone have any __BLANK__? B: We could go hiking around Tindall Lake. It''s really pretty there at this time of year.',
  '["figures", "characters", "puzzles", "suggestions"]',
  3,
  '「アイデア、提案」を求める文脈なので "suggestions" が正解。suggestion は「提案、示唆」。figures は数字・人物、puzzles はパズル。'
);

-- (16) ingredients / 材料
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'A: Mom, can we make some cookies today? B: No. We don''t have all the __BLANK__. There aren''t any eggs or sugar.',
  '["explosions", "ingredients", "participants", "forecasts"]',
  1,
  '卵や砂糖は料理の「材料」なので "ingredients" が正解。ingredient は「材料、成分」。participant は参加者、forecast は予報。'
);

-- (17) bravely / 勇敢に
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'The ship''s captain __BLANK__ dived into the sea and swam to the little girl who had fallen into the water.',
  '["unfortunately", "awfully", "bravely", "hardly"]',
  2,
  '海に飛び込んで助けに行く様子を修飾する「勇敢に」は "bravely" が正解。bravely は brave の副詞形。unfortunately は残念ながら、hardly はほとんど〜ない。'
);

-- (18) serious / 深刻な
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'Judy has a __BLANK__ problem. She is getting married next week, but her dog tried to eat her wedding dress and destroyed it.',
  '["curly", "serious", "steady", "careful"]',
  1,
  '結婚式前にドレスが壊れたのは「深刻な」問題なので "serious" が正解。serious は「深刻な、真剣な」。curly は巻き毛の、steady は安定した。'
);

-- (19) blanked / 真っ白になった（mind blanked）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'Lisa tried to remember the man''s name, but her mind completely __BLANK__. As a result, she struggled to continue the conversation naturally.',
  '["collected", "hurt", "blanked", "waved"]',
  2,
  '「名前が思い出せない」ことを "one''s mind blanked"（頭が真っ白になった）と表します。blank は「空白にする」という動詞。'
);

-- (20) laugh at / 〜を笑う（熟語）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '準2級', 'short_fill',
  'Jane wants to be a comedian in the future. She is really funny, and her classmates always __BLANK__ her jokes.',
  '["take over", "come to", "point out", "laugh at"]',
  3,
  '「彼女の冗談を笑う」は "laugh at 〜" です。laugh at で「〜を笑う、〜のことで笑う」。take over は引き継ぐ、point out は指摘する。'
);
