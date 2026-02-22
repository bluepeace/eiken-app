-- seed_reading_short_jun2kyuplus.sql
-- 英検準2級プラス 短文の語句空所補充（大問1形式）100問
-- 028, 030 マイグレーション実行後に実行
-- 出題傾向: 単語10問＋句動詞・連語7問程度。準2級〜2級レベルの語彙。身近で社会的な話題。

-- === 単語問題（動詞・名詞・形容詞・副詞）===
-- (1) refused
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Justin''s mother became angry because he __BLANK__ to wash the dishes after dinner. She said to him that he could not watch TV that evening.', '["gained", "chased", "seated", "refused"]', 3, '皿を洗うのを「断った」ことが怒りの原因。「refuse to 〜」で「〜するのを断る」。gained は得た、chased は追いかけた、seated は座らせた。');

-- (2) continued
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'The rain __BLANK__ for over one week, and the level of water in the river became higher and higher.', '["continued", "noticed", "judged", "searched"]', 0, '雨が「続いた」ので川の水位が上がった。「for over one week」から継続を表す continued が正解。');

-- (3) medicine
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Mom, I have a bad headache. B: Well, go and look in the cabinet in the bathroom. You''ll find some __BLANK__ there.', '["silver", "traffic", "medicine", "evidence"]', 2, '頭痛の対処としてバスルームの棚にある「薬」を勧めている。medicine は「薬」。silver は銀、traffic は交通、evidence は証拠。');

-- (4) denied
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Jiro broke an expensive vase, but when his mother asked him about it, he __BLANK__ that he had done it. He was afraid she would be mad.', '["denied", "required", "traded", "greeted"]', 0, '壊したのを認めず「否定した」という文脈。deny that 〜 で「〜を否定する」。required は要求した、traded は取引した。');

-- (5) include
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Mr. Kimura told his staff members to put more information into their sales reports. He said they should __BLANK__ graphs and charts in each report.', '["expect", "claim", "compete", "include"]', 3, '報告書に情報を「入れる」ためにグラフやチャートを「含める」が正解。include は「含める」。expect は期待する、claim は主張する。');

-- (6) education
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Risako''s parents spent a lot of money on her __BLANK__. They sent her to a private high school and paid for her to take extra English lessons outside of school.', '["audience", "pleasure", "wealth", "education"]', 3, '私立高校や英語レッスンに使ったお金は「教育」に当たる。education が正解。audience は観客、pleasure は喜び、wealth は富。');

-- (7) replied
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'I wrote to Jennifer three months ago, but she still hasn''t __BLANK__ to me. I think she must be very busy.', '["replied", "argued", "explained", "questioned"]', 0, '手紙を出したがまだ「返事をしていない」。reply to 〜 で「〜に返事する」。argued は議論した、explained は説明した。');

-- (8) income
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Brett wanted to marry his girlfriend and start a family, but he thought his __BLANK__ was too low to support one. He started looking for another job with a better salary.', '["income", "injury", "regret", "review"]', 0, '家族を養うには「収入」が足りない。income は「収入」。injury はけが、regret は後悔、review は検討・レビュー。');

-- (9) released
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'John loves the singer Ann May, and he cannot wait until her new CD is __BLANK__ next week. He has been waiting for it since her last CD came out two years ago.', '["released", "trapped", "divided", "invented"]', 0, 'CDが「発売される」は "be released"。release は「発表する、発売する」。trapped は閉じ込められた、divided は分けられた。');

-- (10) provide
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Some universities __BLANK__ all of their students with laptop computers so that students can use the Internet in class.', '["solve", "elect", "raise", "provide"]', 3, '「学生にノートパソコンを〜する」は provide A with B（AにBを提供する）。solve は解決する、elect は選ぶ、raise は育てる・上げる。');

-- (11) tight
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: This skirt is too __BLANK__. Do you have one in a larger size? B: I''ll just have a look for you, ma''am.', '["near", "fair", "tight", "thick"]', 2, '大きいサイズを求めているので、スカートが「きつい」tight が正解。near は近い、fair は公平な、thick は厚い。');

-- (12) Apparently
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Have you been to the restaurant on the corner of Silver Street and Western Avenue? B: No, but I saw a story about it on the news. __BLANK__, a lot of people got sick from eating the grilled fish there.', '["Seldom", "Finally", "Apparently", "Otherwise"]', 2, 'ニュースで見た情報として「どうやら」を表す Apparently が正解。Seldom はめったに〜ない、Finally はついに、Otherwise はそうでなければ。');

