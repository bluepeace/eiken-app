-- seed_reading_short_3kyu_extra.sql
-- 英検3級 短文の語句空所補充 追加80問（21〜100）
-- 実行順: 030 マイグレーション → seed_reading_short_3kyu.sql（20問）→ 本ファイル（80問）で計100問

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
