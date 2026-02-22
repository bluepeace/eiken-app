-- seed_reading_short_3kyu_conversation_50.sql
-- 英検3級 会話文の空所補充 50問
-- 出題傾向: 中学卒業程度・Q&A型と説明補足型、会話の流れ
-- 実行: マイグレーション 028, 030 適用後、本ファイルを実行

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Customer: "Could you make me a salad without tomatoes?" Waiter: "__BLANK__ That''s not a problem."', '["Certainly.", "I''m full.", "No, thanks.", "You''re late."]', 0, '客の依頼に丁寧に承諾する表現。Certainly. が適切。「もちろんです。問題ありません」の流れ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Man 1: "Do you want to go jogging with me on the beach tomorrow?" Man 2: "__BLANK__ I usually just run in the park."', '["I''ve never done that before.", "I''m very tired.", "It''s too far.", "I don''t like it."]', 0, '「普段は公園で走っている」と続くので、ビーチでのジョギングは初めてという意味。I''ve never done that before. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Son: "Do you want to watch the soccer game today?" Father: "__BLANK__" Son: "The one between England and Japan."', '["Which game are you talking about?", "What time does it start?", "Who won the game?", "Where is the stadium?"]', 0, '「イングランド対日本の試合だよ」と息子が答えるので、どの試合か聞いている。Which game are you talking about? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl 1: "My mom''s taking me to the festival by car. You can come with us." Girl 2: "__BLANK__ Thanks."', '["That sounds great.", "I''m sorry.", "That''s too bad.", "No, I can''t."]', 0, '乗せてもらう申し出に喜んで承諾する表現。That sounds great. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Wife: "I need to go. I''ll call you when I arrive in Boston." Husband: "__BLANK__"', '["Have a safe trip.", "Welcome home.", "See you tomorrow.", "I''m sorry."]', 0, '出発する人への別れの挨拶。Have a safe trip. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Husband: "Where should we go for our summer trip?" Wife: "How about Greenville? __BLANK__" Husband: "Sounds good. We can go fishing and swimming."', '["I lost my passport.", "There''s a big lake there.", "I hate traveling.", "It''s too crowded."]', 1, '「釣りや泳ぎができる」と言うので、湖があることが理由。There''s a big lake there. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Boy: "I called you last night, but you didn''t answer." Girl: "Sorry, __BLANK__ I have to give it to my English teacher today."', '["I forgot about your question.", "I was writing a report.", "I don''t have a phone.", "I don''t know the answer."]', 1, '「今日先生に提出しないといけない」と言うので、レポートを書いていたという理由。I was writing a report. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Mother: "Fred, the TV is too loud. __BLANK__ please?" Son: "All right, Mom."', '["Will you pick it up,", "Will you buy it,", "Will you turn it down,", "Will you play it,"]', 2, '「うるさい」と言った後、音を下げるよう頼む。Will you turn it down, が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Sister: "Why are you eating my piece of cake?" Brother: "__BLANK__ It''s mine."', '["This isn''t yours.", "Thanks, it looks delicious.", "It wasn''t me.", "This morning, after breakfast."]', 0, '「私のだ」と言うので、姉の分ではないと主張している。This isn''t yours. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "When is your tennis match?" Boy: "Tomorrow. I haven''t practiced much this week, so __BLANK__"', '["it starts at two o''clock.", "I''m a little worried.", "it''s going to rain.", "I really like your racket."]', 1, '練習不足の後、試合への不安を述べる流れ。I''m a little worried. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Boy: "Have you been to the new zoo?" Girl: "Yes, but __BLANK__ There are many cute animals there."', '["I''ll call you back.", "I''d like to go again.", "it''s not your ticket.", "it''ll be my first time."]', 1, '「かわいい動物がたくさんいる」と好意的に言っているので、また行きたいという意味。I''d like to go again. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Man 1: "Should we take a bus to the art museum?" Man 2: "Yes. __BLANK__" Man 1: "I think so, too."', '["It''s a famous painting.", "We''re on the train.", "It''s too far to walk.", "I can''t find my ticket."]', 2, 'バスを使うことに賛成し、その理由を述べる。「歩くには遠すぎる」が自然。It''s too far to walk. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "I''m going to Hawaii with my family." Boy: "That''s nice. __BLANK__" Girl: "Yes. This is my second time. I went there last year, too."', '["Have you been there before?", "Can you call back later?", "Do you live near here?", "Could you help me with it?"]', 0, '「2回目で去年も行った」と答えるので、以前行ったことがあるか聞いている。Have you been there before? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Husband: "Our train is going to leave soon. Do you have everything you need?" Wife: "__BLANK__ Let''s go."', '["No, thank you.", "Sure, it''s mine.", "I''m ready.", "I want all of them."]', 2, '「行こう」と言うので、準備ができている。I''m ready. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Son: "Hi, Mom." Mother: "Hi, Martin. __BLANK__" Son: "We didn''t have band practice today, so I left school at 2:30."', '["It''s not for you.", "Have a wonderful day.", "You''re home early.", "You got a good score."]', 2, '「練習がなかったので2時半に帰った」と説明するので、早く帰ってきたことに気づいている。You''re home early. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "I''m thinking of joining the tennis club." Boy: "__BLANK__ You''re really good at tennis."', '["I don''t think so.", "That''s a good idea.", "I''m sorry.", "No way."]', 1, '「テニスが上手い」と言っているので、入部を勧めている。That''s a good idea. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Customer: "Can I have a table for two?" Waiter: "__BLANK__ Please follow me."', '["Of course.", "I''m full.", "No, thanks.", "You''re wrong."]', 0, '客の依頼に丁寧に承諾する。Of course. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Teacher: "Why were you absent yesterday?" Student: "I had a fever. __BLANK__"', '["I''m fine now.", "I''m very tired.", "I need to go.", "I don''t understand."]', 0, '熱があったと言った後、今は治ったと続けるのが自然。I''m fine now. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "Would you like some more juice?" Boy: "__BLANK__ I''ve had enough."', '["Yes, please.", "No, thank you.", "I''d love to.", "Sounds good."]', 1, '「もう十分いただいた」と言うので、断っている。No, thank you. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Father: "Did you enjoy the concert?" Daughter: "Yes! __BLANK__ The band was amazing."', '["It was boring.", "It was fantastic.", "I''m not sure.", "That''s too bad."]', 1, '「バンドが素晴らしかった」と言っているので、楽しんだと伝える。It was fantastic. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Man: "Excuse me. How do I get to the station?" Woman: "Go straight for two blocks. __BLANK__"', '["You''ll see it on your left.", "I''m sorry.", "It''s closed today.", "I don''t have one."]', 0, '道案内の続きで、到着の目印を言う。You''ll see it on your left. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Boy: "I forgot my homework at home." Teacher: "__BLANK__ Bring it tomorrow."', '["That''s OK.", "You''re wrong.", "I don''t believe you.", "No problem."]', 0, '「明日持ってきて」と許しているので、大丈夫だと言っている。That''s OK. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Sister: "Can you help me with this math problem?" Brother: "__BLANK__ Let me see it."', '["I''m busy.", "Sure, no problem.", "I don''t want to.", "That''s difficult."]', 1, '「見せて」と言っているので、手伝うことに同意している。Sure, no problem. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Mother: "What did you do at the party?" Son: "__BLANK__ We played games and ate pizza."', '["I was very bored.", "I had a great time.", "I want to go home.", "I''m tired now."]', 1, '「ゲームをしてピザを食べた」と言っているので、楽しかったと伝える。I had a great time. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "My birthday is next Sunday." Boy: "__BLANK__" Girl: "I''m going to have a party at my house."', '["What are you going to do?", "How old are you?", "Where do you live?", "When did you come?"]', 0, '「家でパーティーをする」と答えるので、何をするか聞いている。What are you going to do? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Woman: "I''m going to study abroad next year." Man: "__BLANK__" Woman: "Australia. I''ve always wanted to go there."', '["Where are you going?", "When are you leaving?", "How long will you stay?", "Why do you want to go?"]', 0, '「オーストラリア。ずっと行きたかった」と答えるので、どこへ行くか聞いている。Where are you going? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Boy: "I''m nervous about the speech tomorrow." Girl: "__BLANK__ You''ve prepared well."', '["Don''t worry.", "Good luck.", "I''m sorry.", "That''s too bad."]', 0, '「よく準備している」と励ます前に、安心させる言葉。Don''t worry. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Father: "How was your job interview?" Son: "__BLANK__ They said they''ll call me next week."', '["It went well.", "It was terrible.", "I was late.", "I don''t know."]', 0, '「来週電話すると言われた」ので、うまくいったという意味。It went well. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "Could you pass me the salt?" Boy: "__BLANK__"', '["Here you are.", "You''re welcome.", "I''m fine.", "Thank you."]', 0, 'ものを渡すときの表現。Here you are. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Teacher: "Who knows the answer to this question?" Student: "__BLANK__" Teacher: "Good, please tell us."', '["I do.", "I am.", "I can.", "I have."]', 0, '「答えがわかる人？」への返答。「私が」が自然。I do. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Mother: "Why is your room so messy?" Son: "__BLANK__ I''ll clean it up right now."', '["I''m sorry,", "Thank you,", "You''re welcome,", "Good idea,"]', 0, '「今すぐ片づける」と言うので、まず謝っている。I''m sorry, が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Woman: "I just got a promotion at work." Man: "__BLANK__"', '["Congratulations!", "I''m sorry.", "That''s too bad.", "Never mind."]', 0, '昇進を祝う表現。Congratulations! が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Boy: "I can''t come to your party on Saturday." Girl: "__BLANK__" Boy: "I have a family reunion."', '["Why not?", "That''s great.", "See you then.", "I''m happy."]', 0, '「家族の集まりがある」と理由を説明するので、なぜか聞いている。Why not? が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "The movie was really long." Boy: "__BLANK__ I almost fell asleep."', '["Me, too.", "I loved it.", "It was exciting.", "That''s wonderful."]', 0, '「眠りそうになった」と言うので、同じく長く感じたと同意。Me, too. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Father: "We''re going to the beach this weekend." Son: "__BLANK__ Can I invite my friend?"', '["That''s great!", "I''m sorry.", "That''s too bad.", "I don''t think so."]', 0, '友達を誘っていいか聞いているので、行くことを喜んでいる。That''s great! が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Waiter: "Would you like dessert?" Customer: "__BLANK__ I''m full."', '["Yes, please.", "No, thank you.", "I''d love some.", "Sounds good."]', 1, '「お腹がいっぱい」と言うので、断っている。No, thank you. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "I lost my wallet on the train." Boy: "__BLANK__ Did you report it?"', '["That''s terrible.", "That''s great.", "Good job.", "You''re welcome."]', 0, '財布をなくしたと言われ、心配や同情を示す。That''s terrible. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Mother: "Don''t forget to lock the door." Son: "__BLANK__"', '["I won''t.", "I don''t.", "I can''t.", "I aren''t."]', 0, '「忘れないで」と言われて「忘れないよ」と答える。I won''t. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Boy: "I''m going to try out for the basketball team." Girl: "__BLANK__ You''re really good at it."', '["Good luck!", "I''m sorry.", "That''s too bad.", "Never mind."]', 0, 'チーム入りに挑戦する人を励ます。Good luck! が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Man: "How long have you been learning English?" Woman: "__BLANK__"', '["For three years.", "In Tokyo.", "Very much.", "Every day."]', 0, '「どのくらい習っているか」には期間で答える。For three years. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Sister: "I''m going to the dentist tomorrow." Brother: "__BLANK__" Sister: "I have a toothache."', '["What''s wrong?", "Where is it?", "When is it?", "How much is it?"]', 0, '「歯が痛い」と答えるので、どうしたか聞いている。What''s wrong? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "I didn''t pass the driving test." Boy: "__BLANK__ You can try again."', '["Don''t worry.", "Congratulations!", "Good job.", "You''re welcome."]', 0, '落ちた人を励まして、また受けられると言う前に安心させる。Don''t worry. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Teacher: "Does anyone have a question?" Student: "__BLANK__" Teacher: "Yes, what is it?"', '["I do.", "I am.", "I can.", "I have."]', 0, '「質問のある人？」への返答。「私が」が自然。I do. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Wife: "I''m going to the supermarket. __BLANK__" Husband: "Yes, we need milk and bread."', '["Do you need anything?", "Are you coming?", "What time is it?", "Where are you going?"]', 0, '「牛乳とパンが必要」と答えるので、何か必要なものがあるか聞いている。Do you need anything? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Boy: "I got 100 on my math test." Girl: "__BLANK__"', '["That''s wonderful!", "I''m sorry.", "That''s too bad.", "Never mind."]', 0, '満点を喜ぶ表現。That''s wonderful! が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Mother: "Why didn''t you tell me you were sick?" Daughter: "__BLANK__ I didn''t want to worry you."', '["I''m sorry,", "Thank you,", "You''re right,", "Good idea,"]', 0, '「心配かけたくなかった」と理由を言う前に謝る。I''m sorry, が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Man: "Would you like to try this cake? I made it myself." Woman: "__BLANK__"', '["I''d love to.", "No, thanks.", "I''m full.", "I don''t like it."]', 0, '勧められたものを喜んで受け取る表現。I''d love to. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Girl: "I can''t find my keys." Boy: "__BLANK__" Girl: "Thanks. I''ll check the living room."', '["Let me help you look.", "I don''t know.", "You''re wrong.", "That''s mine."]', 0, '「リビングを確認する」と言うので、探す手伝いを申し出たとわかる。Let me help you look. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Father: "Your room is a mess. __BLANK__" Son: "OK, Dad. I''ll do it now."', '["Please clean it up.", "Have a good day.", "Thank you.", "See you later."]', 0, '「今やる」と言うので、片づけるよう指示された。Please clean it up. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Boy: "I''m going to the library to study." Girl: "__BLANK__" Boy: "Sure. Let''s go together."', '["Can I come with you?", "Where is it?", "When does it close?", "What are you studying?"]', 0, '「一緒に行こう」と言うので、一緒に行っていいか聞いた。Can I come with you? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('3級', 'conversation_fill', 'Woman: "I''m sorry I''m late. The bus was delayed." Man: "__BLANK__ These things happen."', '["That''s OK.", "You''re wrong.", "I don''t believe you.", "No way."]', 0, '遅刻の謝罪を許す表現。That''s OK. が適切。');
