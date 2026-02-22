-- seed_reading_short_5kyu_conversation_50.sql
-- 英検5級 会話文の空所補充 50問
-- 出題傾向: 中学初級・短い2往復の会話、日常場面、基本表現
-- 実行: マイグレーション 028, 030 適用後、本ファイルを実行

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Let''s start today''s English lesson. __BLANK__" Student: "OK, Ms. Peterson."', '["See you tomorrow.", "We''re going to school.", "Please open your book.", "You can go home."]', 2, '「授業を始める」と言った後、指示を出すのが自然です。Please open your book.（本を開けてください）が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Woman: "Excuse me. What time does the next train come?" Man: "__BLANK__"', '["Yes, it does.", "It''s good.", "At five o''clock.", "For one hour."]', 2, '「次の電車は何時に来ますか」という質問には時刻で答えます。At five o''clock.（5時です）が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "Bob, come here and help me with dinner." Boy: "__BLANK__ Mom. I''m coming."', '["All right,", "It''s ready,", "You can drink it,", "No, I can''t,"]', 0, 'お母さんの呼びかけに承諾する表現です。All right,（わかりました）が自然な返答。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "What class do you like?" Boy: "__BLANK__"', '["Science.", "I go to school.", "After lunch.", "It''s my homework."]', 0, '「どの授業が好きですか」には教科名で答えます。Science.（理科です）が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Please close the windows, Jack. __BLANK__" Student: "Yes, Ms. Carter."', '["Good morning.", "Here you are.", "It''s cold.", "It''s today."]', 2, '窓を閉める理由を述べるのが自然です。It''s cold.（寒いから）が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Do you have any sisters?" Girl: "No, but __BLANK__"', '["it''s my birthday.", "I have two brothers.", "this is my room.", "I like tennis."]', 1, '「姉妹はいますか」に「いいえ」と答えた後、兄弟はいることを言う流れが自然。I have two brothers. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "What''s the date today?" Mother: "__BLANK__"', '["It''s April 29.", "It''s nine o''clock.", "I love spring.", "Next Monday."]', 0, '「今日は何日ですか」には日付で答えます。It''s April 29. が正解。nine o''clock は時刻、Next Monday は曜日。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "What do you do on weekends, Bob?" Boy: "__BLANK__"', '["No, I don''t.", "Good idea.", "I play soccer.", "Sorry, I can''t."]', 2, '「週末は何をしますか」には活動を答えます。I play soccer. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy 1: "Let''s play badminton at the park, Brad." Boy 2: "__BLANK__"', '["Yes, let''s.", "Yes, I am.", "It''s you.", "It''s short."]', 0, '「〜しましょう」という提案には Yes, let''s. で賛成するのが定番の返答です。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Hi, I''m Tom. I''m your new English teacher." Girl: "Hello, Tom. __BLANK__"', '["I think so.", "You''re welcome.", "I do, too.", "Nice to meet you."]', 3, '初めて会う人への挨拶では Nice to meet you.（お会いできてうれしいです）を使います。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Where are my pajamas, Mom?" Mother: "__BLANK__"', '["It''s big.", "Five dollars.", "On your bed.", "After dinner."]', 2, '「どこにありますか」という質問には場所で答えます。On your bed.（ベッドの上よ）が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "What drink do you want?" Girl: "__BLANK__"', '["Two eggs.", "Yes, at night.", "Orange juice, please.", "Every weekend."]', 2, '「何の飲み物がほしい」には飲み物の名前で答えます。Orange juice, please. が自然な返答。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "Allan, your pink T-shirt is nice." Boy: "__BLANK__ Brenda."', '["Thanks,", "Good job,", "You''re welcome,", "They''re interesting,"]', 0, '褒められたときは Thanks, や Thank you. でお礼を言います。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "When do you study English, Taro?" Boy: "__BLANK__ Then I watch TV."', '["I like it.", "In my room.", "After dinner.", "For three hours."]', 2, '「いつ」の質問には時を答えます。「そのあとテレビを見る」から、After dinner.（夕食後）が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Can you come to my house today, Lisa?" Girl: "No, I can''t. __BLANK__"', '["That''s a good idea.", "I have a violin lesson.", "Come in, please.", "It''s not mine."]', 1, '断るときは理由を添えるのが自然です。I have a violin lesson.（バイオリンのレッスンがあるの）が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "__BLANK__ Sally?" Girl: "Yes, let''s eat."', '["Do you know her,", "Are you ready for dinner,", "Is it cold today,", "When does it start,"]', 1, '「はい、食べましょう」という返答から、食事の準備ができたか聞いているとわかります。Are you ready for dinner? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Let''s go hiking today." Mother: "__BLANK__ We can make some sandwiches."', '["You''re tall.", "Good idea.", "You''re welcome.", "Yes, it is."]', 1, '提案に賛成するときは Good idea.（いいわね）と言います。サンドイッチを作る話と自然につながります。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "How old are you, Yuki?" Girl: "__BLANK__"', '["I''m eleven.", "I''m fine.", "It''s Monday.", "Yes, I can."]', 0, '「何歳ですか」には年齢で答えます。I''m eleven. が正解。I''m fine は「元気です」の意味。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "Do you like math, Ken?" Boy: "__BLANK__ It''s my favorite subject."', '["No, I don''t.", "Yes, I do.", "I''m from Tokyo.", "It''s in the bag."]', 1, '「数学は好き？」に「得意科目です」と続くので、肯定の Yes, I do. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Stand up, everyone. __BLANK__" Students: "Yes, Mr. Brown."', '["Sit down, please.", "Good morning.", "Open the door, please.", "Close your notebooks."]', 2, '「立って」と言った後、次の動作を指示します。Open the door, please.（ドアを開けてください）が自然な指示。Sit down は「立って」と矛盾。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "How much is this pen?" Boy: "__BLANK__"', '["It''s blue.", "It''s 100 yen.", "Yes, I do.", "I''m ten."]', 1, '「いくらですか」には値段で答えます。It''s 100 yen. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "Tom, __BLANK__" Boy: "OK, Mom. I''ll do it after school."', '["where is your bag?", "can you clean your room?", "what time is it?", "do you like soccer?"]', 1, '「放課後にやる」と言っているので、お手伝いの依頼が自然。can you clean your room? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "What day is it today?" Girl: "__BLANK__"', '["It''s sunny.", "It''s Saturday.", "It''s 3 o''clock.", "It''s January 5."]', 1, '「今日は何曜日ですか」には曜日で答えます。It''s Saturday. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Emma, please read the next page. __BLANK__" Girl: "Yes, Ms. Lee."', '["See you later.", "It''s very long.", "Start from the top.", "I like this book."]', 2, '「次のページを読んで」の後、どこから読むか指示するのが自然。Start from the top.（上から読んで）が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "I''m sorry I''m late." Teacher: "__BLANK__ Sit down, please."', '["Thank you.", "That''s OK.", "Nice to meet you.", "Good idea."]', 1, '遅刻の謝罪には That''s OK.（大丈夫です）で許すのが自然な返答。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "Here''s your lunch, Dad." Father: "__BLANK__"', '["You''re welcome.", "Thank you.", "I''m fine.", "Good morning."]', 1, 'ものを渡されたときは Thank you. でお礼を言います。You''re welcome は「どういたしまして」で、お礼を言う側が使う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Thank you for the present." Girl: "__BLANK__"', '["Thank you.", "I''m sorry.", "You''re welcome.", "Good idea."]', 2, 'お礼を言われたら You''re welcome.（どういたしまして）と返します。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "What''s your favorite food, Amy?" Girl: "__BLANK__"', '["I play tennis.", "I''m twelve.", "I like pizza.", "It''s on the table."]', 2, '「好きな食べ物は」には食べ物の好みで答えます。I like pizza. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Where do you live, Saki?" Girl: "__BLANK__"', '["I go to school.", "I live in Osaka.", "Yes, I do.", "At seven."]', 1, '「どこに住んでいますか」には場所で答えます。I live in Osaka. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Can you spell ''apple,'' Mike?" Boy: "__BLANK__"', '["Yes, I can. A-P-P-L-E.", "No, I don''t.", "It''s red.", "I like apples."]', 0, '「apple とつづれますか」にはできると答えてつづりを言うのが自然。Yes, I can. A-P-P-L-E. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "Let''s go to the library." Boy: "__BLANK__"', '["I''m from Canada.", "Yes, let''s.", "It''s Monday.", "In the morning."]', 1, '「〜に行きましょう」という提案には Yes, let''s. で賛成するのが定番。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "How many brothers do you have?" Boy: "__BLANK__"', '["I have two.", "I''m fine.", "Yes, I do.", "It''s big."]', 0, '「兄弟は何人いますか」には人数で答えます。I have two. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Is this your pencil case?" Girl: "__BLANK__"', '["It''s blue.", "Yes, it is.", "I go home.", "At 4 o''clock."]', 1, '「これはあなたの筆箱ですか」には Yes/No で答えます。Yes, it is. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "What color is your new bike?" Boy: "__BLANK__"', '["It''s red.", "I have two.", "It''s 5,000 yen.", "I like bikes."]', 0, '「自転車は何色ですか」には色で答えます。It''s red. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Don''t run in the hallway. __BLANK__" Boy: "I''m sorry."', '["Walk, please.", "Good job.", "See you.", "Sit down."]', 0, '「廊下で走らないで」の後、代わりにどうするか指示します。Walk, please.（歩いてください）が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Excuse me. Where is the restroom?" Woman: "__BLANK__"', '["It''s over there.", "Yes, please.", "I''m fine.", "Thank you."]', 0, '「トイレはどこですか」には場所を教えます。It''s over there.（あそこです）が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "Do you have a pet?" Boy: "Yes. __BLANK__"', '["I like dogs.", "I have a cat.", "It''s small.", "I''m happy."]', 1, '「ペットはいますか」に「はい」と答えた後、何のペットか言うのが自然。I have a cat. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "What time do you get up?" Boy: "__BLANK__"', '["At seven.", "In the park.", "I like morning.", "Yes, I do."]', 0, '「何時に起きますか」には時刻で答えます。At seven. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Are you from Japan?" Girl: "__BLANK__ I was born in Tokyo."', '["No, I''m not.", "Yes, I am.", "I''m fine.", "It''s big."]', 1, '「日本出身ですか」に「東京で生まれました」と続くので、Yes, I am. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Look at the board. __BLANK__" Student: "Yes, Mr. Green."', '["Goodbye.", "Copy these sentences.", "I''m tired.", "It''s easy."]', 1, '「黒板を見て」の後、何かするよう指示するのが自然。Copy these sentences.（この文を写して）が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "Can you help me with this?" Boy: "__BLANK__"', '["Yes, of course.", "No, I don''t.", "It''s mine.", "I''m ten."]', 0, '「手伝ってくれる？」という依頼には Yes, of course. で承諾するのが自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "How''s the weather today?" Girl: "__BLANK__"', '["It''s sunny.", "It''s Monday.", "It''s 3 o''clock.", "I''m fine."]', 0, '「今日の天気はどうですか」には天気で答えます。It''s sunny. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "Did you do your homework?" Boy: "__BLANK__ I finished it last night."', '["No, I didn''t.", "Yes, I did.", "I''m sorry.", "Good idea."]', 1, '「宿題をした？」に「昨夜終わらせた」と続くので、Yes, I did. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "Whose book is this?" Boy: "__BLANK__"', '["It''s science.", "It''s interesting.", "It''s mine.", "I like it."]', 2, '「これは誰の本ですか」には所有者で答えます。It''s mine.（私のです）が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Let''s have lunch together." Girl: "__BLANK__"', '["I''m full.", "Yes, let''s.", "It''s delicious.", "After school."]', 1, '「一緒に昼食を食べましょう」という提案には Yes, let''s. で賛成するのが自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Turn off your phones. __BLANK__" Students: "Yes, Ms. White."', '["Call me later.", "The test starts now.", "I like phones.", "Good morning."]', 1, '「電話の電源を切って」の後、テスト開始を告げるのが自然。The test starts now. が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "Don''t forget your umbrella. __BLANK__" Girl: "OK, Mom."', '["It''s in the bag.", "It''s going to rain.", "I like rain.", "It''s sunny."]', 1, '傘を持っていくように言う理由として、It''s going to rain.（雨が降りそうだから）が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "Where do you study?" Girl: "__BLANK__"', '["After dinner.", "I like math.", "In my room.", "For one hour."]', 2, '「どこで勉強しますか」には場所で答えます。In my room. が正解。After dinner は「いつ」、For one hour は「どのくらい」。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "What sport do you like?" Boy: "__BLANK__"', '["I play every day.", "I like baseball.", "At the park.", "Yes, I do."]', 1, '「どんなスポーツが好きですか」にはスポーツ名で答えます。I like baseball. が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "I''m hungry." Mother: "__BLANK__ Dinner is almost ready."', '["Me, too.", "Wait a minute.", "Thank you.", "Goodbye."]', 1, '「お腹が空いた」と言われ、「夕食はもうすぐ」と続くので、Wait a minute.（少々待って）が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Teacher: "Raise your hand if you know the answer. __BLANK__" Girl: "I do, Ms. Clark."', '["Put it down.", "Who wants to try?", "Sit down.", "Close your book."]', 1, '「答えがわかったら手を挙げて」の後、誰か指名する流れが自然。Who wants to try?（誰か答えたい人は？）が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Girl: "This is heavy. __BLANK__" Boy: "Sure. I''ll carry it for you."', '["Thank you.", "Can you help me?", "You''re welcome.", "Good idea."]', 1, '「重い」と言った後、助けを求めるのが自然。Can you help me? に「 Sure. I''ll carry it for you.」と続く。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Boy: "See you tomorrow." Girl: "__BLANK__"', '["Nice to meet you.", "See you.", "Thank you.", "Good morning."]', 1, '「また明日」と別れの挨拶をされたら、See you. と返すのが自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('5級', 'conversation_fill', 'Mother: "How was school today?" Boy: "__BLANK__ I had a math test."', '["It was fun.", "I go at eight.", "It''s in my bag.", "Yes, I did."]', 0, '「今日の学校はどうだった？」には様子で答えます。It was fun. に「数学のテストがあった」と続く流れが自然。');