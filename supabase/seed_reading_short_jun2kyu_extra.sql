-- seed_reading_short_jun2kyu_extra.sql
-- 英検準2級 短文の語句空所補充 追加80問（21〜100）
-- 実行順: 030 マイグレーション → seed_reading_short_jun2kyu.sql（20問）→ 本ファイル（80問）で計100問

-- (21) all over / 〜じゅうに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'When Karen woke up, there was snow __BLANK__ the ground. She was happy because she knew that there would be no school that day.', '["all over", "just like", "up to", "ahead of"]', 0, '"地面じゅうに雪が積もっていた」は "snow all over the ground" です。all over で「〜じゅうに、一面に」。');

-- (22) make an excuse / 言い訳する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'A: Why were you late for school today, Ben? B: I don''t want to __BLANK__. The truth is that I overslept.', '["have a dream", "have a word", "make an excuse", "make a start"]', 2, '"言い訳したくない」は "don''t want to make an excuse" です。make an excuse で「言い訳する」。');

-- (23) as long as / 〜する限り（接続詞）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Justin does not mind doing the cooking for his family __BLANK__ he does not have to wash the dishes afterward.', '["as soon as", "as long as", "even if", "by the time"]', 1, '"後片付けをしなくていい限り」は "as long as 節" です。as long as は「〜する限り、〜である限り」という条件。');

-- (24) succeeded in / 〜に成功した
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'After several weeks of practicing on the piano, Ella finally __BLANK__ playing the song perfectly. Her father was very happy because it was his favorite song.', '["succeeded in", "lived on", "suffered from", "felt like"]', 0, '"〜するのに成功した」は "succeeded in 〜ing" です。succeed in で「〜に成功する」。');

-- (25) took action / 行動を起こした
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'When Hannah saw smoke coming from the windows of the building, she __BLANK__ immediately. She called the fire department on her phone.', '["took action", "took place", "turned down", "turned on"]', 0, '"すぐに行動を起こした」は "took action" です。take action で「行動を起こす」。take place は起こる、turn down は断る。');

-- (26) in a minute / すぐに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'A: Please don''t go yet, Dad. I want to talk to you about something. B: I''ll be back __BLANK__. I just want to get a cup of coffee.', '["by the time", "at present", "in a minute", "for long"]', 2, '"すぐに戻る」は "I''ll be back in a minute" です。in a minute で「すぐに、少したったら」。');

-- (27) in common / 共通点
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Dawn and her new boyfriend have a lot __BLANK__. They both love reading, hiking, and traveling, and they both work in the same kind of job.', '["at fault", "on hand", "in common", "by heart"]', 2, '"たくさん共通点がある」は "have a lot in common" です。in common で「共通して」。');

-- (28) turn into / 〜に変わる
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'At first, the weather report said that the storm would __BLANK__ a typhoon. However, the storm got weaker and only became a tropical storm.', '["turn into", "break down", "come across", "make with"]', 0, '"台風に変わる」は "turn into a typhoon" です。turn into で「〜に変わる、〜になる」。');

-- (29) catch up with / 追いつく
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'A: Sorry I''m late, Jane. B: It doesn''t matter, Tom. We can __BLANK__ the others after we''ve had our lunch.', '["catch up with", "get away with", "come down with", "throw away with"]', 0, '"みんなに追いつく」は "catch up with 〜" です。catch up with で「〜に追いつく」。come down with は病気になる。');

-- (30) heat / 暑さ
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'James wanted to get away from the summer __BLANK__, so he went to a small town in the mountains.', '["heat", "leisure", "order", "habit"]', 0, '"夏の暑さから逃れたくて」は "get away from the summer heat" です。heat は「熱、暑さ」。');

-- (31) amount / 量
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'You used too much sugar in this cake. Next time, reduce the __BLANK__ of sugar by half.', '["amount", "number", "total", "sum"]', 0, '不可算名詞（sugar）の「量」は "amount" を使います。amount of 〜 で「〜の量」。number は数えられるものに。');

