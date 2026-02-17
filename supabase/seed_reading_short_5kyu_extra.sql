-- seed_reading_short_5kyu_extra.sql
-- 英検5級 短文の語句空所補充 追加80問（21〜100）
-- 実行順: 030 マイグレーション → seed_reading_short_5kyu.sql（20問）→ 本ファイル（80問）で計100問

-- (21) that's / That's right
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Fred, is your brother on the volleyball team? B: Yes, __BLANK__ right.', '["we''re", "that''s", "she''s", "I''m"]', 1, '「その通りです」は "That''s right." という言い方です。that''s = that is。');

-- (22) from / from America
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Steve, are you Canadian? B: No. I''m __BLANK__ America.', '["to", "from", "under", "by"]', 1, '「アメリカ出身です」は "I''m from America." です。from は「〜出身の、〜から」の意味。');

-- (23) takes / take pictures
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Julia likes her camera. She often __BLANK__ pictures.', '["tells", "does", "takes", "sings"]', 2, '「写真を撮る」は "take pictures" です。主語が She なので takes が正解。');

-- (24) about / What about you?
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: I like tennis. What __BLANK__ you, Rachel? B: I do, too.', '["over", "about", "down", "after"]', 1, '「あなたはどう？」と聞くときは "What about you?" と言います。about が正解。');

-- (25) in / in the morning
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Yuki''s father often goes jogging __BLANK__ the morning.', '["on", "in", "out", "down"]', 1, '「朝に」は "in the morning" です。in が正解。午前・午後・夕方も in を使います。');

-- (26) They / 複数代名詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Keiko and Megumi are good friends. __BLANK__ like tennis.', '["They", "He", "She", "You"]', 0, 'Keiko と Megumi の2人を指すので "They" が正解。They は「彼らは、彼女らは」。');

-- (27) our / 所有格
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Everyone, let''s clean __BLANK__ classroom. B: OK, Mr. White.', '["we", "our", "us", "ours"]', 1, '「私たちの教室」は "our classroom" です。our は「私たちの」という意味の所有格。');

-- (28) making / 現在進行形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: What is Scott doing now? B: He is __BLANK__ a doghouse.', '["make", "making", "makes", "made"]', 1, '「今していること」は現在進行形 "is 〜ing" で表します。make の -ing 形は making。');

-- (29) do / I do（返答）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: I have a cold, so I can''t play soccer with you today. B: I __BLANK__. That''s OK.', '["am", "do", "see", "love"]', 1, '「分かった、そうなんだ」と同意するとき "I do." や "I see." と言います。ここでは "I do." が自然。');

-- (30) Excuse / Excuse me
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: __BLANK__ me. Where''s the bathroom? B: It''s over there.', '["Begin", "Know", "Call", "Excuse"]', 3, '「すみません」と声をかけるときは "Excuse me." と言います。Excuse が正解。');

-- (31) Have / Have a good day
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Bye, Sam. __BLANK__ a good day. B: Thanks. You too.', '["Help", "Take", "Have", "Hear"]', 2, '「良い1日を」と別れのあいさつするときは "Have a good day." です。Have が正解。');

-- (32) to / Welcome to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Welcome __BLANK__ our sports club. B: Thank you.', '["on", "of", "for", "to"]', 3, '「〜へようこそ」は "Welcome to 〜" です。to の後に場所がきます。');

-- (33) at / at school
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I play basketball __BLANK__ school.', '["from", "at", "of", "with"]', 1, '「学校で」は "at school" です。at は場所を表す前置詞。');

-- (34) isn't / be動詞の否定
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Jack __BLANK__ a junior high school student. He is in elementary school.', '["aren''t", "doesn''t", "isn''t", "don''t"]', 2, '主語が Jack（3人称単数）で be 動詞の否定なので "isn''t"（is not）が正解。');

-- (35) Whose / 誰の
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: This dress is very nice. __BLANK__ is it? B: It''s my mother''s.', '["Who", "Where", "Whose", "When"]', 2, '「誰の？」と持ち主を聞くときは "Whose is it?" です。Whose は「誰の」という意味。');

