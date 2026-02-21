-- seed_reading_short_2kyu_100.sql
-- 英検2級 短文の語句空所補充 100問
-- 出題傾向: 単語約50%・熟語約35%・文法約15%（大問1のレベル感に準拠）
-- 実行: マイグレーション 028, 030 適用後、本ファイルを実行

-- ========== 単語問題（1〜50） ==========

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'When King Otto died, his son was still too young to __BLANK__ the kingdom. King Otto''s brother looked after the country until the young prince was old enough to rule.', '["overlap", "govern", "forgive", "arrest"]', 1, '「王国を治める」は govern the kingdom です。govern は「統治する、治める」。overlap は重なる、forgive は許す、arrest は逮捕する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The IT company has greatly __BLANK__ since it opened five years ago. It now has offices in over 30 cities.', '["suffered", "reflected", "expanded", "influenced"]', 2, '「大きく拡大した」は has expanded です。expand は「拡大する、広がる」。suffer は苦しむ、reflect は反映する、influence は影響する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Because Westbrook Junior High School''s softball team won the state championship, they have __BLANK__ for next month''s national finals.', '["robbed", "qualified", "weighed", "disappeared"]', 1, '「全国大会への出場権を得た」は have qualified です。qualify は「資格を得る、出場権を得る」。rob は奪う、weigh は重さを量る、disappear は消える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'After working as a taxi driver for more than 10 years, Sue has decided to try a new __BLANK__. She is now training to become a nurse.', '["device", "complaint", "occupation", "proverb"]', 2, '「新しい職業」は a new occupation です。occupation は「職業、仕事」。device は装置、complaint は苦情、proverb はことわざ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Matthew''s story __BLANK__ his friends'' attention completely. They hardly noticed how much time had passed while he was telling it.', '["accepted", "flattened", "gripped", "promised"]', 2, '「話が聞き手の注意を強く捉えた」は gripped 〜 attention です。grip は「しっかり掴む、引きつける」。accept は受け入れる、flatten は平らにする、promise は約束する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The __BLANK__ of ancient Greece made many great discoveries in science, politics, and art. These discoveries changed the way that people think and live.', '["civilization", "disappointment", "proportion", "advertisement"]', 0, '「古代ギリシャの文明」は the civilization of ancient Greece です。civilization は「文明」。disappointment は失望、proportion は割合、advertisement は広告。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The hard, wooden bench in the park was __BLANK__, so Anna and Cathy decided to sit on the grass.', '["permanent", "amusing", "complicated", "uncomfortable"]', 3, '「座り心地が悪い」は was uncomfortable です。uncomfortable は「不快な、居心地の悪い」。permanent は永続的な、amusing はおかしい、complicated は複雑な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The people in the car crash could have been __BLANK__ hurt. Luckily, their injuries were not serious.', '["severely", "fluently", "currently", "anxiously"]', 0, '「ひどくけがをしていた可能性がある」は could have been severely hurt です。severely は「ひどく、厳しく」。fluently は流暢に、currently は現在、anxiously は心配して。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The sofa was too heavy to carry, so Bill had to __BLANK__ it across the floor to move it to the other side of his living room.', '["drag", "wipe", "greet", "row"]', 0, '「床を引きずって運んだ」は had to drag it です。drag は「引きずる、引っ張る」。wipe は拭く、greet は挨拶する、row は漕ぐ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Haruka wanted to enter a popular university, so she __BLANK__ all her attention to studying for the entrance exam.', '["specified", "advertised", "reminded", "devoted"]', 3, '「勉強に全力を注いだ」は devoted all her attention to 〜 です。devote 〜 to で「〜を…に捧げる」。specify は特定する、advertise は宣伝する、remind は思い出させる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'At the gym, Hugh did exercises to increase the strength of his __BLANK__ body. After a few months, people began to comment on his big chest muscles.', '["major", "upper", "direct", "elastic"]', 1, '「上半身」は upper body です。upper は「上の、上部の」。major は主要な、direct は直接の、elastic は弾力のある。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Cindy had excellent views of the ocean and nearby islands as she stood at the edge of a tall __BLANK__. Looking down, she could see waves crashing on the rocks far below.', '["troop", "proverb", "cliff", "duty"]', 2, '「高い崖の端」は the edge of a tall cliff です。cliff は「崖」。troop は部隊、proverb はことわざ、duty は義務。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: How did your husband __BLANK__ when you told him about the baby? B: He was really happy. He says that he can''t wait to become a dad.', '["exist", "react", "seize", "disappear"]', 1, '「どんな反応をしたか」は how did he react です。react は「反応する」。exist は存在する、seize は掴む、disappear は消える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: What do you want to be when you grow up, Amy? B: I''m not sure, but I think I''d like to be a __BLANK__. I want to learn about the meaning of life.', '["president", "spectator", "philosopher", "conductor"]', 2, '「哲学者になりたい」は be a philosopher です。philosopher は「哲学者」。president は大統領、spectator は観客、conductor は指揮者・車掌。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: What did you do when you realized you had lost your passport? B: I started to __BLANK__, but then I remembered that I had put it in my suitcase.', '["interact", "panic", "fly", "swim"]', 1, '「パニックになりかけた」は started to panic です。panic は「パニックになる、取り乱す」。interact は交流する、fly は飛ぶ、swim は泳ぐ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The politician''s view on education was __BLANK__ through his whole career. He never changed his opinion that teachers should be paid more.', '["massive", "internal", "consistent", "recent"]', 2, '「一貫していた」は was consistent です。consistent は「一貫した、矛盾しない」。massive は巨大な、internal は内部の、recent は最近の。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: How was your math test today, James? B: I did __BLANK__ well. I wasn''t expecting to pass, but I ended up getting 82 percent.', '["necessarily", "surprisingly", "continuously", "faithfully"]', 1, '「意外なほどよくできた」は did surprisingly well です。surprisingly は「意外に、驚くほど」。necessarily は必ずしも、continuously は継続的に、faithfully は忠実に。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Susie wanted to make a salad, so she chopped up some tomatoes, onions, and avocadoes together. Then, she put the __BLANK__ in a bowl and added some spices.', '["surgery", "pollution", "resort", "mixture"]', 3, '「混ぜたものを」は the mixture です。mixture は「混ぜたもの、混合物」。surgery は手術、pollution は汚染、resort はリゾート。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Sports referees and umpires must have excellent __BLANK__. They have to be able to make accurate decisions in just a few seconds, often under great pressure.', '["laughter", "climate", "illness", "judgment"]', 3, '「優れた判断力」は excellent judgment です。judgment は「判断、判断力」。laughter は笑い、climate は気候、illness は病気。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: What type of government does our country have? B: Well, we live in a __BLANK__, so we can vote for the people we want to represent us.', '["tragedy", "democracy", "mystery", "philosophy"]', 1, '「民主主義国家」は a democracy です。democracy は「民主主義」。tragedy は悲劇、mystery は謎、philosophy は哲学。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Gary __BLANK__ that his message was a joke by putting a laughing face symbol at the end of it.', '["deceived", "sacrificed", "composed", "indicated"]', 3, '「冗談だと示した」は indicated that 〜 です。indicate は「示す、指し示す」。deceive はだます、sacrifice は犠牲にする、compose は作曲する・構成する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: I''m sorry for being late. B: You don''t have to __BLANK__. It''s not your fault that your train wasn''t on time.', '["apologize", "supply", "determine", "instruct"]', 0, '「謝らなくていい」は don''t have to apologize です。apologize は「謝る」。supply は供給する、determine は決定する、instruct は指示する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Do you get nervous before giving a speech in front of the class? B: Yes, I always feel a little __BLANK__. But I try to stay calm and speak clearly.', '["inheritance", "exception", "anxiety", "confidence"]', 2, '「少し不安になる」は feel a little anxiety です。anxiety は「不安、心配」。inheritance は相続、exception は例外、confidence は自信。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Why are you going to Canada, Sarah? B: I''m going to work for an organization that helps children. I''m going to help people who are in need and try to improve their __BLANK__.', '["balance", "welfare", "reputation", "genius"]', 1, '「生活や福祉を改善する」は improve their welfare です。welfare は「福祉、幸福」。balance はバランス、reputation は評判、genius は天才。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The __BLANK__ that make rabbits different from other animals are that they have long ears and short tails.', '["contributions", "characteristics", "investigations", "exhibitions"]', 1, '「ウサギを他と区別する特徴」は the characteristics that 〜 です。characteristic は「特徴、特性」。contribution は貢献、investigation は調査、exhibition は展覧会。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Did you see the new version of my article for the sports section, Mr. Jones? B: Yes, but it''s __BLANK__ than the first version. Please write it once again.', '["much safer", "no better", "far healthier", "still further"]', 1, '「最初の版より良くない」は no better than です。no better than で「〜と同程度で良くない、改良されていない」という評価。依頼の「もう一度書いて」と一致する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The farmer took his apples to the market on Sunday, but because his prices were too high, __BLANK__ of them could be sold.', '["some hardly", "only a little", "only a few", "some seldom"]', 2, '「ほとんど売れなかった」は only a few of them です。apples は可算なので a few。only a little は不可算名詞用。hardly / seldom は副詞でこの語順では不自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Bill is a university student. He has a part-time job, but he still __BLANK__ his parents for most of his money.', '["covers up", "relies on", "does with", "approves of"]', 1, '「まだ親に頼っている」は relies on his parents です。rely on で「〜に頼る、依存する」。cover up は隠す、approve of は賛成する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: I hear you had a chance to study in Canada, but you didn''t go. B: Yes, I turned it down, __BLANK__. It was a big mistake.', '["at my service", "in my heart", "in my way", "to my regret"]', 3, '「残念なことに断ってしまった」は to my regret です。to one''s regret で「残念なことに」。at my service はお役に立てて、in my way は邪魔で。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'In order to go on a trip to Europe next year, John is trying to __BLANK__ enough money. He is only eating out on weekends to cut down on spending.', '["bring on", "pass for", "save up", "hand over"]', 2, '「お金を貯めようとしている」は save up enough money です。save up で「貯金する」。bring on は引き起こす、pass for は〜に見える、hand over は引き渡す。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'What do you think of Alice''s Spanish? B: It''s very good. She''ll be able to live and work in Spain without any problems. She really __BLANK__ it.', '["takes a good look at", "pays a good price for", "has a good command of", "gives a good reason of"]', 2, '「スペイン語をよく使いこなしている」は has a good command of です。have a good command of 〜 で「〜を上手に使いこなす」。take a look at は見る、pay a price for は代償を払う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: How is the novel you are reading? B: It''s good, but __BLANK__ it is hard to understand. The author uses very complex language.', '["with ease", "on board", "in turn", "at times"]', 3, '「時々理解しづらい」は at times it is hard to understand です。at times で「時々、ときには」。with ease は容易に、on board は乗り込んで、in turn は順番に。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Do we have to pay to see the butterfly garden at the zoo? B: No. It''s __BLANK__. You can visit it whenever you want.', '["out of breath", "against its will", "easy to use", "free of charge"]', 3, '「無料です」は It''s free of charge です。free of charge で「無料で」。out of breath は息切れして、against one''s will は意に反して、easy to use は使いやすい。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'There are __BLANK__ good reasons for studying a foreign language, such as meeting new people and finding a job in another country.', '["the other of", "the most of", "a kind of", "a number of"]', 3, '「多くの良い理由がある」は a number of good reasons です。a number of で「多くの、いくつかの」＋複数名詞。the other of / the most of はこの形では不可。a kind of は一種の。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The security alarm in the hotel __BLANK__ in the middle of the night, so all the guests and workers had to leave quickly.', '["dropped by", "came down", "passed on", "went off"]', 3, '「警報が鳴った」は the alarm went off です。go off で「（警報・時計が）鳴る」。drop by は立ち寄る、come down は降りる・落ちる、pass on は伝える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'After graduating from college, Rachel got a job in a bookstore. She wants to work there __BLANK__, but she hopes to find a job in marketing in the future.', '["in the old days", "for the time being", "up in the air", "at the same time"]', 1, '「当分の間そこで働きたい」は for the time being です。for the time being で「当分の間、しばらく」。in the old days は昔、up in the air は未定で、at the same time は同時に。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The two cars looked __BLANK__ each other, but one cost three times as much as the other. The expensive one had far superior performance.', '["jealous of", "confident of", "limited to", "identical to"]', 3, '「見た目は互いに同じだった」は looked identical to each other です。identical to で「〜と同一の、同じ」。jealous of は嫉妬して、confident of は自信を持って、limited to は〜に限定されて。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The teacher advised Emma to review her notes __BLANK__ relying only on the textbook. He said it would help her understand the material better and prepare well for the test.', '["because of", "provided that", "rather than", "even though"]', 2, '「教科書だけに頼るよりノートを復習するように」は rather than relying 〜 です。rather than で「〜ではなく、〜よりむしろ」。because of は〜が原因で、provided that は〜という条件で、even though は〜にもかかわらず。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: What do those birds __BLANK__? B: They seem to eat insects. Look, there''s one catching a fly in its beak.', '["turn in", "cut off", "feed on", "hang on"]', 2, '「何を食べるか」は what do they feed on です。feed on で「〜を餌にする、〜を食べる」。turn in は提出する、cut off は切り離す、hang on はしがみつく・待つ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: How did you get such a good score on the French test? B: I __BLANK__ to study all the vocabulary every night before I go to sleep.', '["shake hands", "give way", "take pains", "make sense"]', 2, '「苦労して毎晩単語を覚えた」は take pains to 〜 です。take pains to do で「〜するのに骨を折る、努める」。shake hands は握手する、give way は譲る、make sense は意味をなす。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The two brothers were __BLANK__ the same size when they were children, but now, one of them is much bigger than the other.', '["more or less", "sooner or later", "day and night", "before and after"]', 0, '「ほぼ同じ大きさだった」は were more or less the same size です。more or less で「多かれ少なかれ、ほぼ」。sooner or later はいつか、day and night は昼夜、before and after は前後。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'After Samantha and Mark took an expensive vacation, they could barely __BLANK__ the money they had left. They couldn''t afford to eat at restaurants or buy new clothes.', '["show off", "put away", "live on", "consist of"]', 2, '「残りのお金でなんとか暮らした」は could barely live on the money です。live on 〜 で「〜で暮らす、〜を糧にする」。show off は見せびらかす、put away はしまう、consist of は〜から成る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Did your cat come home? B: Yes, he did. He came home at 3 a.m. He looked a little dirty, but otherwise he was __BLANK__.', '["bit by bit", "far and away", "all or nothing", "safe and sound"]', 3, '「無事だった」は was safe and sound です。safe and sound で「無事に、怪我なく」。bit by bit は少しずつ、far and away は断然、all or nothing は全部か無か。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Clara went to the bookstore __BLANK__ a novel by an author she had heard about. She wanted to buy a copy to read that evening.', '["in search of", "for fear of", "on behalf of", "with regard to"]', 0, '「その小説を探しに」は in search of a novel です。in search of で「〜を求めて、〜を探して」。for fear of は〜を恐れて、on behalf of は〜に代わって、with regard to は〜について。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: What are you planning to do this afternoon? B: I think I''ll __BLANK__. I didn''t sleep well last night, so I''m feeling pretty tired.', '["make a move", "take a nap", "make a wish", "take a chance"]', 1, '「昼寝する」は take a nap です。take a nap で「昼寝する」。make a move は動き出す、make a wish は願い事をする、take a chance は賭けに出る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Do you think many people will come to the company Christmas party? B: __BLANK__ I know, most people are planning to attend.', '["As fast as", "As far as", "As long as", "As well as"]', 1, '「私の知る限り」は As far as I know です。as far as I know で「私の知る限りでは」。as fast as は〜と同じ速さで、as long as は〜する限り、as well as は〜と同様に。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: How is your new job? B: There''s much to learn. My boss will __BLANK__ my progress next month.', '["recover", "review", "expand", "suspect"]', 1, '「来月わたしの進捗を確認する」は will review my progress です。review は「検討する、見直す、確認する」。recover は回復する、expand は拡大する、suspect は疑う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Neil stopped to __BLANK__ his shoelaces in the middle of the sidewalk. They had come undone while he was walking.', '["tie", "earn", "hire", "pour"]', 0, '「靴ひもを結ぶために止まった」は stopped to tie his shoelaces です。tie は「結ぶ」。earn は稼ぐ、hire は雇う、pour は注ぐ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Why do people support a soccer team that hasn''t won a championship in twenty years? B: Because the fans have a lot of __BLANK__ to the team.', '["fortune", "distinction", "loyalty", "suspicion"]', 2, '「チームへの忠誠心」は have a lot of loyalty to です。loyalty は「忠誠、忠実」。fortune は富・運、distinction は区別・卓越、suspicion は疑い。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Arguments often result from people''s __BLANK__ of each other''s ways, so it is important for everyone to try to understand the people around them.', '["wealth", "rage", "ignorance", "poverty"]', 2, '「互いのやり方への無理解」は people''s ignorance of です。ignorance は「無知、知らないこと」。wealth は富、rage は激怒、poverty は貧困。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Wasn''t it scary when you got lost in the mountains? B: Yes, it was. But __BLANK__, I found a stream and followed it down to the road.', '["innocently", "thankfully", "traditionally", "resentfully"]', 1, '「幸いなことに」は Thankfully です。thankfully で「ありがたいことに、幸い」。innocently は無邪気に、traditionally は伝統的に、resentfully は憤って。');

