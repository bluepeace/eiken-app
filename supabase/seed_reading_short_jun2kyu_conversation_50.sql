-- seed_reading_short_jun2kyu_conversation_50.sql
-- 英検準2級 会話文の空所補充 50問
-- 出題傾向: 高校中級・会話の機能と文脈からの推論、やや長い対話
-- 実行: マイグレーション 028, 030 適用後、本ファイルを実行

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Mom, it''s so hot in this room. Why don''t you __BLANK__?" B: "I wish I could, but it hasn''t been working since this morning." A: "Are you serious? Our grandparents will be here soon!"', '["turn off the kitchen heater", "drink some orange juice", "turn on the air conditioner", "buy a new washing machine"]', 2, '「暑い」と言い、母が「できたらいいけど今朝から動かない」と答えるので、エアコンをつけてほしいという依頼。turn on the air conditioner が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Thanks for meeting me at the airport. The flight was great, but __BLANK__." B: "That''s too bad. Hopefully, you can get some rest in the car."', '["I couldn''t sleep well", "I lost all my baggage", "it arrived just in time", "my flight was canceled"]', 0, '「残念」と言われ「車で休んで」と続くので、眠れなかったという意味が自然。I couldn''t sleep well が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Mom, __BLANK__." B: "Oh no. Are you OK? When did it start?" A: "Right after lunch. I had chicken curry at an Indian restaurant. It was really spicy." B: "It''s probably best to skip dinner tonight."', '["one of my fingers hurts", "I think I''ve caught a cold", "I went to the hospital yesterday", "my stomach isn''t feeling well"]', 3, '「スパイシーなカレー」「夕食は抜いた方がいい」から、胃の不調とわかる。my stomach isn''t feeling well が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'B: "There''s something wrong with the printer in our office. Could you __BLANK__?" A: "May I ask what seems to be the problem?" B: "It won''t print anything. An error message appears."', '["make a copy for me", "come and take a look at it", "write and send some papers", "follow the instructions"]', 1, '技術サポートへの電話で、プリンターの修理を依頼している。come and take a look at it が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "We''ll send someone over right away. What''s __BLANK__?" B: "It''s 220 Maple Street, Rivertown."', '["your office address", "your phone number", "the name of your company", "the model of your printer"]', 0, '「220 Maple Street」と住所を答えるので、オフィスの住所を聞いている。your office address が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I dropped my computer and the top half of the screen is dark." B: "I understand. I''ll __BLANK__ and check if everything else works well."', '["fix your desk as soon as possible", "make sure the screen is dark enough", "change the screen to a new one", "return it to you without any repairs"]', 2, '画面が壊れているので、画面の交換後に他に異常がないか確認する流れ。change the screen to a new one が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I have heavy bags and I don''t want to walk much." B: "In that case, __BLANK__. It drops us off right in front of the hotel."', '["we should take the bus", "we can walk to our hotel", "let''s book a guided tour later", "let''s check in our baggage first"]', 0, '荷物が重く歩きたくないので、ホテル前まで行けるバスを勧めている。we should take the bus が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "For your salad, would you like a creamy dressing or a spicy dressing?" B: "I don''t want my salad to be too hot, so I''ll have __BLANK__, please."', '["another cup of tea", "the creamy one", "two more tacos", "something spicy"]', 1, '「熱くしたくない」と言っているので、スパイシーではなくクリーミーを選ぶ。the creamy one が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m planning to make vegetable sushi for the party because some of my friends __BLANK__." B: "That''s thoughtful. How about getting the ingredients at the farmers'' market?"', '["don''t like parties", "don''t eat meat or fish", "like to go fishing", "like to eat out"]', 1, '野菜寿司を作る理由として、肉や魚を食べない友達がいることが自然。don''t eat meat or fish が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "You __BLANK__, so everything is fresh and delicious." B: "That sounds perfect. How are the prices?"', '["are expecting a poor harvest this year", "are working at the farms nearby", "can buy directly from the producers", "can learn how to make sushi rolls"]', 2, '直売所で新鮮と感じる理由として、生産者から直接買えることが自然。can buy directly from the producers が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Do you want to study together after school?" B: "__BLANK__ I have to watch the soccer game at 5." A: "No problem. We can study for an hour."', '["I''d love to, but I won''t be able to stay long", "I don''t like studying", "Let''s go home early", "The game is boring"]', 0, '5時にサッカーを見るので、長時間は無理だと言う流れ。I''d love to, but I won''t be able to stay long が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "My internet is really slow on this computer." B: "Why don''t you __BLANK__? That might help." A: "Good idea. I''ll try that."', '["buy a new one", "restart it", "throw it away", "turn off the lights"]', 1, 'ネットが遅いときの対処として、再起動を提案するのが自然。restart it が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I need to finish my history report by tomorrow. __BLANK__" B: "Of course. I''ll help you. What do you need?"', '["Can you help me with it?", "Did you finish yours?", "Is it difficult?", "When is the deadline?"]', 0, '「明日までに終わらせないといけない」「手伝って」と続くので、助けを求めている。Can you help me with it? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "We''re visiting the city with our kids this weekend. What fun activities are there?" B: "There''s a museum exhibition, but __BLANK__. How about the music festival? There are live performances and activities for children."', '["it''s free", "it might be boring for kids", "it''s very popular", "it''s close to here"]', 1, '「でも」の後に子供向けの音楽祭を勧めているので、博物館は子供には退屈という意味。it might be boring for kids が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Excuse me. Is this seat taken?" B: "No, __BLANK__." A: "Thank you."', '["you can''t sit here", "it''s all yours", "I''m leaving now", "go away please"]', 1, '席が空いていることを伝え、座っていいと言う表現。it''s all yours が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The meeting has been postponed to next Monday." B: "__BLANK__ I have another appointment that day." A: "Let me check with the manager. Maybe we can find another time."', '["That''s perfect.", "That''s a problem.", "I''m looking forward to it.", "No problem."]', 1, 'その日は別の予定があるので、延期は困ると言っている。That''s a problem. が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m afraid I can''t make it to your party on Saturday." B: "__BLANK__" A: "I have to work overtime. I''m really sorry."', '["What a pity!", "That''s great!", "Congratulations!", "You''re welcome!"]', 0, 'パーティーに来られないと言われ、残念がる表現。What a pity! が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Would you like me to pick you up from the station?" B: "That would be great, but __BLANK__. I''ll take a taxi."', '["my train arrives at 6 p.m.", "I don''t know the way", "I''m not sure when I''ll arrive", "the station is very close"]', 2, '「タクシーで行く」と言っているので、到着時間がわからないなど迎えが難しい理由。I''m not sure when I''ll arrive が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''ve been looking for this book everywhere. Where did you find it?" B: "__BLANK__ It was on the bottom shelf."', '["I bought it yesterday", "At the library", "I don''t remember", "It''s very expensive"]', 1, '「本棚の一番下にあった」と言っているので、図書館で見つけたと答える。At the library が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Could you speak a little more slowly? __BLANK__" B: "Of course. I''ll slow down."', '["I''m in a hurry", "I didn''t catch everything", "Your accent is strange", "I''m bored"]', 1, 'もっとゆっくり話してほしい理由として、聞き取れなかったことが自然。I didn''t catch everything が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m thinking of taking a gap year before university." B: "__BLANK__ What do you want to do?" A: "I''d like to travel and volunteer abroad."', '["That''s a bad idea", "That sounds interesting", "You''re too young", "Forget about it"]', 1, 'その後の計画を聞いているので、興味を持っている表現。That sounds interesting が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m sorry, but we''ve run out of chicken. __BLANK__" B: "Yes, I''ll have the fish instead."', '["Would you like something else?", "The chicken is cold", "We have too much", "Please wait a minute"]', 0, 'チキンがないので、別のものを勧める表現。Would you like something else? が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The battery on my phone keeps dying quickly." B: "__BLANK__ You might have too many apps running in the background."', '["Buy a new phone", "Try closing some apps", "Throw it away", "Use it more"]', 1, 'バックグラウンドでアプリが動いているかもしれないと言うので、アプリを閉めるよう提案する。Try closing some apps が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I heard you''re moving to a new apartment." B: "Yes, next month. __BLANK__ The rent is much cheaper."', '["It''s in the city center", "That''s why I chose it", "I''ll miss this place", "It''s very small"]', 1, '「家賃がずっと安い」と言っているので、そのためそれを選んだという意味。That''s why I chose it が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Do you mind if I open the window? It''s a bit stuffy in here." B: "__BLANK__ I feel the same way."', '["Yes, I do", "Not at all", "Close it please", "I''m cold"]', 1, '「私もそう感じる」と言っているので、窓を開けることへの同意。Not at all が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m going to the gym after work. Would you like to join me?" B: "I''d love to, but __BLANK__. Maybe next time."', '["I need to finish a report first", "the gym is too far", "I don''t like exercise", "you go alone"]', 0, '「今度にして」と言っているので、今はできない理由を述べる。I need to finish a report first が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Your presentation was excellent. Everyone was impressed." B: "__BLANK__ I practiced a lot."', '["I don''t think so", "Thank you. I''m glad to hear that", "You''re wrong", "It was terrible"]', 1, '褒められたときのお礼と喜びを示す表現。Thank you. I''m glad to hear that が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The café on the corner has great coffee. Have you been there?" B: "No, __BLANK__" A: "You should try it. The cake is delicious too."', '["I go there every day", "I''ve been meaning to", "I don''t like coffee", "it''s always closed"]', 1, '「試してみるといい」と言われ、「行こうと思っていた」と答える流れ。I''ve been meaning to が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I can''t find my keys. Have you seen them?" B: "__BLANK__ You left them on the kitchen table this morning."', '["Yes, I have", "No, I haven''t", "I don''t know", "They''re mine"]', 0, 'キッチンのテーブルに置いたと教えているので、見たことがあると答えている。Yes, I have が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "We need to decide on a theme for the school festival." B: "__BLANK__ How about ''Around the World''? We could have food and music from different countries."', '["I have no idea", "I''ve got a suggestion", "Let''s cancel it", "It''s too late"]', 1, '「アラウンド・ザ・ワールド」という案を出しているので、提案があると言う。I''ve got a suggestion が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m sorry I''m late. The traffic was terrible." B: "__BLANK__ The meeting hasn''t started yet."', '["You''re fired", "Don''t worry about it", "That''s unacceptable", "You''re always late"]', 1, '会議はまだ始まっていないので、心配しなくていいと伝える。Don''t worry about it が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Could you help me carry these boxes to the car?" B: "__BLANK__" A: "Thanks. They''re not too heavy."', '["I''m too busy", "Sure, no problem", "I don''t want to", "Ask someone else"]', 1, '「重くない」と続くので、手伝うことに同意している。Sure, no problem が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The deadline for the project is next Friday." B: "__BLANK__ We still have a lot to do." A: "I know. Let''s work on it together this weekend."', '["That''s plenty of time", "We''re running out of time", "We''ve finished it", "No problem"]', 1, '「やることがたくさん残っている」と言うので、時間が足りないと感じている。We''re running out of time が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''ve decided to study medicine at university." B: "__BLANK__ You''ve always been good at science."', '["That''s a shame", "That makes sense", "I''m surprised", "That''s too bad"]', 1, '科学が得意だったことを踏まえ、納得している様子。That makes sense が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The concert tickets are sold out." B: "__BLANK__ I really wanted to go." A: "Maybe we can find some online."', '["That''s great news", "What a disappointment", "I''m so happy", "No problem"]', 1, '行きたかったのに売り切れで残念がっている。What a disappointment が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m not feeling well. I think I should go home." B: "__BLANK__ Do you want me to call a taxi?"', '["That''s too bad", "You should stay", "Take care of yourself", "Stay and work"]', 2, '具合が悪い人に帰ることを勧め、心配している表現。Take care of yourself が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The new restaurant downtown is getting good reviews." B: "__BLANK__" A: "Yes, we could try it this weekend."', '["Should we give it a try?", "I don''t like it", "It''s too expensive", "Let''s never go"]', 0, '週末に試せるかと続くので、行ってみることを提案している。Should we give it a try? が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I forgot to bring my laptop. Can I use yours for the presentation?" B: "__BLANK__ I''m not using it right now."', '["No way", "Of course, help yourself", "It''s broken", "I need it"]', 1, '今使っていないと言っているので、貸すことに同意している。Of course, help yourself が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m nervous about the interview tomorrow." B: "__BLANK__ You''re well prepared."', '["Don''t worry", "Good luck", "That''s too bad", "I''m sorry"]', 0, 'よく準備していると励ます前に、安心させる言葉。Don''t worry が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Could you tell me how to get to the station from here?" B: "__BLANK__ It''s about a 10-minute walk."', '["Go straight and turn right at the corner", "I don''t know", "Take a taxi", "It''s closed today"]', 0, '「10分ほど歩く」と続くので、道案内をしている。Go straight and turn right at the corner が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''ve been offered a job in London." B: "__BLANK__ That''s a big decision." A: "I know. I''m still thinking about it."', '["That''s wonderful!", "Congratulations! Are you going to take it?", "That''s terrible", "Forget about it"]', 1, 'ロンドンでの仕事のオファーについて、お祝いと決断を尋ねる流れ。Congratulations! Are you going to take it? が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The washing machine is making a strange noise." B: "__BLANK__ It might need repair."', '["Ignore it", "I''ll take a look at it", "Buy a new one", "Use it more"]', 1, 'おかしな音がするので、修理が必要かもしれないと言いながら、自分で確認する。I''ll take a look at it が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m allergic to nuts. Does this dish contain any?" B: "__BLANK__ I''ll check with the chef."', '["I don''t know", "I''m not sure. Let me find out", "Yes, it does", "No need to check"]', 1, 'シェフに確認すると言っているので、わからないが調べると伝える。I''m not sure. Let me find out が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The movie was much better than I expected." B: "__BLANK__ I''d like to see it again."', '["I agree", "I disagree", "It was boring", "I hated it"]', 0, 'もう一度見たいと言っているので、同じく良かったと同意。I agree が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I need to return this shirt. It doesn''t fit." B: "__BLANK__" A: "Yes, I have the receipt."', '["Do you have the receipt?", "We don''t accept returns", "Keep it", "It''s final sale"]', 0, '「レシートは持っている」と答えるので、レシートの有無を聞いている。Do you have the receipt? が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m going to run a marathon next month." B: "__BLANK__ How long have you been training?"', '["That''s easy", "That''s impressive", "I don''t care", "So what"]', 1, 'どれくらい練習しているか聞くのは、感心しているから。That''s impressive が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The air conditioning isn''t working in our room." B: "I''m sorry to hear that. __BLANK__"', '["We''ll send someone to fix it right away", "You''ll have to wait", "There''s nothing we can do", "Turn it off"]', 0, 'ホテルなどの窓口で、修理を手配することを伝える表現。We''ll send someone to fix it right away が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "How was your trip to Kyoto?" B: "It was wonderful, but __BLANK__. I wish I had more time."', '["the weather was perfect", "I visited many temples", "we had to leave early", "everyone was friendly"]', 2, '「もっと時間があれば」と言うので、早く帰らざるを得なかったという意味。we had to leave early が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m having trouble with my math homework." B: "__BLANK__ I finished it yesterday."', '["So am I", "I can help you with it", "It''s too difficult", "Give up"]', 1, '昨日終わらせたと言うので、手伝うと提案する流れ。I can help you with it が自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "What would you like to drink?" B: "I''ll have __BLANK__. I''m trying to cut down on caffeine."', '["a double espresso", "a large coffee", "some herbal tea", "an energy drink"]', 2, 'カフェインを控えているので、ハーブティーを選ぶ。some herbal tea が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "The train has been delayed. We might miss our connecting flight." B: "__BLANK__ There''s another one in two hours."', '["We''re in big trouble", "Don''t worry, we''ll make it", "That''s the last flight", "We have no choice"]', 1, '「2時間後に次の便がある」と続くので、心配しなくていいと励ます。Don''t worry, we''ll make it が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''ve passed my driving test!" B: "__BLANK__ I knew you could do it."', '["That''s too bad", "Congratulations!", "I''m sorry", "Really? I doubt it"]', 1, '免許合格のお祝いとして、Congratulations! が適切。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "Could you repeat that? __BLANK__" B: "Sure. I said the meeting is at 3 p.m."', '["I wasn''t listening", "I didn''t understand", "I need to leave", "I''m busy"]', 1, '繰り返しを求める理由として、理解できなかったことが自然。I didn''t understand が正解。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'conversation_fill', 'A: "I''m going to the post office. __BLANK__" B: "Yes, could you mail this package for me?"', '["Do you need anything?", "Is it open today?", "Where is it?", "Why are you going?"]', 0, '「この荷物を出してくれる？」と頼まれるので、何か用があるか聞いている。Do you need anything? が正解。');