-- (36) check / Let's + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Let''s __BLANK__ the homework together. B: Good idea.', '["check", "checked", "checks", "checking"]', 0, 'Let''s の後には動詞の原形がきます。「宿題を確認する」は "check the homework"。');

-- (37) musician / 音楽家
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Henry is a __BLANK__. He plays the guitar and the piano.', '["rabbit", "musician", "jacket", "team"]', 1, 'ギターとピアノを弾く人は「音楽家」なので "musician" が正解。rabbit はウサギ、team はチーム。');

-- (38) gym / 体育館
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Hi, Jane. Where is Ken? B: He''s in the __BLANK__.', '["watch", "gym", "banana", "night"]', 1, '運動する場所として「体育館」は "gym" です。watch は時計、banana はバナナ。');

-- (39) floor / 床
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Yuka, let''s sit down on the __BLANK__ and watch TV. B: OK.', '["drink", "floor", "jump", "breakfast"]', 1, '座ってテレビを見る場所は「床」なので "floor" が正解。floor は「床、フロア」。');

-- (40) tree / 木
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Mr. Hara has a big __BLANK__ in his garden. It has many oranges.', '["plate", "fork", "kitchen", "tree"]', 3, '庭にあってオレンジがなるものは「木」なので "tree" が正解。tree は「木」です。');

-- (41) dictionary / 辞書
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Mom, I don''t know this word. Can you help me? B: Use your __BLANK__, Tom.', '["page", "cup", "dictionary", "story"]', 2, '言葉の意味を調べる本は「辞書」なので "dictionary" が正解。');

-- (42) trumpet / トランペット
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Mr. Brown is a music teacher. He plays the __BLANK__ very well.', '["trumpet", "cup", "clock", "pencil"]', 0, '音楽の先生が弾く「楽器」は trumpet（トランペット）が自然。play the 〜 で楽器を演奏する。');

-- (43) great / 素晴らしい
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: This is my new computer. B: It''s __BLANK__. I want one, too.', '["great", "cloudy", "sure", "delicious"]', 0, '新品のパソコンを褒めるとき「素晴らしい」は "great" です。cloudy は曇りの、delicious はおいしい。');

-- (44) catch / 捕まえる
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Sally has a smart dog. He can stand and __BLANK__ a ball.', '["eat", "catch", "cook", "buy"]', 1, '犬がボールでする動作は「捕まえる」なので "catch" が正解。catch は「捕まえる、受け取る」。');

-- (45) make / 作る
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Mom, please __BLANK__ sandwiches for lunch. B: OK, John.', '["know", "make", "sit", "study"]', 1, '「サンドイッチを作って」は "Please make sandwiches." です。make は「作る」という動詞。');

-- (46) like / I'd like
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: What would you like to drink? B: I''d __BLANK__ some water, please.', '["like", "want", "have", "need"]', 0, '「〜がほしいです」と丁寧に言うとき "I''d like 〜" を使います。I''d = I would。');

-- (47) many / 多くの（可算）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'There are __BLANK__ books on the shelf. I like to read them.', '["many", "much", "some", "any"]', 0, '数えられる名詞（books）の「たくさんの」は "many" を使います。much は不可算名詞に使います。');

-- (48) much / たくさん（不可算）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I don''t have __BLANK__ time today. I have to go soon.', '["many", "much", "lot", "few"]', 1, 'time は数えられない名詞なので「たくさんの」は "much" を使います。');

-- (49) some / いくつか（肯定文）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'There is __BLANK__ milk in the fridge. You can drink it.', '["any", "some", "many", "much"]', 1, '肯定文で「いくつか、少し」と言うときは "some" を使います。any は疑問・否定で使います。');

-- (50) any / 疑問文
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Do you have __BLANK__ brothers or sisters?', '["some", "any", "many", "much"]', 1, '疑問文で「いくつか、何人か」と聞くときは "any" を使います。');