-- (32) safety / 安全
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'All passengers must wear seat belts for the __BLANK__ of everyone on the bus.', '["safety", "danger", "risk", "warning"]', 0, '"みんなの安全のために」は "for the safety of 〜" です。safety は「安全」。danger は危険、risk はリスク。');

-- (33) techniques / 技術
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'A: This fish is delicious. How did you cook it? B: I learned some basic __BLANK__ from my grandmother. She was a great cook.', '["techniques", "machines", "engines", "magazines"]', 0, '"基本的な調理の技術」は "basic techniques" です。technique は「技術、やり方」。');

-- (34) fried / 揚げた
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'A: This fish is delicious. How did you cook it? B: I __BLANK__ it in oil. It''s simple but tasty.', '["fried", "boiled", "frozen", "melted"]', 0, '油で「揚げた」は "fried" です。fry の過去形。boil はゆでる、freeze は凍らせる、melt は溶かす。');

-- (35) pull / 引く
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'A: The door won''t open. B: Try to __BLANK__ it. This door says "Pull" on it.', '["push", "pull", "press", "throw"]', 1, '"引いて開ける」は "pull the door" です。pull は「引く」。push は押す、press は押す・押し付ける。');

-- (36) burying / 埋める
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The children were __BLANK__ their brother in the sand at the beach. Everyone was laughing.', '["burying", "carrying", "washing", "covering"]', 0, '砂で「埋めている」は "burying 〜 in the sand" です。bury は「埋める」。');

-- (37) refreshing / さわやかな
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The water in the pool was cool and __BLANK__. We swam there for hours.', '["refreshing", "frightening", "surprising", "exciting"]', 0, '"涼しくてさわやか」は "cool and refreshing" です。refreshing は「さわやかな、気分がよくなる」。');

-- (38) respect / 尊敬する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Many people __BLANK__ doctors because they work hard to save lives.', '["respect", "refuse", "resist", "rescue"]', 0, '"医者を尊敬する」は "respect doctors" です。respect は「尊敬する、尊重する」。');

-- (39) smoothly / スムーズに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The meeting went __BLANK__ yesterday. We finished all the topics in just one hour.', '["smoothly", "suddenly", "nearly", "hardly"]', 0, '"会議がスムーズに進んだ」は "went smoothly" です。smoothly は「スムーズに、円滑に」という副詞。');

-- (40) rate / 評価する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Jenna wanted to buy a new smartphone, so she went to several stores to __BLANK__ the different models. She compared their prices and features.', '["order", "catch", "hide", "rate"]', 3, '"機種を評価する、比べる」は "rate the different models" です。rate は「評価する、格付けする」。');

-- (41) dry / 乾かす
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'A: It''s really sunny today. Let''s hang our towels outside to __BLANK__. B: Good idea. We''ll have clean towels to use after our swim.', '["heal", "chase", "dry", "accept"]', 2, '"タオルを乾かす」は "hang 〜 to dry" です。dry は「乾く、乾かす」という動詞。');

-- (42) as a result / その結果
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'It rained every day during our vacation. __BLANK__, we could not go to the beach at all.', '["As a result", "For example", "In fact", "At first"]', 0, '"その結果」は "As a result" です。前の文の結果を述べるときに使います。');

-- (43) at least / 少なくとも
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'You should sleep __BLANK__ seven hours a night. Your body needs rest to stay healthy.', '["at least", "at once", "at last", "at present"]', 0, '"少なくとも7時間」は "at least seven hours" です。at least で「少なくとも」。');

-- (44) as soon as possible / できるだけ早く
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Please reply to this email __BLANK__. The deadline is next Monday.', '["as soon as possible", "as well as", "as usual", "as follows"]', 0, '"できるだけ早く返信して」は "reply as soon as possible" です。as soon as possible で「できるだけ早く」。');

-- (45) all of a sudden / 突然
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', '__BLANK__, the lights went out. We had to use candles for the rest of the evening.', '["All of a sudden", "Once upon a time", "From time to time", "On the other hand"]', 0, '"突然明かりが消えた」は "All of a sudden, the lights went out" です。all of a sudden で「突然」。');