-- (13) opponents
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'The Lions played well in the basketball game, but their __BLANK__ were much stronger. The Lions lost by 12 points.', '["passengers", "devices", "ceremonies", "opponents"]', 3, '試合で負けた相手は「対戦相手」opponents。passengers は乗客、devices は機器、ceremonies は式典。');

-- (14) households
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Mr. Morris told his history class that many __BLANK__ in American cities had electric power by the 1930s. This made life for people much more convenient.', '["alternatives", "opportunities", "households", "philosophies"]', 2, '電気を供給される単位は「家庭」households。alternative は代替、opportunity は機会、philosophy は哲学。');

-- (15) preference
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: We could go to the Indigo Grill or the Green Wall for dinner tonight. What''s your __BLANK__? B: Let''s go to the Indigo Grill. I''ve been there once before, and the food was great.', '["description", "competition", "preference", "monument"]', 2, 'どちらがいいか「好み」を聞いている。preference は「好み、選択」。description は説明、competition は競争、monument は記念碑。');

-- === 句動詞・連語表現 ===
-- (16) as usual
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: It''s already ten o''clock, and David is still not here. B: It looks like he''s going to be late __BLANK__. He never worries about the time.', '["at most", "as usual", "by chance", "in return"]', 1, '時間を気にしないデイビッドが「いつものように」遅れる。as usual は「いつものように」。at most はせいぜい、by chance は偶然に、in return はお返しに。');

-- (17) gives away
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Melissa will volunteer at a charity this summer. The charity __BLANK__ clothing and food to anybody who needs them.', '["puts off", "gives away", "fills up", "tells on"]', 1, '慈善団体が服や食べ物を「無料で配る」は give away。put off は延期する、fill up は満たす、tell on は告げ口する。');

-- (18) in (in my opinion)
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: How''s your new math teacher, Catherine? B: Well, most of my classmates think he''s too strict, but __BLANK__ my opinion, he''s a great teacher.', '["in", "at", "with", "under"]', 0, '「私の意見では」は "in my opinion" という固定表現。前置詞は in。');

-- (19) shook hands
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'When the two business partners met for the first time, they __BLANK__ with each other, then they went into the meeting room.', '["gave way", "took turns", "shook hands", "showed signs"]', 2, '初対面の挨拶で「握手する」は shake hands。give way は道を譲る、take turns は順番にやる、show signs は兆候を示す。');

-- (20) putting on
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Matthew has been eating a lot of fast food lately. B: Yeah, I noticed. If he isn''t careful, he''ll start __BLANK__ weight.', '["showing up", "giving up", "trying on", "putting on"]', 3, '「体重が増える」は put on weight。show up は現れる、give up はあきらめる、try on は試着する。');

-- (21) in case
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Why did you bring your umbrella, Jessica? It''s such a beautiful day today. B: This morning''s weather forecast said it might rain, so I brought it just __BLANK__.', '["on foot", "in case", "with care", "for help"]', 1, '「念のため」持ってきたは in case（万一に備えて）。on foot は徒歩で、with care は注意して、for help は助けを求めて。');

-- (22) fun (make fun of)
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Peter often makes __BLANK__ of his younger brother, but they actually get along well.', '["sure", "fun", "way", "sense"]', 1, '「からかう」は make fun of 〜 というイディオム。sure は make sure で確認する、way は make way で道を開ける、sense は make sense で意味をなす。');

-- (23) take place
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'There is a big rock music festival in Allenville this summer. The main event will __BLANK__ in the city stadium.', '["look up", "take part", "look after", "take place"]', 3, 'イベントが「行われる」は take place。look up は調べる、take part は参加する（in が必要）、look after は世話をする。');

-- (24) by now
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Derrick is late. B: I know. He should have been here __BLANK__. I''ll call him on his cell phone.', '["under control", "at times", "by now", "in return"]', 2, '「今頃はもう着いているはず」は by now。under control は制御下に、at times は時々、in return はお返しに。');

-- (25) in particular
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: What are you doing this afternoon? Do you have any plans? B: Nothing __BLANK__. I thought I''d just walk around downtown and look at the stores.', '["at random", "in particular", "by accident", "for granted"]', 1, '「特に何も」計画がないは Nothing in particular。at random は無作為に、by accident は偶然、for granted は take for granted で当然と思う。');