-- ========== 単語・熟語・文法 続き（51〜100） ==========

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The new policy will __BLANK__ all employees who work more than 30 hours a week. Both full-time and part-time staff are included.', '["affect", "effect", "afford", "effort"]', 0, '「影響する」は affect です。affect は動詞で「影響する」。effect は名詞で「効果」、afford は〜する余裕がある、effort は努力。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Scientists have __BLANK__ a new species of butterfly in the rainforest. It has unique blue and green wings.', '["discovered", "discussed", "disposed", "distracted"]', 0, '「新種を発見した」は have discovered です。discover は「発見する」。discuss は議論する、dispose は処分する、distract は気を散らす。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The __BLANK__ of the storm caused serious damage to the coastal area. Many houses lost their roofs.', '["violence", "vigor", "virtue", "vision"]', 0, '「嵐の激しさ」は the violence of the storm です。violence は「激しさ、暴力」。vigor は活力、virtue は美徳、vision は視覚・ビジョン。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Why did you leave the party so early? B: I had to __BLANK__ an important email before midnight. My boss was waiting for my report.', '["respond to", "result in", "refer to", "remind of"]', 0, '「重要なメールに返信しなければならなかった」は respond to an email です。respond to で「〜に返答する」。result in は〜という結果になる、refer to は言及する、remind of は思い出させる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The museum is closed __BLANK__ Mondays. If you want to visit, please come on another day.', '["beside", "beyond", "between", "except"]', 3, '「月曜日は休み」は closed except Mondays または except on Mondays。ここでは「月曜を除いて」の意味で except。beside は〜のそばに、beyond は〜を超えて、between は〜の間。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Emma decided to __BLANK__ her trip to Paris until next year. She needed to save more money first.', '["put off", "put on", "put out", "put up"]', 0, '「旅行を延期した」は put off her trip です。put off で「延期する」。put on は着る・始める、put out は消す、put up は掲げる・泊める。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The company will __BLANK__ a new product next month. They have been working on it for two years.', '["launch", "laugh", "limit", "locate"]', 0, '「新製品を発売する」は launch a new product です。launch は「発売する、打ち上げる」。laugh は笑う、limit は制限する、locate は位置を特定する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'David has a strong __BLANK__ to help people in need. That is why he became a doctor.', '["motivation", "motion", "mixture", "method"]', 0, '「人を助けたい強い動機」は a strong motivation to 〜 です。motivation は「動機、やる気」。motion は動き、mixture は混合物、method は方法。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The government has __BLANK__ new rules to reduce air pollution. Factories must now use cleaner technology.', '["issued", "ignored", "improved", "inspired"]', 0, '「新規則を公布した」は has issued new rules です。issue は「公布する、発行する」。ignore は無視する、improve は改善する、inspire は鼓舞する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Do you think we should tell Mom about the broken window? B: We have no __BLANK__. She will notice it when she gets home.', '["choice", "chance", "change", "charge"]', 0, '「他に選択肢がない」は We have no choice です。have no choice で「選択の余地がない」。chance は機会、change は変化、charge は料金・ charge で告発する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The research __BLANK__ that children who read every day tend to do better at school. Parents should encourage reading at home.', '["indicates", "interrupts", "invites", "involves"]', 0, '「研究は〜を示している」は The research indicates that 〜 です。indicate は「示す、指し示す」。interrupt は邪魔する、invite は招待する、involve は巻き込む・含む。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Sarah __BLANK__ her keys in the restaurant. She had to go back to get them.', '["left", "lost", "lent", "laid"]', 0, '「鍵を置き忘れた」は left her keys です。leave は「置いていく、残す」。lost はなくした、lent は貸した、laid は置いた（lay の過去形）。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The manager asked the team to __BLANK__ the problem before the meeting. He wanted to hear their ideas.', '["look into", "look after", "look for", "look at"]', 0, '「問題を調査してほしい」は look into the problem です。look into で「調査する」。look after は世話する、look for は探す、look at は見る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'It took a long time to __BLANK__ the two sides. They finally agreed on a peace treaty.', '["reconcile", "recognize", "recommend", "record"]', 0, '「両者を和解させる」は reconcile the two sides です。reconcile は「和解させる、調和させる」。recognize は認める、recommend は勧める、record は記録する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The __BLANK__ of the project is next Friday. We need to finish the report by then.', '["deadline", "headline", "guideline", "outline"]', 0, '「プロジェクトの締め切り」は the deadline of the project です。deadline は「締め切り」。headline は見出し、guideline は指針、outline は概要。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: I can''t find my wallet. B: Don''t __BLANK__. Let''s retrace your steps. When did you last use it?', '["panic", "perform", "permit", "persist"]', 0, '「パニックになるな」は Don''t panic です。panic は「パニックになる」。perform は演じる、permit は許可する、persist はしつこく続ける。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The hotel __BLANK__s a beautiful view of the ocean. Many guests choose rooms on the top floor.', '["offers", "orders", "obeys", "objects"]', 0, '「海の眺めを提供している」は offers a beautiful view です。offer は「提供する、申し出る」。order は注文する、obey は従う、object は反対する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Tom''s __BLANK__ in the race was unexpected. He had never won before.', '["victory", "vacancy", "variety", "vehicle"]', 0, '「レースでの勝利」は victory in the race です。victory は「勝利」。vacancy は空き、variety は多様性、vehicle は乗り物。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'We need to __BLANK__ the document before we send it to the client. Please check for spelling mistakes.', '["proofread", "produce", "protect", "provide"]', 0, '「書類を校正する」は proofread the document です。proofread は「校正する、読み合わせる」。produce は生産する、protect は守る、provide は提供する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The doctor __BLANK__ that Mr. Brown rest for at least two weeks. He had been working too hard.', '["recommended", "replaced", "reported", "represented"]', 0, '「少なくとも2週間休むよう勧めた」は recommended that 〜 rest です。recommend は「勧める」。replace は取り替える、report は報告する、represent は代表する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The river __BLANK__ through the valley. It is a popular spot for canoeing in summer.', '["winds", "washes", "wastes", "watches"]', 0, '「川が谷を曲がりくねって流れる」は the river winds through です。wind は「曲がりくねって進む」。wash は洗う、waste は無駄にする、watch は見る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Should we take the highway? B: Yes. It''s the __BLANK__ way to get to the airport. We don''t have much time.', '["quickest", "quietest", "queen", "quest"]', 0, '「空港へ最も早く行く道」は the quickest way です。quickest は「最も速い」。quietest は最も静かな、queen は女王、quest は探求。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The newspaper __BLANK__ the story on the front page. Everyone was talking about it the next day.', '["featured", "feared", "fixed", "followed"]', 0, '「一面でその記事を特集した」は featured the story です。feature は「特集する、主に載せる」。fear は恐れる、fix は直す、follow は従う・追う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Lisa __BLANK__ her grandmother every weekend. They have lunch together and talk for hours.', '["visits", "voices", "volunteers", "votes"]', 0, '「毎週末祖母を訪ねる」は visits her grandmother です。visit は「訪ねる、訪問する」。voice は声に出す、volunteer はボランティアする、vote は投票する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The __BLANK__ of the building was damaged in the earthquake. Engineers are checking if it is safe to enter.', '["foundation", "fountain", "fortune", "freedom"]', 0, '「建物の土台」は the foundation of the building です。foundation は「土台、基礎」。fountain は噴水、fortune は運・富、freedom は自由。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'James had to __BLANK__ his speech because the room was very noisy. Nobody could hear him.', '["raise", "rise", "reach", "relax"]', 0, '「声を大きくしなければならなかった」は had to raise his voice です。raise は「（声・レベルを）上げる」。rise は自動詞で上がる、reach は届く、relax はリラックスする。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The committee will __BLANK__ the proposal at the next meeting. They need more time to discuss the details.', '["consider", "confirm", "contact", "contain"]', 0, '「次回会議で提案を検討する」は will consider the proposal です。consider は「検討する、考える」。confirm は確認する、contact は連絡する、contain は含む。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Why is Kate so __BLANK__? B: She just got accepted to her first choice of university. She has been dreaming about it for years.', '["thrilled", "threatened", "thriving", "throwing"]', 0, '「とても嬉しそう」は so thrilled です。thrilled は「とても喜んで、わくわくして」。threaten は脅す、thriving は繁栄している、throw は投げる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The museum has a large __BLANK__ of modern art. It is one of the best in the country.', '["collection", "connection", "correction", "conversation"]', 0, '「現代美術の大コレクション」は a large collection of です。collection は「コレクション、収集品」。connection はつながり、correction は訂正、conversation は会話。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The teacher __BLANK__ the students to work in pairs. She said it would help them learn from each other.', '["instructed", "insured", "intended", "interested"]', 0, '「生徒にペアで作業するよう指示した」は instructed the students to 〜 です。instruct は「指示する、教える」。insure は保険をかける、interest は興味を持たせる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'We decided to __BLANK__ the meeting until everyone could attend. The date will be announced soon.', '["postpone", "possess", "practice", "predict"]', 0, '「会議を延期することにした」は decided to postpone the meeting です。postpone は「延期する」。possess は所有する、practice は練習する、predict は予測する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The __BLANK__ of the accident is still under investigation. Police are asking witnesses to come forward.', '["cause", "case", "course", "cost"]', 0, '「事故の原因」は the cause of the accident です。cause は「原因」。case は場合・事件、course はコース・過程、cost は費用。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Can you help me move this table? B: Sure. Let''s __BLANK__ it to the other side of the room.', '["shift", "shine", "shoot", "shut"]', 0, '「テーブルを部屋の反対側に移そう」は Let''s shift it です。shift は「移す、動かす」。shine は輝く、shoot は撃つ・撮る、shut は閉める。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The new law will __BLANK__ in April. All companies must comply by then.', '["take effect", "take place", "take part", "take care"]', 0, '「4月に効力を持つ」は will take effect in April です。take effect で「効力を発する、効き始める」。take place は起こる、take part は参加する、take care は気をつける。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Maria __BLANK__ her success to hard work and the support of her family. She thanked them in her speech.', '["attributed", "attracted", "attacked", "attended"]', 0, '「成功を努力と家族の支えのおかげだとした」は attributed her success to 〜 です。attribute A to B で「AをBのせいにする・帰する」。attract は引きつける、attack は攻撃する、attend は出席する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The manager was __BLANK__ with the team''s performance. They had exceeded all their targets.', '["satisfied", "surprised", "scared", "sorry"]', 0, '「チームの成績に満足していた」は was satisfied with です。be satisfied with で「〜に満足している」。surprised は驚いて、scared は怖がって、sorry は申し訳なく思って。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: How did you __BLANK__ the news? B: I was shocked at first, but I''m getting used to it now.', '["react to", "refer to", "relate to", "reply to"]', 0, '「その知らせにどう反応したか」は how did you react to です。react to で「〜に反応する」。refer to は言及する、relate to は関連する、reply to は返信する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The hotel __BLANK__s free Wi-Fi in all rooms. You can connect as soon as you check in.', '["provides", "proves", "promotes", "proposes"]', 0, '「全室で無料Wi-Fiを提供している」は provides free Wi-Fi です。provide は「提供する」。prove は証明する、promote は促進する、propose は提案する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The scientist __BLANK__ her theory with data from many experiments. The results were consistent.', '["supported", "supposed", "surrounded", "suspected"]', 0, '「多くの実験データで理論を裏付けた」は supported her theory with です。support は「支持する、裏付ける」。suppose は思う、surround は囲む、suspect は疑う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Is the library open on Sundays? B: Yes. It is open every day __BLANK__ national holidays.', '["except for", "except that", "apart from", "due to"]', 0, '「祝日を除いて毎日開いている」は every day except for national holidays です。except for で「〜を除いて」。apart from も「除いて」だが、except for が自然。due to は〜が原因で。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The company decided to __BLANK__ the old factory and build a new one. The building was too damaged to repair.', '["tear down", "turn down", "take down", "settle down"]', 0, '「古い工場を取り壊すことにした」は decided to tear down です。tear down で「取り壊す」。turn down は断る・音量を下げる、take down は書き留める・取り外す、settle down は落ち着く。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Paul has always __BLANK__ his father. He wants to be a pilot just like him.', '["looked up to", "looked down on", "looked forward to", "looked back on"]', 0, '「ずっと父親を尊敬してきた」は has looked up to his father です。look up to で「尊敬する」。look down on は見下す、look forward to は楽しみにしている、look back on は振り返る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The concert was __BLANK__ because of the heavy rain. It will be held next Saturday instead.', '["called off", "called on", "called for", "called up"]', 0, '「大雨でコンサートが中止になった」は was called off です。call off で「中止する」。call on は訪ねる・〜に頼む、call for は求める、call up は電話する・呼び出す。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: I''m nervous about the interview. B: Just __BLANK__ yourself. You have prepared well and you know your strengths.', '["believe in", "belong to", "benefit from", "break into"]', 0, '「自分を信じて」は Just believe in yourself です。believe in で「〜を信じる、〜に自信を持つ」。belong to は所属する、benefit from は恩恵を受ける、break into は押し入る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The report __BLANK__ the importance of early childhood education. Many experts agree with its findings.', '["emphasizes", "employs", "enables", "encourages"]', 0, '「報告書は幼児教育の重要性を強調している」は emphasizes the importance of です。emphasize は「強調する」。employ は雇う、enable は可能にする、encourage は励ます。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'We had to __BLANK__ our vacation because of the pandemic. We are hoping to go next year instead.', '["cancel", "continue", "complete", "consider"]', 0, '「パンデミックのため休暇を中止しなければならなかった」は had to cancel our vacation です。cancel は「中止する、キャンセルする」。continue は続ける、complete は完了する、consider は検討する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The __BLANK__ between the two countries has improved. They have signed a new trade agreement.', '["relationship", "relativity", "relaxation", "replacement"]', 0, '「両国間の関係」は the relationship between です。relationship は「関係」。relativity は相対性、relaxation はリラックス、replacement は取り替え。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Why didn''t you answer my call? B: I was __BLANK__ a meeting. I''ll call you back this evening.', '["in charge of", "in the middle of", "in favor of", "in need of"]', 1, '「会議の最中だった」は was in the middle of a meeting です。in the middle of で「〜の最中で」。in charge of は担当で、in favor of は賛成で、in need of は〜を必要として。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The film __BLANK__ the lives of refugees. It has won several international awards.', '["depicts", "depends", "deserves", "develops"]', 0, '「映画は難民の暮らしを描いている」は depicts the lives of です。depict は「描く、描写する」。depend は依存する、deserve は値する、develop は発展させる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Students are __BLANK__ to use their phones during the exam. Anyone who breaks this rule will be disqualified.', '["forbidden", "forgiven", "forgotten", "forwarded"]', 0, '「試験中に携帯を使うことは禁止されている」は are forbidden to use です。forbid は「禁止する」。forgive は許す、forget は忘れる、forward は転送する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The new bridge will __BLANK__ the two sides of the city. It should reduce traffic jams significantly.', '["connect", "collect", "correct", "contain"]', 0, '「市の両側をつなぐ」は will connect the two sides です。connect は「つなぐ」。collect は集める、correct は正す、contain は含む。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: I''ve been feeling tired lately. B: You should __BLANK__ more rest. You have been working too hard.', '["get", "give", "take", "make"]', 0, '「もっと休息を取るべきだ」は get more rest です。get rest で「休息を取る」。take a rest も可だが、get rest が自然。give は与える、make は作る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The __BLANK__ of the novel is set in Paris in the 1920s. The author did a lot of research to make it accurate.', '["setting", "settlement", "session", "solution"]', 0, '「小説の舞台」は the setting of the novel です。setting は「舞台、設定」。settlement は和解・入植地、session はセッション、solution は解決策。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The government is trying to __BLANK__ unemployment. New programs will create more jobs.', '["reduce", "refuse", "regret", "remain"]', 0, '「失業を減らそうとしている」は trying to reduce unemployment です。reduce は「減らす」。refuse は断る、regret は後悔する、remain は残る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'Helen __BLANK__ to finish the project by Friday. She is confident she can meet the deadline.', '["promised", "preferred", "prepared", "presented"]', 0, '「金曜までに仕上げると約束した」は promised to finish です。promise to do で「〜することを約束する」。prefer は好む、prepare は準備する、present は発表する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The doctor said that __BLANK__ rest is the best treatment for a cold. You should stay home for a few days.', '["plenty of", "a lot", "enough", "much"]', 0, '「十分な休息が」は plenty of rest です。plenty of で「たくさんの、十分な」＋不可算・複数。a lot は a lot of なら可。enough / much も意味は通るが、plenty of rest が「たっぷり休む」で最も自然。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'A: Should we take a taxi? B: No, the station is __BLANK__ walking distance. It only takes about five minutes.', '["within", "without", "beyond", "with"]', 0, '「駅は歩ける距離にある」は within walking distance です。within 〜 distance で「〜の距離内に」。without はなしで、with は〜と一緒に。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The team __BLANK__ winning the championship. They had practiced every day for months.', '["succeeded in", "insisted on", "depended on", "congratulated on"]', 0, '「優勝することに成功した」は succeeded in winning です。succeed in 〜ing で「〜に成功する」。insist on は主張する、depend on は依存する、congratulate on は祝う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', '__BLANK__ the weather was bad, we decided to go hiking. We had been looking forward to it for weeks.', '["Even though", "As if", "In case", "Now that"]', 0, '「天気が悪かったにもかかわらず」は Even though the weather was bad です。even though で「〜にもかかわらず」。as if はまるで〜のように、in case は万一に備えて、now that は〜なので。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('2級', 'short_fill', 'The professor __BLANK__ that students hand in their essays by next Monday. No late submissions will be accepted.', '["required", "requested", "realized", "reminded"]', 1, '「エッセイを来週月曜までに出すよう求めた」は requested that 〜 hand in です。request は「依頼する、求める」。require も可能だが、request が「依頼」のニュアンスで自然。realize は気づく、remind は思い出させる。');