-- (51) reading / 現在進行形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Look! Ken is __BLANK__ a book under the tree.', '["read", "reads", "reading", "to read"]', 2, '「今していること」は現在進行形 "is 〜ing" です。read の -ing 形は reading。');

-- (52) running / 現在進行形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'The children are __BLANK__ in the park now.', '["run", "runs", "running", "ran"]', 2, '「今公園で走っている」は "are running" です。run の -ing 形は running（n を重ねる）。');

-- (53) eating / 現在進行形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'My sister is __BLANK__ breakfast in the kitchen.', '["eat", "eats", "eating", "ate"]', 2, '「朝食を食べている」は "is eating breakfast" です。eat の -ing 形は eating。');

-- (54) swim / can + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'My brother can __BLANK__ very fast. He goes to the pool every week.', '["swims", "swim", "swimming", "swam"]', 1, 'can の後は動詞の原形です。「泳げる」は "can swim"。');

-- (55) speak / can + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Mary can __BLANK__ English and Japanese. She is from Canada.', '["speaks", "speak", "speaking", "spoke"]', 1, 'can の後は動詞の原形です。「英語と日本語が話せる」は "can speak"。');

-- (56) play / 原形（三人称単数でない）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I __BLANK__ soccer with my friends on Saturdays.', '["plays", "play", "playing", "played"]', 1, '主語が I のとき、現在形の動詞は原形です。「サッカーをする」は "play soccer"。');

-- (57) plays / 三人称単数
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Tom __BLANK__ the piano every day. He is very good at it.', '["play", "plays", "playing", "played"]', 1, '主語が Tom（3人称単数）で現在形なので、動詞に s をつけて "plays" が正解。');

-- (58) has / have の三人称単数
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'She __BLANK__ a big family. She has three brothers.', '["have", "has", "having", "had"]', 1, '主語が She のとき「持っている」は "has" です。have の3人称単数形は has。');

-- (59) don't / 否定（I/You/複数）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I __BLANK__ like fish. But I like meat.', '["doesn''t", "don''t", "isn''t", "aren''t"]', 1, '主語が I で一般動詞 like の否定は "don''t like" です。don''t = do not。');

-- (60) doesn't / 否定（三人称単数）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'He __BLANK__ play video games. He likes to read books.', '["don''t", "doesn''t", "isn''t", "aren''t"]', 1, '主語が He で一般動詞の否定は "doesn''t" を使います。doesn''t = does not。');

-- (61) to / go to school
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'We go __BLANK__ school by bus every morning.', '["at", "on", "to", "for"]', 2, '「学校に行く」は "go to school" です。to は方向や目的地を表します。');

-- (62) with / 〜と一緒に
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I often play tennis __BLANK__ my father on Sundays.', '["from", "with", "for", "at"]', 1, '「父と一緒に」は "with my father" です。with は「〜と一緒に」の意味。');

-- (63) for / 〜のために
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'This present is __BLANK__ you. Happy birthday!', '["to", "from", "for", "with"]', 2, '「あなたへのプレゼント」は "a present for you" です。for は「〜のための」の意味。');

-- (64) under / 〜の下に
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'The cat is __BLANK__ the table. It is sleeping.', '["under", "on", "in", "at"]', 0, '「テーブルの下に」は "under the table" です。under は「〜の下に」という前置詞。');

-- (65) behind / 〜の後ろに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'The ball is __BLANK__ the door. Can you get it?', '["behind", "between", "under", "from"]', 0, '「ドアの後ろに」は "behind the door" です。behind は「〜の後ろに」。');

-- (66) Where / どこで
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: __BLANK__ is the library? B: It''s next to the station.', '["What", "Where", "Who", "When"]', 1, '場所を聞くときは "Where is 〜?" を使います。Where は「どこ」の意味。');

-- (67) When / いつ
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: __BLANK__ do you get up? B: I get up at seven.', '["What", "Where", "Who", "When"]', 3, '時を聞くときは "When do you 〜?" を使います。When は「いつ」の意味。');