-- (26) behavior
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Mrs. Andrews told John''s parents that she was worried about John''s __BLANK__ in class. She said that he talked to his friends too much instead of studying.', '["reason", "design", "behavior", "convenience"]', 2, '授業中の「行動・振る舞い」が心配の対象。behavior は「行動、態度」。reason は理由、design はデザイン、convenience は便宜。');

-- (27) heavily
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Leo''s mother told him to take an umbrella with him to school because it would rain __BLANK__ in the afternoon.', '["heavily", "socially", "sincerely", "proudly"]', 0, '傘が必要なほど「激しく」雨が降るは rain heavily。heavily は「激しく、大量に」。socially は社会的に、sincerely は心から、proudly は誇らしげに。');

-- (28) nearly
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Dad, when are we going to get to Grandma''s house? B: We''re __BLANK__ there, Beth. It''s about 10 minutes away.', '["seriously", "nearly", "lately", "honestly"]', 1, '「あと10分」なので「もうすぐ着く」nearly there。nearly は「ほとんど、もう少しで」。seriously は真剣に、lately は最近、honestly は正直に。');

-- (29) instructions
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Rachel bought a new bookshelf yesterday. When she got home, she read the __BLANK__ carefully so that she would not make any mistakes while putting it together.', '["instructions", "campaigns", "lifestyles", "stocks"]', 0, '組み立てる前に読むのは「説明書」instructions。instruction は「説明、指示」。campaign はキャンペーン、lifestyle は生活様式、stock は在庫・株。');

-- (30) origins
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Although the __BLANK__ of tennis are not clear, some people believe the game was invented by a British army officer in 1873.', '["origins", "memories", "signs", "causes"]', 0, 'テニスの「起源」は origins。origin は「起源、由来」。memory は記憶、sign は兆候・看板、cause は原因。');

-- (31) results
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'The __BLANK__ of Helen''s exams were so good that her parents decided to take her to dinner at a nice restaurant to celebrate.', '["habits", "plans", "results", "customs"]', 2, '試験の「結果」が良くて祝う。results が正解。habit は習慣、plan は計画、custom は習慣・慣習。');

-- (32) emerged
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'The actress''s fans waited outside until she __BLANK__ from the theater. Then they crowded around her to take pictures and shake her hand.', '["emerged", "translated", "aimed", "protested"]', 0, '劇場から「出てきた」は emerged。emerge は「現れる、出てくる」。translate は翻訳する、aim は狙う、protest は抗議する。');

-- (33) frequent
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Hank asked his sister to stop calling him every day. He said that her __BLANK__ calls were taking too much of his time.', '["urban", "ancient", "senior", "frequent"]', 3, '毎日かかってくる「頻繁な」電話。frequent は「頻繁な」。urban は都市の、ancient は古代の、senior は年上の・上級の。');

-- (34) regret
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Joseph chose to study chemistry at college, but his classes were so difficult that he quickly began to __BLANK__ his decision.', '["regret", "harm", "exhibit", "outline"]', 0, '難しい授業で「後悔する」は regret。regret は「後悔する」。harm は傷つける、exhibit は展示する、outline は概要を示す。');

-- (35) indicate
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'People all over the world use hand gestures to communicate. For example, the thumbs-up sign is often used to __BLANK__ that something is OK.', '["breathe", "whistle", "threaten", "indicate"]', 3, 'ジェスチャーで「示す」は indicate。indicate は「示す、指し示す」。breathe は息をする、whistle は口笛を吹く、threaten は脅す。');

-- (36) tiny
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Matt went to the hospital to see his new baby brother. He was surprised at how __BLANK__ the baby''s hands were.', '["deep", "global", "tiny", "safe"]', 2, '赤ちゃんの手は「とても小さい」tiny。tiny は「とても小さい」。deep は深い、global は世界的な、safe は安全な。');

-- (37) equally
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Which subject is more important for you to pass, English or math? B: I think they are __BLANK__ important. I spend the same amount of time studying for both.', '["equally", "lastly", "correctly", "sincerely"]', 0, '同じ時間勉強するので「同様に」重要。equally は「同等に、同様に」。lastly は最後に、correctly は正しく、sincerely は心から。');

