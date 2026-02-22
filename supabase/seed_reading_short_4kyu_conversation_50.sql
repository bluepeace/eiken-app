-- seed_reading_short_4kyu_conversation_50.sql
-- 英検4級 会話文の空所補充 50問
-- 出題傾向: 中学中級・会話の流れと文脈、定型表現
-- 実行: マイグレーション 028, 030 適用後、本ファイルを実行

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Woman 1: "I went to a party this weekend." Woman 2: "__BLANK__" Woman 1: "My new dress."', '["What time does it open?", "What did you wear?", "How many people were there?", "Can you teach me?"]', 1, '「My new dress.」は服装についての答えです。「何を着ましたか」という質問が自然。What did you wear? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "Did you bring your soccer ball?" Girl: "__BLANK__ but I''ll bring it tomorrow."', '["Not today,", "I like P.E.,", "Wait a minute,", "You played well,"]', 0, '「明日持ってくる」と続くので、今日は持ってきていないという意味。Not today, が自然。「今日は持ってきてないけど、明日持ってくるよ」の流れ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl 1: "We should go to the science room now." Girl 2: "__BLANK__ I have to get my notebook from my locker first."', '["Bring it tomorrow.", "Wait for me.", "In my desk.", "For my teacher."]', 1, '「まずロッカーにノートを取りに行く」と言っているので、待っていてほしいという意味。Wait for me. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Man: "Excuse me. Is there a subway station near here?" Woman: "__BLANK__ It''s about five minutes from here."', '["I don''t have a watch.", "I bought a new bicycle.", "I lost my ticket.", "There''s one by the stadium."]', 3, '「地下鉄の駅は近くにありますか」には場所を教える返答。「ここから5分くらい」と距離を続けているので、There''s one by the stadium. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Brother: "Can you get my book, Mary? It''s on the table." Sister: "Sure." "__BLANK__"', '["Just a minute.", "I''ll buy it.", "That''s all.", "It''s not mine."]', 0, '依頼を承諾した後、取りに行くまでの短い待ち時間を伝える表現。Just a minute. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Daughter: "Can I go outside to play now?" Father: "No, __BLANK__"', '["wash the dishes first.", "have fun.", "I don''t like it very much.", "it''s not yours."]', 0, '「外で遊んでいい？」に「いいえ」と断り、その条件を述べる。「まず皿を洗いなさい」が自然。wash the dishes first. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Son: "I''m going to make some rice balls for the picnic. __BLANK__" Mother: "About five or six."', '["How many should I make?", "What did you make?", "Do you like them?", "Are you good at cooking?"]', 0, '「5〜6個くらい」という答えになる質問。「いくつ作ればいい？」が自然。How many should I make? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Mother: "Do you want some more pizza, Daniel?" Daniel: "Yes, __BLANK__"', '["I want to cook dinner.", "I can''t eat it.", "I don''t think so.", "I''m really hungry."]', 3, '「ピザもう少しいる？」に「はい」と答え、その理由を続ける。「お腹がすいている」が自然。I''m really hungry. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Man: "__BLANK__ Susan. How was your camping trip?" Susan: "It was wonderful."', '["Good luck,", "Welcome back,", "Have a good day,", "Not at all,"]', 1, '「キャンプはどうだった？」と聞いているので、帰ってきた人への挨拶。Welcome back, が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "I always do well in math class. __BLANK__" Girl: "Oh, can you study with me? Maybe you can help me."', '["I like history.", "It''s easy.", "It''s really short.", "She''s my teacher."]', 1, '「数学でいい成績を取っている」と言った後、女の子が勉強を手伝ってほしいと頼む流れ。「簡単だから」と理由を言うと自然。It''s easy. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Son: "When does the library open tomorrow? I need some books for school." Father: "__BLANK__"', '["At nine o''clock.", "By bus.", "Near here.", "In January."]', 0, '「図書館は明日何時に開きますか」には時刻で答える。At nine o''clock. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Woman: "Excuse me. Where''s the supermarket?" Man: "It''s near here. __BLANK__ You can come with me."', '["I don''t know.", "Please go away.", "I don''t have one.", "I''m going there now."]', 3, '「一緒に来ていいよ」と言うので、今スーパーに行くところだと説明している。I''m going there now. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "What''s your favorite day of the week?" Boy: "__BLANK__ I usually eat dinner with my aunt on that day."', '["I like Wednesdays.", "It was in April.", "I stayed for two weeks.", "She had a party."]', 0, '「その日に伯母さんと夕食を食べる」と続くので、曜日を答える。「水曜日が好き」が正解。I like Wednesdays. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Sister: "What''s wrong, David? Are you tired?" Brother: "__BLANK__ I had a very busy day."', '["Yeah, I''ll go with you.", "Yeah, I slept well last night.", "Yeah, we can do it together.", "Yeah, I need to go to bed now."]', 3, '「疲れている？」「とても忙しい一日だった」という流れ。「もう寝たい」が自然。Yeah, I need to go to bed now. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Brother: "I can''t finish my homework. It''s too difficult." Sister: "__BLANK__ I can help you." Brother: "Thanks."', '["Take care.", "Nice talking to you.", "It''s ready.", "Don''t worry."]', 3, '「難しい」と言われ、手伝いを申し出る前に安心させる言葉。「心配しないで」が自然。Don''t worry. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "I watched a great movie last night." Boy: "__BLANK__" Girl: "It was about a robot."', '["What time was it?", "What was it about?", "How much was it?", "Where did you go?"]', 1, '「ロボットの話だった」と答えているので、映画の内容についての質問。What was it about? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Mother: "Did you finish your project?" Boy: "__BLANK__ but I''ll work on it this evening."', '["Not yet,", "Very well,", "Of course,", "Right now,"]', 0, '「今晩やる」と言っているので、まだ終わっていないという意味。Not yet, が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "I''m going to the park. __BLANK__" Girl: "Sure, I''d love to."', '["Can you come with me?", "Where is it?", "How old are you?", "What time is it?"]', 0, '「喜んで」と答えているので、誘いの言葉。「一緒に来ない？」が自然。Can you come with me? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Woman: "I''m looking for a post office." Man: "There''s one on Main Street. __BLANK__"', '["I''m busy today.", "It''s closed on Sundays.", "It''s about a five-minute walk.", "I don''t like it."]', 2, '道を教えた後、距離や行き方を続けるのが自然。「歩いて5分くらい」が適切。It''s about a five-minute walk. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Father: "Tom, can you take out the garbage?" Son: "Sure. __BLANK__"', '["Just a moment.", "You''re welcome.", "I''m full.", "That''s right."]', 0, '依頼を承諾した後、すぐやることを示す表現。「ちょっと待ってて」で取りに行くことを示す。Just a moment. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "How was your summer vacation?" Boy: "__BLANK__ I went to the beach with my family."', '["It was fun.", "It''s sunny.", "I''m tired.", "Yes, I did."]', 0, '「家族で海に行った」と続くので、楽しかったと言うのが自然。It was fun. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Teacher: "Who can answer this question?" Student: "__BLANK__" Teacher: "Good, Yuki."', '["I can.", "I am.", "I do.", "I have."]', 0, '「誰か答えられますか」への返答。「私ができます」が自然。I can. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Mother: "Don''t forget your umbrella. __BLANK__" Boy: "OK, Mom. I''ll take it."', '["It''s in the bag.", "It might rain later.", "I like it.", "It''s new."]', 1, '傘を持っていくよう言う理由として、「後で雨が降るかもしれない」が自然。It might rain later. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "I''m hungry. Is dinner ready?" Mother: "__BLANK__ It''s almost done."', '["No, not yet.", "Yes, I am.", "I''m sorry.", "Thank you."]', 0, '「もうすぐできる」と言っているので、まだ準備できていない。No, not yet. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "Excuse me. How do I get to the station?" Man: "Go straight and turn left. __BLANK__"', '["You''re welcome.", "You''ll see it on your right.", "I don''t know.", "It''s expensive."]', 1, '道案内の続き。「右側に見えるよ」と到着の目印を言うのが自然。You''ll see it on your right. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Sister: "I got a new bike for my birthday." Brother: "__BLANK__" Sister: "It''s blue and white."', '["How old are you?", "What color is it?", "Where did you go?", "When is your birthday?"]', 1, '「青と白」と答えているので、色を聞いている質問。What color is it? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "Can I borrow your eraser?" Girl: "Sure. __BLANK__"', '["Here you are.", "You''re welcome.", "I''m fine.", "That''s OK."]', 0, 'ものを貸すとき、渡しながら「はい、どうぞ」と言う。Here you are. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Mother: "Why are you late, Ken?" Boy: "__BLANK__ I missed the bus."', '["I''m sorry.", "Thank you.", "Good idea.", "Nice to meet you."]', 0, '遅刻した理由を説明する前に謝るのが自然。I''m sorry. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "Let''s have a party next Saturday." Boy: "__BLANK__ I''ll bring some snacks."', '["That''s too bad.", "Sounds good.", "I''m not sure.", "No, thanks."]', 1, '「お菓子を持っていく」と言っているので、賛成している。Sounds good. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Father: "What do you want for dinner tonight?" Son: "__BLANK__" Father: "OK, I''ll make curry."', '["I''d like curry.", "I''m full.", "It''s delicious.", "Yes, please."]', 0, '「カレーを作る」と父親が言っているので、息子はカレーが食べたいと言った。I''d like curry. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Woman: "I''m going to visit my grandmother next week." Man: "__BLANK__" Woman: "Yes, by train."', '["Are you going by train?", "Do you like her?", "Where does she live?", "How old is she?"]', 0, '「はい、電車で」と答えているので、電車で行くかどうか聞いている。Are you going by train? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Teacher: "Did everyone understand?" Students: "__BLANK__" Teacher: "Good. Let''s continue."', '["Yes, we did.", "No, we don''t.", "Yes, we are.", "No, we can''t."]', 0, '「わかった？」に「はい、わかりました」と答える。過去の理解についてなので Yes, we did. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "I have a headache." Mother: "__BLANK__ You should rest."', '["That''s great.", "I''m sorry to hear that.", "You''re welcome.", "Good job."]', 1, '具合が悪いと聞いて心配や同情を示す表現。I''m sorry to hear that. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "How long did you stay in Kyoto?" Boy: "__BLANK__"', '["Last month.", "For three days.", "By bullet train.", "With my family."]', 1, '「どのくらい滞在しましたか」には期間で答える。For three days. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Brother: "I can''t find my keys." Sister: "__BLANK__" Brother: "Thanks. They were under the sofa."', '["Did you look in your bag?", "Have you checked under the sofa?", "Do you need help?", "Are they in the car?"]', 1, '「ソファの下にあった」と言っているので、ソファの下を探したか聞いたとわかる。Have you checked under the sofa? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Mother: "Why didn''t you call me?" Daughter: "__BLANK__ My phone battery was dead."', '["I''m sorry,", "Thank you,", "You''re right,", "No problem,"]', 0, '電話しなかった理由を言う前に謝るのが自然。I''m sorry, が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "The test was really hard." Girl: "__BLANK__ I studied a lot, but I''m not sure about my answers."', '["Me, too.", "That''s easy.", "I''m fine.", "Good luck."]', 0, '「私も」と同意する表現。女の子もテストが難しかったと感じている。Me, too. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Father: "We need to leave at 7 a.m. tomorrow." Son: "__BLANK__ I''ll set my alarm."', '["No, thanks.", "OK, I will.", "I don''t think so.", "That''s too bad."]', 1, '「アラームをセットする」と言っているので、了解している。OK, I will. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "What are you doing this weekend?" Boy: "__BLANK__"', '["I like baseball.", "Nothing much.", "I''m going to a baseball game.", "It''s on Sunday."]', 2, '「週末は何をするの？」には予定を答える。I''m going to a baseball game. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Woman: "Do you have a minute?" Man: "__BLANK__ What do you need?"', '["Yes, of course.", "No, I don''t.", "I''m late.", "See you later."]', 0, '「何か必要？」と聞いているので、時間があると答えている。Yes, of course. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Teacher: "Who wants to go first?" Student: "__BLANK__"', '["I do.", "I am.", "I can.", "I have."]', 0, '「誰が最初に行きたい？」への返答。「私が」が自然。I do. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Mother: "Don''t forget to call me when you arrive." Son: "__BLANK__"', '["I won''t.", "I don''t.", "I can''t.", "I aren''t."]', 0, '「忘れないで」と言われて「忘れないよ」と答える。I won''t. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "I''m nervous about the presentation." Boy: "__BLANK__ You''ll do fine."', '["Don''t worry.", "You''re late.", "I''m sorry.", "Goodbye."]', 0, '「うまくいくよ」と励ます前に、「心配しないで」と言う。Don''t worry. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "Where did you buy that bag?" Girl: "__BLANK__"', '["Last week.", "At the mall.", "It''s red.", "I love it."]', 1, '「どこで買いましたか」には場所で答える。At the mall. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Father: "What time does your soccer practice start?" Son: "__BLANK__"', '["At 4 o''clock.", "In the gym.", "With my friends.", "Every Monday."]', 0, '「何時に始まりますか」には時刻で答える。At 4 o''clock. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Sister: "I''m going to the concert tomorrow." Brother: "__BLANK__" Sister: "With Yuki and Anna."', '["Who are you going with?", "What time does it start?", "Where is it?", "How much was the ticket?"]', 0, '「ユキとアンナと」と答えているので、誰と行くか聞いている。Who are you going with? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Girl: "I failed the English test." Boy: "__BLANK__ You can try again next time."', '["Congratulations!", "That''s too bad.", "Good job.", "You''re welcome."]', 1, 'テストに落ちたと言われ、励ます前に残念に思う表現。That''s too bad. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Mother: "Have you seen my glasses?" Son: "__BLANK__ They''re on the table."', '["Yes, I have.", "No, I haven''t.", "I don''t know.", "Maybe tomorrow."]', 0, '「テーブルにあるよ」と言っているので、見つけた／見たことがあると答えている。Yes, I have. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Boy: "I think it''s going to rain." Girl: "__BLANK__ I''ll bring an umbrella."', '["You''re right.", "I don''t think so.", "That''s impossible.", "No way."]', 0, '「傘を持っていく」と言っているので、雨が降りそうだということに同意している。You''re right. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'Teacher: "Please hand in your homework." Student: "__BLANK__ I left it at home."', '["I''m sorry,", "Thank you,", "You''re welcome,", "Good idea,"]', 0, '宿題を忘れたことを謝る。I''m sorry, が正解。');