-- (68) What / 何
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: __BLANK__ is your favorite subject? B: I like math.', '["What", "Where", "Who", "Whose"]', 0, 'ものやことを聞くときは "What is 〜?" を使います。What は「何」の意味。');

-- (69) Who / 誰
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: __BLANK__ is that boy? B: He is my cousin.', '["What", "Where", "Who", "When"]', 2, '人を聞くときは "Who is 〜?" を使います。Who は「誰」の意味。');

-- (70) How / どのように
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: __BLANK__ are you? B: I''m fine, thank you.', '["What", "Where", "Who", "How"]', 3, '「お元気ですか」は "How are you?" です。How は「どのように、どう」の意味。');

-- (71) me / 目的格
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'My mother often helps __BLANK__ with my homework.', '["I", "my", "me", "we"]', 2, '動詞 help の後には「私を」の目的格 "me" がきます。I は主語のとき、me は目的のとき。');

-- (72) him / 目的格（男性）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I know Ken. I play soccer with __BLANK__ after school.', '["he", "his", "him", "they"]', 2, '「彼と」と目的格で言うときは "him" を使います。he の目的格が him。');

-- (73) her / 目的格（女性）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I gave __BLANK__ a book. She was happy.', '["she", "her", "hers", "they"]', 1, '「彼女に」と目的格で言うときは "her" を使います。gave の後は「誰に」なので her。');

-- (74) your / あなたの
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Is this __BLANK__ bag? B: No, it''s not mine.', '["you", "your", "yours", "yourself"]', 1, '「あなたのかばん」は "your bag" です。your は「あなたの」という所有格。');

-- (75) his / 彼の
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'This is __BLANK__ bike. He rides it every day.', '["he", "him", "his", "her"]', 2, '「彼の自転車」は "his bike" です。his は「彼の」という意味の所有格。');

-- (76) Don't / 命令文の否定
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', '__BLANK__ run in the hallway. It is dangerous.', '["Don''t", "Doesn''t", "Isn''t", "Aren''t"]', 0, '「〜するな」は "Don''t + 動詞の原形" です。Don''t run で「走るな」。');

-- (77) Be / 命令文（be動詞）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', '__BLANK__ quiet in the library. People are reading.', '["Is", "Are", "Be", "Being"]', 2, '「静かにしなさい」は "Be quiet." です。命令文では be 動詞の原形 Be を使います。');

-- (78) Let's / 〜しましょう
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', '__BLANK__ go to the park. The weather is nice today.', '["Let", "Let''s", "Lets", "Let us"]', 1, '「〜しましょう」は "Let''s + 動詞の原形" です。Let''s = Let us。');

-- (79) of / a lot of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'There are a lot __BLANK__ apples on the table. Help yourself.', '["at", "on", "of", "for"]', 2, '「たくさんの」は "a lot of 〜" という表現です。of の後に名詞がきます。');

-- (80) course / Of course
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'A: Can you help me? B: __BLANK__ course. What do you need?', '["Of", "On", "At", "For"]', 0, '「もちろん」は "Of course." という決まった言い方です。');

-- (81) bed / go to bed
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I go to __BLANK__ at ten o''clock every night.', '["bed", "sleep", "dream", "rest"]', 0, '「寝る、床につく」は "go to bed" です。bed は「ベッド、寝床」。');

-- (82) time / 時間
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'What __BLANK__ is it now? I think it''s three o''clock.', '["time", "day", "year", "minute"]', 0, '「今何時ですか」は "What time is it?" です。time は「時間、時刻」。');

-- (83) watch / 見る
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I __BLANK__ TV after dinner. My favorite program is at eight.', '["see", "look", "watch", "read"]', 2, '「テレビを見る」は "watch TV" です。watch は（画面や試合を）見る、look は見る動作、see は見える。');

-- (84) listen / 聴く
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Please __BLANK__ to the teacher. She is talking about the test.', '["listen", "hear", "sound", "say"]', 0, '「先生の話を聴く」は "listen to 〜" です。listen は注意して聴く、hear は聞こえる。');