-- (38) victim
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Liz was the __BLANK__ of a robbery last week. She had her handbag stolen when she was on the train.', '["dealer", "candidate", "judge", "victim"]', 3, '強盗の「被害者」は victim。victim は「被害者」。dealer は業者、candidate は候補者、judge は裁判官。');

-- (39) profit
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: How is your business going? B: It was a tough year, but we still managed to make a higher __BLANK__ than last year.', '["policy", "contract", "capture", "profit"]', 3, 'ビジネスで「利益」を上げるは profit。profit は「利益」。policy は方針、contract は契約、capture は捕らえる。');

-- (40) purchase
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Charles bought a new car last week. It was the biggest __BLANK__ he had made in five years.', '["purchase", "custom", "voyage", "fund"]', 0, '車を買った「購入」は purchase。purchase は「購入、買い物」。custom は慣習、voyage は航海、fund は資金。');

-- (41) look after
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Can you __BLANK__ my cat while I''m on vacation next week? B: Sure! I''d be happy to help.', '["run after", "look after", "jump at", "sing for"]', 1, '留守中の猫の「世話」は look after。look after で「〜の世話をする」。run after は追いかける、jump at は飛びつく。');

-- (42) in shape
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Alex goes to the gym three times a week. He says it helps him stay __BLANK__ and feel better.', '["in shape", "at attention", "with luck", "on board"]', 0, '「体調を保つ」は stay in shape。in shape で「良い体調で」。at attention は気をつけの姿勢で、on board は乗って・参加して。');

-- (43) carry out
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'The scientists will __BLANK__ the experiment next month. They need more time to prepare the equipment.', '["carry with", "carry by", "carry until", "carry out"]', 3, '実験を「行う」は carry out。carry out で「実行する、行う」。');

-- (44) go ahead
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Would it be OK if I opened the window? It''s a bit warm in here. B: Sure, __BLANK__. I could use some fresh air too.', '["go ahead", "give up", "watch out", "take care"]', 0, '窓を開けてもいいと言う「どうぞ」は go ahead。give up はあきらめる、watch out は気をつける、take care は気をつけて。');

-- (45) for the benefit of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'The new park was built __BLANK__ the whole community. Everyone can enjoy it for free.', '["at the sight of", "for a change of", "for the benefit of", "at the thought of"]', 2, '地域社会の「ために」作られたは for the benefit of。benefit は「利益、恩恵」。at the sight of は〜を見て、at the thought of は〜を考えると。');

-- (46-55) 追加の単語・熟語
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Sarah''s grandfather __BLANK__ a small bakery for over forty years. He finally retired last month.', '["operated", "selected", "celebrated", "investigated"]', 0, 'ベーカリーを「経営した」は operated。operate は「経営する、操作する」。select は選ぶ、celebrate は祝う、investigate は調査する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'The new bridge will __BLANK__ the two towns. People will no longer need to take a long detour.', '["connect", "collect", "correct", "protect"]', 0, '2つの町を「つなぐ」は connect。connect は「つなぐ、連結する」。collect は集める、correct は訂正する、protect は守る。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'A: Do you have any __BLANK__ for the weekend? B: I''m thinking about going hiking if the weather is nice.', '["plans", "claims", "harms", "forms"]', 0, '週末の「計画」を聞いている。plans が正解。claim は主張、harm は害、form は形式。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'The teacher asked the students to __BLANK__ their essays by Friday. No late submissions would be accepted.', '["submit", "permit", "admit", "limit"]', 0, 'エッセイを「提出する」は submit。submit は「提出する」。permit は許可する、admit は認める、limit は制限する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準2級プラス', 'short_fill', 'Emily felt __BLANK__ when she heard that she had passed the exam. She had studied very hard for it.', '["relieved", "rejected", "removed", "repeated"]', 0, '試験に合格して「安心した」は relieved。relieved は「安心した、ほっとした」。reject は拒否する、remove は取り除く、repeat は繰り返す。');