-- (46) along with / 〜と一緒に
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'I received a letter __BLANK__ a small gift from my pen pal in Australia.', '["along with", "instead of", "because of", "in spite of"]', 0, '"手紙と一緒に小さな贈り物も」は "a letter along with a small gift" です。along with で「〜と一緒に」。');

-- (47) be absorbed in / 〜に熱中する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'My brother was so __BLANK__ in his video game that he didn''t hear me call him for dinner.', '["absorbed", "interested", "involved", "engaged"]', 0, '"ゲームに夢中で」は "was absorbed in" です。be absorbed in 〜 で「〜に熱中する、夢中になる」。');

-- (48) purpose / 目的
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The main __BLANK__ of this meeting is to discuss the new project. Please read the documents before you come.', '["purpose", "profit", "pattern", "process"]', 0, '"この会議の主な目的」は "the main purpose of" です。purpose は「目的」。profit は利益、process は過程。');

-- (49) experience / 経験
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Working at the hospital was a valuable __BLANK__ for me. I learned a lot about caring for patients.', '["experience", "experiment", "example", "excuse"]', 0, '"貴重な経験」は "a valuable experience" です。experience は「経験」。experiment は実験。');

-- (50) avoid / 避ける
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'To stay healthy, you should __BLANK__ eating too much junk food. Try to eat more vegetables.', '["avoid", "allow", "agree", "afford"]', 0, '"ジャンクフードの食べすぎを避ける」は "avoid eating too much" です。avoid は「避ける」で、後ろは 〜ing。');

-- (51) consider / 考える
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'We need to __BLANK__ several options before we decide where to go for our trip.', '["consider", "complete", "connect", "contain"]', 0, '"いくつかの選択肢を考える」は "consider options" です。consider は「よく考える、検討する」。');

-- (52) mention / 言及する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Did the teacher __BLANK__ the test date? I wasn''t in class last week.', '["mention", "manage", "measure", "memorize"]', 0, '"試験の日付に言及したか」は "mention the test date" です。mention は「言及する、話に出す」。');

-- (53) provide / 提供する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The hotel __BLANK__s free breakfast for all guests. You can eat from 7 to 10 in the dining room.', '["provides", "proves", "promises", "protects"]', 0, '"無料の朝食を提供する」は "provide free breakfast" です。provide は「提供する、供給する」。');

-- (54) require / 必要とする
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'This job __BLANK__s good communication skills. You will work with many people every day.', '["requires", "reduces", "refuses", "removes"]', 0, '"良いコミュニケーション能力を必要とする」は "requires 〜" です。require は「必要とする、求める」。');

-- (55) spread / 広がる
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The news of the victory __BLANK__ quickly through the town. Everyone was celebrating.', '["spread", "spent", "split", "spoke"]', 0, '"ニュースが町中に素早く広がった」は "the news spread quickly" です。spread は「広がる、広める」の過去形も spread。');

-- (56) suggest / 提案する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'I __BLANK__ that we leave early tomorrow. The traffic is usually bad in the morning.', '["suggest", "supply", "support", "suppose"]', 0, '"早く出発することを提案する」は "suggest that 節" です。suggest は「提案する」で、that 節では動詞は原形または should。');

-- (57) treat / 扱う
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'We should __BLANK__ everyone with respect. It doesn''t matter who they are.', '["treat", "trade", "train", "trust"]', 0, '"みんなを敬意をもって扱う」は "treat everyone with respect" です。treat は「扱う、待遇する」。');

-- (58) various / 様々な
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The store sells __BLANK__ kinds of bread. You can find something for everyone.', '["various", "valuable", "visible", "vital"]', 0, '"様々な種類のパン」は "various kinds of" です。various は「様々な、いろいろな」。');