-- (85) put / 置く
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', '__BLANK__ your books on the desk. We will use them later.', '["Put", "Take", "Give", "Make"]', 0, '「本を机に置いて」は "Put 〜 on 〜" です。put は「置く」という動詞。');

-- (86) bring / 持ってくる
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Please __BLANK__ your textbook tomorrow. We need it for the class.', '["take", "bring", "get", "carry"]', 1, '「教科書を持ってきて」は "bring 〜" です。bring は「持ってくる」、take は「持っていく」。');

-- (87) want / 欲しい
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I __BLANK__ to be a teacher. I like children.', '["want", "wants", "wanting", "wanted"]', 0, '主語が I のとき「〜になりたい」は "want to be" です。want の後は to + 動詞の原形。');

-- (88) need / 必要
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'You __BLANK__ a pen for the test. Don''t forget it.', '["need", "needs", "needing", "needed"]', 0, '「ペンが必要だ」は "You need a pen" です。主語が You なので need の原形。');

-- (89) help / 助ける
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'Can you __BLANK__ me with this box? It is very heavy.', '["helps", "help", "helping", "helped"]', 1, 'Can you の後は動詞の原形です。「手伝って」は "help me with 〜"。');

-- (90) live / 住む
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'We __BLANK__ in Tokyo. Our house is near the station.', '["live", "lives", "living", "lived"]', 0, '主語が We のとき「住んでいる」は "live" です。live は「住む」という動詞。');

-- (91) room / 部屋
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'My __BLANK__ is small, but I have a big desk in it.', '["room", "door", "wall", "floor"]', 0, '机が置いてある場所は「部屋」なので "room" が正解。room は「部屋」です。');

-- (92) kitchen / 台所
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'My mother is in the __BLANK__. She is cooking dinner.', '["bathroom", "kitchen", "bedroom", "classroom"]', 1, '料理をする場所は「台所」なので "kitchen" が正解。');

-- (93) homework / 宿題
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I have a lot of __BLANK__ today. I need to finish it before dinner.', '["homework", "housework", "work", "classwork"]', 0, '「宿題がたくさんある」は "have a lot of homework" です。homework は不可算名詞。');

-- (94) breakfast / 朝食
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I have __BLANK__ at seven every morning. Then I go to school.', '["breakfast", "lunch", "dinner", "meal"]', 0, '朝7時に食べるのは「朝食」なので "breakfast" が正解。have breakfast で「朝食をとる」。');

-- (95) winter / 冬
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'It is very cold in __BLANK__ here. We often see snow.', '["spring", "summer", "autumn", "winter"]', 3, '寒くて雪が降る季節は「冬」なので "winter" が正解。');

-- (96) today / 今日
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'What day is it __BLANK__? Is it Friday?', '["today", "tomorrow", "yesterday", "tonight"]', 0, '「今日は何曜日？」は "What day is it today?" です。today は「今日」。');

-- (97) tomorrow / 明日
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'We have a test __BLANK__. I have to study tonight.', '["today", "tomorrow", "yesterday", "now"]', 1, '「明日テストがある」は "have a test tomorrow" です。tomorrow は「明日」。');

-- (98) happy / 幸せな
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I am very __BLANK__ today. I got a good score on the test.', '["sad", "angry", "happy", "tired"]', 2, '良い点数を取ったので「幸せ」は "happy" が正解。happy は「幸せな、うれしい」。');

-- (99) hungry / お腹が空いた
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I am __BLANK__. Let''s have lunch now.', '["full", "hungry", "thirsty", "sleepy"]', 1, '「お腹が空いた」は "I am hungry" です。hungry は「空腹な」。');

-- (100) tired / 疲れた
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'short_fill', 'I am __BLANK__ after the long game. I want to rest.', '["tired", "excited", "bored", "interested"]', 0, '長い試合の後で「疲れた」は "I am tired" です。tired は「疲れた」という形容詞。');