-- (51-70)
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The museum has a special __BLANK__ this month. Many people come to see the famous paintings.', '["exhibition", "explanation", "examination", "exchange"]', 0, '美術館の「展覧会」は exhibition。exhibition は「展覧会、展示」。explanation は説明、examination は試験、exchange は交換。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Tom''s father __BLANK__ him to study harder. He said that good grades would help him get into a good university.', '["encouraged", "entertained", "estimated", "existed"]', 0, '「励ます」は encourage。encourage は「励ます、奨励する」。entertain は楽しませる、estimate は見積もる、exist は存在する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: I''m sorry I''m late. The bus was stuck in __BLANK__ for twenty minutes. B: That''s okay. I understand.', '["traffic", "tradition", "temperature", "technology"]', 0, 'バスが「渋滞」にはまった。traffic は「交通、渋滞」。tradition は伝統、temperature は温度、technology は技術。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The company announced that it would __BLANK__ 50 new employees next year. Many people are excited about the job opportunities.', '["hire", "heat", "hide", "hope"]', 0, '「雇用する」は hire。hire は「雇う」。heat は熱する、hide は隠す、hope は望む。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Mary was __BLANK__ when she lost her wallet. She had all her important cards inside it.', '["upset", "upbeat", "upright", "upstairs"]', 0, '財布をなくして「動揺した」は upset。upset は「動揺した、心配な」。upbeat は楽観的な、upright は直立した、upstairs は上の階に。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The hotel offers a beautiful __BLANK__ of the ocean from every room. Guests love to watch the sunrise.', '["view", "voice", "visit", "virus"]', 0, '部屋からの「眺め」は view。view は「眺め、視界」。voice は声、visit は訪問、virus はウイルス。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'We need to __BLANK__ the meeting until next week. The manager is sick and cannot attend today.', '["postpone", "possess", "perform", "persuade"]', 0, '会議を「延期する」は postpone。postpone は「延期する」。possess は所有する、perform は実行する、persuade は説得する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: Why did you __BLANK__ the job offer? B: The salary was too low for me to support my family.', '["refuse", "reduce", "replace", "request"]', 0, '仕事のオファーを「断った」は refuse。refuse は「断る、拒否する」。reduce は減らす、replace は置き換える、request は要求する。');

-- (59-78)
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The restaurant is very __BLANK__ on weekends. You should make a reservation in advance.', '["popular", "personal", "physical", "political"]', 0, '週末は「人気がある」popular。popular は「人気のある」。personal は個人的な、physical は身体的な、political は政治的な。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'David decided to __BLANK__ his old car and buy a new one. The repair cost was too high.', '["give up", "give in", "give out", "give away"]', 0, '古い車を「あきらめる」は give up。give up で「〜をあきらめる」。give in は屈する、give out は配る、give away は無料で渡す。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: What time does the concert __BLANK__? B: It starts at 7 p.m. We should leave soon.', '["take off", "take place", "take care", "take part"]', 1, 'コンサートが「行われる」は take place。take off は離陸する、take care は気をつける、take part は参加する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Lisa had to __BLANK__ her trip to Europe because of the pandemic. She was very disappointed.', '["call off", "call on", "call for", "call back"]', 0, '旅行を「中止する」は call off。call off で「中止する」。call on は訪ねる、call for は求める、call back は折り返す。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The doctor __BLANK__ that Mr. Tanaka should rest for a few days. He had been working too hard.', '["recommended", "recognized", "recycled", "replaced"]', 0, '医者が「勧めた」は recommended。recommend は「勧める」。recognize は認める、recycle はリサイクルする、replace は置き換える。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The weather __BLANK__ changed. It was sunny in the morning, but now it''s raining heavily.', '["suddenly", "successfully", "sincerely", "strongly"]', 0, '天気が「突然」変わった。suddenly は「突然」。successfully は首尾よく、sincerely は心から、strongly は強く。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: I can''t __BLANK__ what you''re saying. It''s too noisy in here. B: Let me say it again.', '["make out", "make up", "make for", "make of"]', 0, '聞き取れないは「理解する」make out。make out で「聞き取る、理解する」。make up は作り上げる、make for は〜に向かう。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The library has a large __BLANK__ of books. You can find almost any book you need there.', '["collection", "connection", "correction", "celebration"]', 0, '図書館の「コレクション、所蔵」は collection。collection は「コレクション、収集」。connection は接続、correction は訂正、celebration は祝賀。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'James was __BLANK__ to hear the news. He had been waiting for this opportunity for a long time.', '["thrilled", "threatened", "thoughtful", "thorough"]', 0, '機会を知って「とても喜んだ」は thrilled。thrilled は「とても喜んだ」。threaten は脅す、thoughtful は思慮深い、thorough は徹底した。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The company will __BLANK__ its new product at the exhibition next month. Many people are looking forward to it.', '["discover", "display", "discuss", "divide"]', 1, '新製品を「展示する」は display。display は「展示する、表示する」。discover は発見する、discuss は議論する、divide は分ける。');