-- (59) waste / 無駄にする
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Don''t __BLANK__ water. Turn off the tap when you are brushing your teeth.', '["waste", "watch", "warn", "wave"]', 0, '"水を無駄にしないで」は "Don''t waste water" です。waste は「無駄にする、浪費する」。');

-- (60) effort / 努力
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'It took a lot of __BLANK__ to finish the project on time. The team worked day and night.', '["effort", "effect", "event", "example"]', 0, '"たくさんの努力」は "a lot of effort" です。effort は「努力、尽力」。effect は効果、event は出来事。');

-- (61) decision / 決定
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Making the __BLANK__ to move to a new city was difficult. I had to leave my friends behind.', '["decision", "description", "direction", "discussion"]', 0, '"引っ越すという決定をする」は "make the decision to 〜" です。decision は「決定、決断」。');

-- (62) condition / 状態
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The old book was in poor __BLANK__. Many pages were torn or missing.', '["condition", "conversation", "conclusion", "connection"]', 0, '"状態が悪い」は "in poor condition" です。condition は「状態、調子」。');

-- (63) audience / 聴衆
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The __BLANK__ clapped loudly when the concert ended. Everyone had enjoyed the performance.', '["audience", "article", "amount", "animal"]', 0, '"聴衆が大声で拍手した」は "The audience clapped" です。audience は「聴衆、観客」で集合名詞。');

-- (64) behavior / 行動
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Your __BLANK__ in class has improved a lot this year. The teacher is very pleased.', '["behavior", "building", "business", "balance"]', 0, '"授業での行動がずっと良くなった」は "Your behavior has improved" です。behavior は「行動、態度」。');

-- (65) choice / 選択
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'You have the __BLANK__ of taking the bus or the train. Both will get you there in about an hour.', '["choice", "chance", "change", "charge"]', 0, '"バスか電車かを選べる」は "have the choice of 〜" です。choice は「選択、選択肢」。');

-- (66) community / 地域社会
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Our __BLANK__ is very friendly. People often help each other when someone has a problem.', '["community", "company", "country", "culture"]', 0, '"私たちの地域社会はとても友好的」は "Our community is friendly" です。community は「地域社会、共同体」。');

-- (67) difficulty / 困難
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'She had great __BLANK__ understanding the accent at first, but she got used to it after a few weeks.', '["difficulty", "difference", "distance", "direction"]', 0, '"理解するのに大きな困難があった」は "had difficulty 〜ing" です。have difficulty 〜ing で「〜するのに苦労する」。');

-- (68) evidence / 証拠
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The police found __BLANK__ that the man was at the scene. His fingerprints were on the door.', '["evidence", "example", "excuse", "experience"]', 0, '"その男が現場にいた証拠」は "evidence that 〜" です。evidence は「証拠」で不可算名詞。');

-- (69) habit / 習慣
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Reading before bed has become a __BLANK__ for me. It helps me relax and sleep well.', '["habit", "hobby", "hope", "honor"]', 0, '"寝る前に読むことが習慣になった」は "has become a habit" です。habit は「習慣」。');

-- (70) knowledge / 知識
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'She has a lot of __BLANK__ about Japanese history. She studied it at university.', '["knowledge", "kindness", "keyboard", "kitchen"]', 0, '"日本史についてたくさんの知識」は "a lot of knowledge about" です。knowledge は「知識」で不可算。');

-- (71) method / 方法
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'This __BLANK__ of learning vocabulary is very effective. Try writing each word five times.', '["method", "moment", "market", "message"]', 0, '"この語彙学習の方法」は "This method of 〜" です。method は「方法、やり方」。');

-- (72) opportunity / 機会
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Studying abroad gave me the __BLANK__ to improve my English and make friends from other countries.', '["opportunity", "opinion", "operation", "option"]', 0, '"英語を上達させ、友達を作る機会」は "the opportunity to 〜" です。opportunity は「機会」。');

-- (73) permission / 許可
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'You need your parents'' __BLANK__ to go on the school trip. Please have them sign this form.', '["permission", "position", "population", "production"]', 0, '"保護者の許可」は "your parents'' permission" です。permission は「許可」。');

