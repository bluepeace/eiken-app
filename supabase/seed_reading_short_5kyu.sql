-- seed_reading_short_5kyu.sql
-- 英検5級 短文の語句空所補充（大問1形式）＋解説
-- 030 マイグレーション実行後に実行
-- 5級＝中学1年程度：現在形・命令文・現在進行形・can、基本語彙

-- (1) draws / 描く
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'Mr. Yamada is an art teacher. He __BLANK__ pictures of flowers in his free time.',
  '["plays", "draws", "speaks", "reads"]',
  1,
  '美術の先生が「絵を描く」は "draw pictures" です。draw は「描く」という動詞。plays は遊ぶ、speaks は話す、reads は読む。'
);

-- (2) raining / 雨が降っている
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'It''s __BLANK__, so we can''t have a picnic now. Let''s eat lunch at home.',
  '["cooking", "raining", "washing", "sleeping"]',
  1,
  'ピクニックができない天気は「雨が降っている」なので "It''s raining" です。rain の -ing 形が正解。'
);

-- (3) Sunday / 日曜日
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I''m very busy from Monday to Friday. I always go shopping on __BLANK__.',
  '["Sunday", "month", "calendar", "minute"]',
  0,
  '月曜から金曜が忙しいので、休みの「日曜日に」買い物に行くは "on Sunday" です。日付には on を使います。'
);

-- (4) cool / 涼しい
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: Is it hot today?
B: No. It is cloudy and __BLANK__ today.',
  '["cool", "young", "easy", "happy"]',
  0,
  '天気の様子を表す形容詞で「涼しい」は "cool" です。young は若い、easy は簡単な、happy は幸せな。'
);

-- (5) pets / ペット
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: Do you have any __BLANK__, John?
B: Yes, I have a cat. She is very cute.',
  '["cups", "hats", "cars", "pets"]',
  3,
  '猫を飼っているので「ペットはいますか」は "Do you have any pets?" です。pet は「ペット、愛玩動物」。'
);

-- (6) paint / 塗る
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: Dad, please __BLANK__ this wall.
B: OK. But first, let''s wash it.',
  '["swim", "sleep", "paint", "play"]',
  2,
  '壁にすることとして「塗る」は "paint" です。paint the wall で「壁を塗る」。swim は泳ぐ、sleep は寝る。'
);

-- (7) sugar / 砂糖
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: Excuse me. I want some __BLANK__ in my coffee.
B: Sure.',
  '["paper", "sun", "light", "sugar"]',
  3,
  'コーヒーに入れるものは「砂糖」なので "sugar" が正解。paper は紙、sun は太陽、light は光。'
);

-- (8) on / on TV
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I love basketball. I often watch basketball games __BLANK__ TV with my brother.',
  '["of", "on", "at", "in"]',
  1,
  '「テレビで見る」は "watch 〜 on TV" という言い方です。on が正解。'
);

-- (9) cup / a cup of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'Tom has a __BLANK__ of coffee every morning before he goes to school.',
  '["corn", "floor", "window", "cup"]',
  3,
  '「コーヒー1杯」は "a cup of coffee" です。cup は「カップ、コップ」の意味。'
);

-- (10) little / Yes, a little
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: Do you play basketball, Bob?
B: Yes, a __BLANK__.',
  '["little", "beautiful", "fast", "much"]',
  0,
  '「少しだけ（やる）」と答えるときは "Yes, a little." と言います。a little で「少し」の意味。'
);

-- (11) up / get up
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I get __BLANK__ early every morning and go to the park.',
  '["on", "up", "over", "right"]',
  1,
  '「早起きする」は "get up early" です。get up で「起きる」という決まった表現。'
);

-- (12) goes / go swimming
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'Janet __BLANK__ swimming every Sunday with her sister.',
  '["goes", "asks", "buys", "drinks"]',
  0,
  '「泳ぎに行く」は "go swimming" です。主語が Janet（3人称単数）なので "goes" が正解。'
);

-- (13) write / can + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: Mom, can I __BLANK__ a letter to Uncle Rob this afternoon?
B: Of course, Kenji.',
  '["writes", "wrote", "write", "writing"]',
  2,
  'can の後には動詞の原形がきます。「手紙を書く」は "write a letter" なので write が正解。'
);

-- (14) They / 代名詞（複数）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I know Tim and Lucy. __BLANK__ are Canadian.',
  '["He", "They", "It", "You"]',
  1,
  'Tim と Lucy の2人を指すので、複数の "They" が正解です。He は男性1人、She は女性1人。'
);

-- (15) open / 命令文（Please + 原形）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: It''s hot. Please __BLANK__ the window.
B: OK, Mom.',
  '["opens", "open", "opening", "opened"]',
  1,
  'Please の後は動詞の原形を使います。「窓を開けて」は "Please open the window." です。'
);

-- (16) washing / 現在進行形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: What''s Mike doing now?
B: He''s __BLANK__ his dog in the garden.',
  '["reading", "washing", "making", "sitting"]',
  1,
  '「今何をしているか」は現在進行形 "is 〜ing" で表します。庭で犬にすることは「洗っている」なので washing。'
);

-- (17) Wear / 命令文（動詞の原形）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: It''s very cold, Billy. __BLANK__ a coat today.
B: OK, Mom.',
  '["Listen", "Wear", "See", "Watch"]',
  1,
  '「コートを着なさい」は命令文で "Wear a coat." です。Wear は「着る」という動詞の原形。'
);

-- (18) brown / 色
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: What''s your favorite color, Amy?
B: It''s __BLANK__.',
  '["clean", "brown", "tall", "hard"]',
  1,
  '「好きな色」の答えは色の名前です。brown は「茶色」。clean はきれいな、tall は背が高い、hard は硬い。'
);

-- (19) album / アルバム
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I have a photo __BLANK__. I have many pictures of my family in it.',
  '["album", "pen", "sun", "dog"]',
  0,
  '家族の写真を入れておくものは「アルバム」なので "album" が正解。photo album で「写真帳」。'
);

-- (20) come / 来る
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'My brother and I __BLANK__ to school by bus every day.',
  '["talk", "eat", "see", "come"]',
  3,
  '「毎日バスで学校に来る」は "come to school by bus" です。come は「来る」。主語が複数なので come のまま。'
);