-- (69-88)
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The __BLANK__ of the building was damaged in the storm. Workers are now repairing the roof.', '["roof", "root", "room", "rope"]', 0, '嵐で「屋根」が損傷した。roof は「屋根」。root は根、room は部屋、rope はロープ。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: I''m going to __BLANK__ for the math test tomorrow. B: Good luck! I''m sure you''ll do well.', '["look up", "look after", "look for", "look over"]', 3, 'テストの「復習をする」は look over。look over で「〜に目を通す、復習する」。look up は調べる、look after は世話する、look for は探す。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The teacher __BLANK__ the students to work in groups. She said that teamwork was important.', '["advised", "avoided", "achieved", "allowed"]', 0, '生徒に「助言した」は advised。advise は「助言する、勧める」。avoid は避ける、achieve は達成する、allow は許可する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The factory has __BLANK__ its production. It now makes twice as many products as before.', '["increased", "included", "invited", "improved"]', 0, '生産を「増やした」は increased。increase は「増やす、増える」。include は含める、invite は招待する、improve は改善する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: How was your trip to Kyoto? B: It was __BLANK__! I visited many temples and tried delicious food.', '["wonderful", "worthless", "watchful", "wasteful"]', 0, '旅行が「すばらしかった」は wonderful。wonderful は「すばらしい」。worthless は価値のない、watchful は警戒している、wasteful は無駄な。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The new law will __BLANK__ from next April. Everyone needs to follow the new rules.', '["take effect", "take place", "take care", "take part"]', 0, '法律が「効力を発する」は take effect。take effect で「効力を発する」。take place は行われる、take care は気をつける、take part は参加する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Nina''s parents were __BLANK__ of her success. They had always believed in her.', '["proud", "proper", "present", "private"]', 0, '成功を「誇りに思った」は proud。be proud of で「〜を誇りに思う」。proper は適切な、present は現在の、private は私的な。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The museum is __BLANK__ on Mondays. You can visit it from Tuesday to Sunday.', '["closed", "cleared", "claimed", "cloned"]', 0, '月曜は「閉まっている」closed。be closed で「閉まっている」。clear は片づける、claim は主張する、clone はクローンを作る。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: Could you __BLANK__ the volume? I can''t hear the TV. B: Sure, no problem.', '["turn up", "turn down", "turn off", "turn on"]', 0, '聞こえないので音量を「上げる」turn up。turn up で「音量を上げる」。turn down は下げる、turn off は消す、turn on はつける。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The scientist made an important __BLANK__. His research could help save many lives.', '["discovery", "decision", "discussion", "direction"]', 0, '科学者の「発見」は discovery。discovery は「発見」。decision は決定、discussion は議論、direction は方向。');