-- (74) progress / 進歩
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Your __BLANK__ in math has been excellent this term. Keep up the good work!', '["progress", "problem", "project", "program"]', 0, '"数学の進歩」は "Your progress in math" です。progress は「進歩、進展」で不可算。');

-- (75) reason / 理由
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The __BLANK__ why I was late is that my train was delayed. I''m really sorry.', '["reason", "result", "review", "reward"]', 0, '"遅れた理由」は "The reason why 〜" です。reason は「理由」。the reason is that 〜 で「理由は〜です」。');

-- (76) solution / 解決策
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'We need to find a __BLANK__ to this problem before the meeting next week.', '["solution", "situation", "success", "subject"]', 0, '"この問題の解決策」は "a solution to the problem" です。solution は「解決策、答え」。');

-- (77) task / 任務
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Completing this __BLANK__ will take about two hours. Make sure you have enough time.', '["task", "test", "topic", "trouble"]', 0, '"この任務を完了する」は "Completing this task" です。task は「任務、仕事、課題」。');

-- (78) truth / 真実
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'I want to know the __BLANK__. Please tell me what really happened that night.', '["truth", "trick", "trade", "train"]', 0, '"真実を知りたい」は "know the truth" です。truth は「真実」。tell the truth で「本当のことを言う」。');

-- (79) by the way / ところで
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'A: I''ll see you at the party on Saturday. B: Yes. __BLANK__, did you hear that Mike is moving to Tokyo?', '["By the way", "On the way", "In the way", "In a way"]', 0, '話題を変える「ところで」は "By the way" です。on the way は途中で、in the way は邪魔で。');

-- (80) in order to / 〜するために
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'We left home early __BLANK__ catch the first train. We didn''t want to be late.', '["in order to", "so as", "such as", "as well as"]', 0, '"始発に乗るために」は "in order to catch" です。in order to 〜 で「〜するために」。');

-- (81) even though / 〜にもかかわらず
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', '__BLANK__ it was raining, we decided to go for a walk. We had our umbrellas with us.', '["Even though", "As if", "So that", "Now that"]', 0, '"雨が降っていたにもかかわらず」は "Even though it was raining" です。even though は「〜にもかかわらず」。');

-- (82) no matter how / どんなに〜でも
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', '__BLANK__ hard I try, I can''t solve this math problem. Could you help me?', '["No matter how", "No longer", "No doubt", "No wonder"]', 0, '"どんなに頑張っても」は "No matter how hard I try" です。no matter how 〜 で「どんなに〜でも」。');

-- (83) run out of / 〜を使い切る
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'We __BLANK__ milk this morning. Could you buy some on your way home?', '["ran out of", "ran into", "ran after", "ran over"]', 0, '"牛乳を使い切った」は "ran out of milk" です。run out of 〜 で「〜を使い切る」。');

-- (84) look forward to / 〜を楽しみにしている
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'I''m __BLANK__ hearing from you. Please write back soon.', '["looking forward to", "looking for", "looking after", "looking at"]', 0, '"返事を楽しみにしている」は "looking forward to 〜ing" です。look forward to は「〜を楽しみにしている」で to の後は 〜ing。');

-- (85) give up / あきらめる
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Don''t __BLANK__! You are almost at the top of the mountain. Just a little more!', '["give up", "give in", "give out", "give away"]', 0, '"あきらめるな」は "Don''t give up!" です。give up で「あきらめる」。');

-- (86) carry out / 実行する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The team __BLANK__ the plan successfully. Everything went as we had hoped.', '["carried out", "carried on", "carried away", "carried off"]', 0, '"計画を実行した」は "carried out the plan" です。carry out で「実行する、やり遂げる」。');

-- (87) find out / 調べて分かる
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'I want to __BLANK__ what time the movie starts. Let me check the website.', '["find out", "figure out", "fill out", "work out"]', 0, '"映画が何時に始まるか調べる」は "find out what time 〜" です。find out で「調べて分かる、知る」。');