-- (79-100)
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The meeting was __BLANK__ until next Tuesday. The manager had an emergency to handle.', '["put off", "put on", "put up", "put out"]', 0, '会議を「延期した」は put off。put off で「延期する」。put on は着る、put up は上げる、put out は消す。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Emily''s grandmother has a lot of __BLANK__ about cooking. She has been cooking for over fifty years.', '["experience", "experiment", "expert", "expression"]', 0, '料理の「経験」が豊富。experience は「経験」。experiment は実験、expert は専門家、expression は表現。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The police are __BLANK__ the accident. They need to find out what caused it.', '["investigating", "interrupting", "interviewing", "introducing"]', 0, '事故を「調査している」は investigating。investigate は「調査する」。interrupt は邪魔する、interview は面接する、introduce は紹介する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: I''ve been __BLANK__ for my keys for an hour. B: Have you checked under the sofa?', '["looking", "locking", "leaving", "liking"]', 0, '鍵を「探している」は looking。look for で「〜を探す」。lock は鍵をかける、leave は去る、like は好き。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The hotel provides __BLANK__ breakfast for all guests. You can eat as much as you want.', '["free", "fresh", "full", "fast"]', 0, '「無料の」朝食は free。free は「無料の」。fresh は新鮮な、full は満杯の、fast は速い。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Ken decided to __BLANK__ his job and start his own business. He had always wanted to be his own boss.', '["quit", "quiet", "quite", "quote"]', 0, '仕事を「辞める」は quit。quit は「辞める」。quiet は静かな、quite はかなり、quote は引用する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The river has become __BLANK__ over the years. Factories have been dumping waste into it.', '["polluted", "popular", "polite", "positive"]', 0, '川が「汚染された」は polluted。polluted は「汚染された」。popular は人気の、polite は丁寧な、positive は肯定的な。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: I''m __BLANK__ that I forgot your birthday. B: Don''t worry. Let''s celebrate this weekend.', '["sorry", "sore", "solid", "solar"]', 0, '忘れて「申し訳ない」は sorry。sorry は「申し訳なく思う」。sore は痛い、solid は固体の、solar は太陽の。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The movie was so __BLANK__ that many people cried. It had a very touching story.', '["moving", "missing", "mixing", "mailing"]', 0, '「心を動かす」映画は moving。moving は「感動的な」。missing は行方不明の、mixing は混ぜる、mailing は郵送する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'We need to __BLANK__ the problem before it gets worse. Let''s discuss it at the meeting.', '["solve", "save", "serve", "share"]', 0, '問題を「解決する」は solve。solve は「解決する」。save は救う、serve は提供する、share は共有する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The flight was __BLANK__ by two hours because of bad weather. Passengers had to wait at the airport.', '["delayed", "delivered", "decided", "developed"]', 0, '飛行機が「遅延した」は delayed。delay は「遅延させる」。deliver は配達する、decide は決める、develop は発展させる。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: Can you __BLANK__ me with this heavy box? B: Of course. Let me help you.', '["assist", "assign", "assume", "assure"]', 0, '「手伝う」は assist。assist は「手伝う」。assign は割り当てる、assume は想定する、assure は保証する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The store offers a full __BLANK__ if you are not satisfied with your purchase. You can return it within 30 days.', '["refund", "refuse", "reflect", "refer"]', 0, '「返金」は refund。refund は「返金」。refuse は断る、reflect は反映する、refer は参照する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Sarah felt __BLANK__ when she saw her old friend at the party. They hadn''t met in ten years.', '["surprised", "sure", "safe", "same"]', 0, '10年ぶりの友達に「驚いた」は surprised。surprised は「驚いた」。sure は確信して、safe は安全な、same は同じ。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The children __BLANK__ around the playground. They were having a great time.', '["ran", "rat", "raw", "ray"]', 0, '遊び場を「走り回った」は ran。run around で「走り回る」。rat はネズミ、raw は生の、ray は光線。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: I''m __BLANK__ to finish this report by tomorrow. B: I can help you if you want.', '["struggling", "striking", "stretching", "strengthening"]', 0, 'レポートを「苦戦している」は struggling。struggle は「苦戦する、もがく」。strike は打つ、stretch は伸ばす、strengthen は強化する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The government has __BLANK__ new rules to protect the environment. They will start next year.', '["announced", "avoided", "allowed", "admired"]', 0, '新規則を「発表した」は announced。announce は「発表する」。avoid は避ける、allow は許可する、admire は賞賛する。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Mike''s __BLANK__ in science helped him win the competition. He had studied very hard.', '["knowledge", "kindness", "kingdom", "kitchen"]', 0, '科学の「知識」で優勝。knowledge は「知識」。kindness は親切、kingdom は王国、kitchen は台所。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The concert tickets __BLANK__ out in just ten minutes. They were very popular.', '["sold", "sailed", "saved", "seized"]', 0, 'チケットが「売り切れた」は sold out。sail は航海する、save は救う、seize は掴む。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'A: I ran out of milk. B: I''ll __BLANK__ some on my way home from work.', '["pick up", "pick out", "pick on", "pick at"]', 0, '帰りに「買ってくる」は pick up。pick up で「取りに行く、買ってくる」。pick out は選ぶ、pick on はいじめる、pick at はつつく。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'The magazine publishes articles about __BLANK__ events. Readers can learn about what is happening around the world.', '["current", "curious", "careful", "certain"]', 0, '「現在の」出来事は current。current は「現在の」。curious は好奇心のある、careful は慎重な、certain は確かな。');
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation) VALUES ('準2級プラス', 'short_fill', 'Tom''s uncle __BLANK__ him to become a doctor. He said it was a rewarding profession.', '["inspired", "intended", "improved", "invited"]', 0, '医者になるように「励ました」は inspired。inspire は「励ます、触発する」。intend は意図する、improve は改善する、invite は招待する。');