-- (88) deal with / 対処する
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'We need to __BLANK__ this problem as soon as possible. It is affecting many people.', '["deal with", "do with", "agree with", "meet with"]', 0, '"この問題に対処する」は "deal with this problem" です。deal with で「対処する、扱う」。');

-- (89) depend on / 〜に頼る
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'You can __BLANK__ me. I will help you whenever you need it.', '["depend on", "decide on", "look on", "take on"]', 0, '"私に頼っていい」は "You can depend on me" です。depend on 〜 で「〜に頼る、〜次第である」。');

-- (90) get along with / 〜と仲良くする
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'She __BLANK__ well with her new classmates. They all like her.', '["gets along with", "gets away with", "gets through", "gets over"]', 0, '"新しいクラスメートと仲良くやっている」は "gets along well with" です。get along with 〜 で「〜と仲がいい」。');

-- (91) every now and then / 時々
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'I don''t see him often, but we meet __BLANK__ for coffee. Maybe once every few months.', '["every now and then", "now and then", "once and for all", "over and over"]', 0, '"時々会う」は "meet every now and then" または "now and then" です。every now and then で「時々」。');

-- (92) on purpose / わざと
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'I didn''t break the vase __BLANK__. It was an accident. I''m really sorry.', '["on purpose", "by accident", "in advance", "at once"]', 0, '"わざと壊したのではない」は "didn''t break 〜 on purpose" です。on purpose で「わざと、意図的に」。');

-- (93) in charge of / 〜を担当して
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Who is __BLANK__ the project? I need to ask someone about the schedule.', '["in charge of", "in favor of", "in front of", "in need of"]', 0, '"このプロジェクトを担当しているのは誰」は "Who is in charge of 〜" です。in charge of で「〜を担当して」。');

-- (94) take care of / 〜の世話をする
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Could you __BLANK__ my dog while I''m on vacation? I''ll be back next Monday.', '["take care of", "take part in", "take place", "take turns"]', 0, '"留守の間犬の世話をして」は "take care of my dog" です。take care of 〜 で「〜の世話をする、面倒を見る」。');

-- (95) instead of / 〜の代わりに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'Let''s walk __BLANK__ taking the bus. It''s only a ten-minute walk and the weather is nice.', '["instead of", "because of", "in spite of", "as a result of"]', 0, '"バスに乗る代わりに歩こう」は "walk instead of taking" です。instead of 〜 で「〜の代わりに」。');

-- (96) as well as / 〜もまた
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'She speaks French __BLANK__ English. She lived in Paris for three years.', '["as well as", "as soon as", "as long as", "as far as"]', 0, '"英語だけでなくフランス語も話す」は "speaks French as well as English" です。as well as で「〜もまた、〜と同様に」。');

-- (97) due to / 〜が原因で
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'The flight was delayed __BLANK__ bad weather. We had to wait at the airport for five hours.', '["due to", "according to", "thanks to", "next to"]', 0, '"悪天候のため」は "due to bad weather" です。due to 〜 で「〜が原因で、〜のせいで」。');

-- (98) in spite of / 〜にもかかわらず
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', '__BLANK__ the rain, the game was not canceled. The players were happy to continue.', '["In spite of", "Because of", "Instead of", "In case of"]', 0, '"雨にもかかわらず試合は中止されなかった」は "In spite of the rain" です。in spite of 〜 で「〜にもかかわらず」。');

-- (99) as far as / 〜する限り
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', '__BLANK__ I know, the meeting is still scheduled for tomorrow. I haven''t heard any changes.', '["As far as", "As long as", "As soon as", "As well as"]', 0, '"私の知る限り」は "As far as I know" です。as far as 〜 で「〜する限りでは」。');

-- (100) by heart / 暗記して
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級', 'short_fill', 'She knows the poem __BLANK__. She can recite it without looking at the book.', '["by heart", "by chance", "by mistake", "by hand"]', 0, '"その詩を暗記している」は "knows 〜 by heart" です。by heart で「暗記して、そらで」。');
