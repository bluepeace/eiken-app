-- seed_reading_short_jun1kyu_100.sql
-- 英検準1級 短文の語句空所補充 100問
-- 出題傾向: 単語（上級語彙）約60%・熟語・句動詞約40%（過去の大問1のレベル感に準拠）
-- 実行: マイグレーション 028, 030 適用後、本ファイルを実行

-- ========== 単語問題（1〜60） ==========

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Emergency services were having difficulty getting to the scene of the accident, so the police __BLANK__ traffic to another road to make space for ambulances and fire trucks.', '["infected", "recited", "galloped", "diverted"]', 3, '「交通を別の道路に迂回させた」は diverted traffic です。divert は「向きを変える、迂回させる」。infect は感染させる、recite は暗唱する、gallop は駆ける。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The teacher suddenly lost his temper and shouted at the class to be quiet. Following his __BLANK__, all the students in the classroom went silent.', '["intake", "outburst", "breakup", "layout"]', 1, '「彼の激情のあと」は Following his outburst です。outburst は「（感情の）爆発、激しい発言」。intake は摂取、breakup は別れ、layout は配置。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'A: I''ve e-mailed Emily three times already to ask if she''s coming to the party, but she hasn''t responded. B: That''s odd. She usually gives such __BLANK__ replies.', '["slender", "gloomy", "abnormal", "prompt"]', 3, '「そんなにすぐ返事をくれる」は such prompt replies です。prompt は「迅速な、即座の」。slender は細い、gloomy は陰気な、abnormal は異常な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Researchers at the drug company have improved the __BLANK__ of their headache medicine. The pills are now twice as strong.', '["excursion", "potency", "friction", "negligence"]', 1, '「薬の効き目を高めた」は improved the potency of です。potency は「効力、強さ」。excursion は小旅行、friction は摩擦、negligence は怠慢。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Using a smartphone while driving is now illegal in many places because it __BLANK__ drivers, who should always be watching the road.', '["distracts", "reforms", "pacifies", "dismisses"]', 0, '「運転者の気を散らす」は distracts drivers です。distract は「気を散らす、注意を逸らす」。reform は改革する、pacify はなだめる、dismiss は解雇する・却下する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'In an effort to reduce government spending, the government has __BLANK__ the post office by allowing a for-profit corporation to take it over.', '["formulated", "privatized", "ventilated", "deformed"]', 1, '「郵便局を民営化した」は has privatized the post office です。privatize は「民営化する」。formulate は公式化する、ventilate は換気する、deform は変形させる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Most of the topics discussed in the weekly meeting are __BLANK__ to his section, so Hans always takes his laptop so that he can spend the time replying to his e-mails.', '["occupied", "invisible", "irrelevant", "anxious"]', 2, '「彼の部署には関係ない」は are irrelevant to his section です。irrelevant は「無関係な、的を射ていない」。occupied は占有された、invisible は見えない、anxious は心配して。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'After a storm, flooding can make roads __BLANK__. Motorists are advised to check that all roads on their planned routes are safe to drive on.', '["hazardous", "vigorous", "furious", "monotonous"]', 0, '「道路を危険にする」は make roads hazardous です。hazardous は「危険な」。vigorous は活発な、furious は激怒した、monotonous は単調な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'A: Majid, remind me how many people we can __BLANK__ in Conference Room B. B: Fifteen, so it should be fine for today''s meeting.', '["outlaw", "elevate", "plead", "accommodate"]', 3, '「何人収容できるか」は how many people we can accommodate です。accommodate は「収容する、対応する」。outlaw は禁止する、elevate は上げる、plead は嘆願する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company president was not __BLANK__ about the reasons for the layoffs. When asked, he gave only vague answers and avoided any direct comments.', '["alleged", "forthcoming", "blissful", "fainthearted"]', 1, '「解雇の理由について率直ではなかった」は was not forthcoming です。forthcoming は「率直な、進んで話す」。alleged は疑惑の、blissful は至福の、fainthearted は臆病な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The politician claimed he was __BLANK__ to no one, but everyone knew he had received donations from many companies to help his campaign.', '["sinister", "indebted", "perilous", "doomed"]', 1, '「誰にも恩義を負っていないと言った」は was indebted to no one の否定。indebted は「恩義を負っている」。sinister は不吉な、perilous は危険な、doomed は運命づけられた。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Parents were asked to __BLANK__ their children to and from the school dance. Since the event would be held in the evening, school officials did not want children going on their own.', '["appoint", "import", "acquaint", "escort"]', 3, '「子どもを送り迎えするよう求められた」は to escort their children です。escort は「付き添って連れて行く」。appoint は任命する、import は輸入する、acquaint は知らせる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The cookie factory made one __BLANK__ of cookies with salt instead of sugar. They had to throw the entire lot away.', '["aggression", "substitute", "relegation", "batch"]', 3, '「クッキーを1ロット塩で作ってしまった」は one batch of cookies です。batch は「（一度に作る）一山、ロット」。aggression は攻撃性、substitute は代わり、relegation は降格。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The documentary on the war was so powerful that it __BLANK__ strong feelings of sadness and anger in the viewers.', '["dehydrated", "evoked", "acquired", "posed"]', 1, '「視聴者に悲しみと怒りを呼び起こした」は evoked strong feelings です。evoke は「（感情・記憶を）呼び起こす」。dehydrate は脱水させる、acquire は獲得する、pose は提起する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The travel agent warned the couple not to __BLANK__ the discount airline''s flights being on time. They were often delayed or canceled.', '["take in", "even out", "figure on", "make do"]', 2, '「格安航空の便が定刻だと思い込むな」は not to figure on 〜 being on time です。figure on で「〜を当てにする、〜を前提にする」。take in は取り込む、even out は均す、make do はやりくりする。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The country''s military was able to __BLANK__ the enemy''s spy drone before it could gather any information about the country''s defenses.', '["hold out", "shoot down", "get over", "snap up"]', 1, '「敵の偵察ドローンを撃墜した」は was able to shoot down です。shoot down で「撃ち落とす」。hold out は持ちこたえる、get over は乗り越える、snap up は飛びついて買う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The house they bought is in a __BLANK__ area in the countryside, far from the nearest town.', '["stocky", "cheery", "ambitious", "remote"]', 3, '「町から離れた田舎の一帯」は a remote area です。remote は「遠隔の、辺鄙な」。stocky はがっしりした、cheery は明るい、ambitious は野心的な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Dogs can hear sounds that are not __BLANK__ to humans. Their hearing range is much wider than ours.', '["commendable", "impressionable", "audible", "eligible"]', 2, '「人間には聞こえない音」は not audible to humans です。audible は「聞こえる、聴覚に感知できる」。commendable は賞賛すべき、impressionable は影響されやすい、eligible は資格のある。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Many __BLANK__ use the new highway to travel from the suburbs to the city for work every day.', '["invaders", "commuters", "composers", "installers"]', 1, '「多くの通勤者が」は Many commuters です。commuter は「通勤者」。invader は侵略者、composer は作曲家、installer は設置業者。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The salesperson receives a __BLANK__ based on the number of cars she sells each month. The more she sells, the more she earns.', '["commission", "script", "fragment", "molecule"]', 0, '「売った台数に応じた手数料」は a commission based on です。commission は「手数料、歩合」。script は台本、fragment は断片、molecule は分子。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The doctor said that the patient''s __BLANK__ was likely due to overwork. He advised her to get more rest.', '["virtue", "fatigue", "oversight", "perception"]', 1, '「患者の疲労は」は the patient''s fatigue です。fatigue は「疲労」。virtue は美徳、oversight は見落とし、perception は認識。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The truck stopped __BLANK__ in the middle of the road, causing the car behind it to swerve to avoid a collision.', '["indifferently", "appealingly", "abruptly", "timidly"]', 2, '「トラックが突然止まった」は stopped abruptly です。abruptly は「突然、不意に」。indifferently は無関心に、appealingly は訴えるように、timidly は臆病に。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The professor does not __BLANK__ late papers. Students must hand in their assignments by the deadline or receive a failing grade.', '["clarify", "implement", "tolerate", "humiliate"]', 2, '「遅れたレポートを認めない」は does not tolerate late papers です。tolerate は「許す、我慢する」。clarify は明確にする、implement は実行する、humiliate は恥をかかせる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Compared to Earth, the sun is __BLANK__. It would take over a million Earths to fill the volume of the sun.', '["massive", "amusing", "graceful", "hesitant"]', 0, '「太陽は地球と比べて巨大だ」は the sun is massive です。massive は「巨大な」。amusing は面白い、graceful は優雅な、hesitant は躊躇する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The men who escaped from prison __BLANK__ the police for three weeks, but they were finally caught and brought back.', '["evaded", "sterilized", "wrecked", "commuted"]', 0, '「3週間警察の手を逃れた」は evaded the police です。evade は「逃れる、かわす」。sterilize は消毒する、wreck は破壊する、commute は通勤する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The novel was fascinating because it told the same story from several different __BLANK__. Each character saw the events in a very different way.', '["reductions", "nominations", "maneuvers", "perspectives"]', 3, '「いくつかの異なる視点から」は from several different perspectives です。perspective は「視点、見方」。reduction は削減、nomination は指名、maneuver は操作。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Although the bedrooms in the apartment were quite __BLANK__, the kitchen and dining room were small, so the couple decided not to rent it.', '["supernatural", "cowardly", "spacious", "compliant"]', 2, '「寝室はかなり広かったが」は the bedrooms were quite spacious です。spacious は「広々とした」。supernatural は超自然の、cowardly は臆病な、compliant は従順な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The university will hold an event next month for graduating high school students who are thinking of __BLANK__ there next semester.', '["enrolling", "rebelling", "radiating", "solidifying"]', 0, '「来学期そこに入学することを考えている」は thinking of enrolling です。enroll は「入学する、登録する」。rebel は反逆する、radiate は放射する、solidify は固める。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Although the actual battle lasted for almost a week, the writer decided to __BLANK__ all the events into one day in his novel to make it more dramatic.', '["inhale", "haunt", "obstruct", "compress"]', 3, '「出来事を1日に圧縮した」は to compress all the events です。compress は「圧縮する、凝縮する」。inhale は吸い込む、haunt は出没する、obstruct は妨げる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The __BLANK__ between the two neighboring teams is very strong. Sometimes, the players have even fought during games.', '["forgery", "candidacy", "leniency", "rivalry"]', 3, '「隣接する2チームのライバル関係」は The rivalry between です。rivalry は「ライバル関係、競争」。forgery は偽造、candidacy は立候補、leniency は寛大さ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'A: Are you going anywhere for spring vacation, George? B: I have __BLANK__ plans to visit Spain, but I haven''t booked anything yet.', '["nutritious", "righteous", "tentative", "universal"]', 2, '「スペインに行く暫定的な予定」は have tentative plans です。tentative は「仮の、未確定の」。nutritious は栄養ある、righteous は正しい、universal は普遍的な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Medical students spend a lot of time studying human __BLANK__. They must memorize the terms for even the smallest parts of the body.', '["reprimand", "anatomy", "esteem", "distress"]', 1, '「人体の構造を学ぶ」は studying human anatomy です。anatomy は「解剖学、からだの構造」。reprimand は叱責、esteem は尊敬、distress は苦悩。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The store clerk told me my coupon was __BLANK__, so it could no longer be used. It had expired two months earlier.', '["acute", "rash", "invalid", "imminent"]', 2, '「クーポンは無効だった」は my coupon was invalid です。invalid は「無効な」。acute は鋭い、rash は軽率な・発疹、imminent は差し迫った。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The unclear wording of the law meant that it had been legally possible to avoid paying taxes. Many people took advantage of this __BLANK__ before the law was finally changed this year.', '["loophole", "stronghold", "blueprint", "aftermath"]', 0, '「この抜け穴を利用した」は took advantage of this loophole です。loophole は「（法律の）抜け穴」。stronghold は拠点、blueprint は設計図、aftermath は余波。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Christine loved __BLANK__ colors, so she filled her apartment with bright red, yellow, and orange furnishings.', '["vivid", "weary", "hazy", "feeble"]', 0, '「鮮やかな色が好きだった」は loved vivid colors です。vivid は「鮮やかな、生き生きした」。weary は疲れた、hazy はかすんだ、feeble は弱い。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Although Jeffrey claimed it was an accident, Gretchen believed that he __BLANK__ knocked her books to the floor in order to make her angry.', '["greedily", "obediently", "intentionally", "thoroughly"]', 2, '「わざと本を床に落とした」は intentionally knocked です。intentionally は「故意に」。greedily は貪欲に、obediently は従順に、thoroughly は徹底的に。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'In some countries, it is the __BLANK__ of families, not the government, to financially support senior citizens.', '["component", "obligation", "symptom", "resolution"]', 1, '「家族の義務である」は the obligation of families です。obligation は「義務」。component は構成要素、symptom は症状、resolution は決意・解決。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Although many people like the idea of online learning, others feel that it is important for students to __BLANK__ with other children in person.', '["interact", "collapse", "precede", "constrain"]', 0, '「他の子と直接交流することが大切」は to interact with other children です。interact は「交流する、かかわる」。collapse は崩れる、precede は先立つ、constrain は制約する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The mountain __BLANK__ was difficult and took six hours. The climbers had to use ropes and special equipment.', '["warranty", "fracture", "hazard", "ascent"]', 3, '「山の登攀は」は The mountain ascent です。ascent は「登ること、上昇」。warranty は保証、fracture は骨折、hazard は危険。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'When the two ships got too close, they __BLANK__. Fortunately, no one was seriously injured in the collision.', '["abide", "collide", "subside", "preside"]', 1, '「2隻の船が衝突した」は they collided です。collide は「衝突する」。abide は従う、subside は静まる、preside は主宰する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'To fix the computer, you need to __BLANK__ the power supply from the motherboard first. Make sure the power is off.', '["detach", "tame", "unfold", "bundle"]', 0, '「電源をマザーボードから外す」は detach the power supply です。detach は「取り外す」。tame は飼いならす、unfold は広げる、bundle は束ねる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The new manager was given full __BLANK__ to make decisions about the sales team. She did not need to ask for approval from headquarters.', '["ransom", "precaution", "autonomy", "conservation"]', 2, '「販売チームについて完全な裁量権を与えられた」は full autonomy to make decisions です。autonomy は「自律、裁量権」。ransom は身代金、precaution は予防、conservation は保存。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Tokyo is a __BLANK__ city with people from all over the world. You can find restaurants serving cuisine from almost every country.', '["gloomy", "tender", "cosmopolitan", "menacing"]', 2, '「世界各国から人が集まる都市」は a cosmopolitan city です。cosmopolitan は「国際的な、多様な」。gloomy は陰気な、tender は柔らかい、menacing は脅すような。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'There was a __BLANK__ of happiness in her eyes when she heard the news. She had been waiting for that moment for years.', '["perch", "breeze", "gleam", "sizzle"]', 2, '「目に喜びの輝きがあった」は a gleam of happiness in her eyes です。gleam は「かすかな光、きらめき」。perch は止まり木、breeze はそよ風、sizzle はじゅうじゅういう音。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Three boys were trying to enter the park late at night when they __BLANK__ an alarm. They ran away as soon as they heard it.', '["pressed for", "put through", "forked over", "set off"]', 3, '「警報を鳴らしてしまった」は set off an alarm です。set off で「（警報などを）作動させる」。press for は強く求める、put through は電話をつなぐ、fork over は金を払う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Richard decided to __BLANK__ the job offer from the large company. Although the pay was good, he did not want to relocate his family to a new city.', '["work through", "pass up", "plow through", "wind up"]', 1, '「大企業のオファーを断ることにした」は decided to pass up the job offer です。pass up で「（機会などを）見送る、断る」。work through は乗り越える、plow through は突破する、wind up は結局〜する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company wants to try all other options first, but it cannot __BLANK__ reducing its staff if its poor sales continue.', '["sound off", "draw back", "turn up", "rule out"]', 3, '「売上不振が続けば人員削減の可能性を排除できない」は cannot rule out reducing です。rule out で「〜の可能性を排除する」。sound off は意見を述べる、draw back は手を引く、turn up は現れる・音量を上げる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The movie star asked the journalist to __BLANK__ after the interview. She promised to give him an exclusive story if he did.', '["chip in", "pull off", "stick around", "bear up"]', 2, '「インタビュー後に残ってほしいと頼んだ」は asked the journalist to stick around です。stick around で「その場に残る、待つ」。chip in は金を出し合う、pull off は成し遂げる、bear up は持ちこたえる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The city plans to __BLANK__ the old theater and build a new one in the same place, but many residents are unhappy about the plan.', '["tune up", "touch on", "tear down", "free up"]', 2, '「古い劇場を取り壊す」は tear down the old theater です。tear down で「取り壊す」。tune up は調整する、touch on は言及する、free up は空ける。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'A: How long will it take to __BLANK__ from the mountaintop, Jane? B: About three hours, but it will take longer if we walk at a slow pace.', '["get down", "round out", "die away", "lay out"]', 0, '「山頂から下りるのに」は to get down from the mountaintop です。get down で「降りる」。round out は完成させる、die away は消えていく、lay out は配置する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'After retirement, many people __BLANK__ new hobbies that they did not have time for when they were working.', '["root out", "pass for", "take up", "blow up"]', 2, '「退職後に新しい趣味を始める」は take up new hobbies です。take up で「（趣味・活動を）始める」。root out は根絶する、pass for は〜に見える、blow up は爆発する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'It took two weeks, but police were finally able to __BLANK__ the thieves using video from a security camera and fingerprints left at the crime scene.', '["bulk up", "track down", "lay off", "pick on"]', 1, '「防犯カメラと指紋で泥棒を突き止めた」は were able to track down the thieves です。track down で「追跡して見つける」。bulk up は筋肉をつける、lay off は解雇する、pick on はいじめる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'When the storm hit, the hikers __BLANK__ for the nearest shelter. They knew they had to get off the mountain before dark.', '["lived off", "made for", "passed on", "wiped out"]', 1, '「最も近い避難所に向かった」は made for the nearest shelter です。make for で「〜に向かって進む」。live off は〜で暮らす、pass on は伝える、wipe out は全滅させる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Nobody wanted to __BLANK__ the responsibility for the failed project, but someone had to explain what went wrong to the board.', '["iron out", "toss in", "take on", "size up"]', 2, '「失敗したプロジェクトの責任を引き受けたがらなかった」は to take on the responsibility です。take on で「（責任・仕事を）引き受ける」。iron out は解決する、toss in は投げ入れる、size up は見積もる。');

-- ========== 単語・熟語 続き（51〜100） ==========

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The judge __BLANK__ the defendant to five years in prison. The crime was considered too serious for a lighter sentence.', '["sentenced", "suspended", "surrendered", "sustained"]', 0, '「被告に5年の刑を言い渡した」は sentenced the defendant to です。sentence は「（刑を）言い渡す」。suspend は停止する、surrender は降伏する、sustain は支える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The report __BLANK__ that the new policy could have unintended effects on small businesses. Officials are reviewing the draft.', '["cautioned", "celebrated", "circulated", "compensated"]', 0, '「新政策が中小企業に予期せぬ影響を与える可能性があると警告した」は the report cautioned that です。caution は「警告する」。celebrate は祝う、circulate は回す、compensate は補償する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The __BLANK__ of the contract was delayed because both sides could not agree on the final terms.', '["negotiation", "navigation", "nomination", "notification"]', 0, '「契約の交渉が遅れた」は The negotiation of the contract です。negotiation は「交渉」。navigation は航行、nomination は指名、notification は通知。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Scientists have __BLANK__ a link between lack of sleep and heart disease. Further studies are needed to confirm the findings.', '["identified", "ignored", "imagined", "imported"]', 0, '「睡眠不足と心臓病の関連を特定した」は have identified a link です。identify は「特定する、見極める」。ignore は無視する、imagine は想像する、import は輸入する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The witness was __BLANK__ when asked about the accident. She could not remember the exact sequence of events.', '["vague", "valid", "vital", "voluntary"]', 0, '「事故について聞かれたとき証人は曖昧だった」は the witness was vague です。vague は「曖昧な、はっきりしない」。valid は有効な、vital は不可欠な、voluntary は自発的な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The government has promised to __BLANK__ funding for the arts. Many museums and theaters depend on this support.', '["maintain", "minimize", "multiply", "migrate"]', 0, '「芸術への助成を維持すると約束した」は has promised to maintain funding です。maintain は「維持する」。minimize は最小化する、multiply は増やす、migrate は移住する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The committee will __BLANK__ the proposal at next week''s meeting. They need more time to review the details.', '["debate", "deceive", "declare", "decrease"]', 0, '「来週の会議で提案を討議する」は will debate the proposal です。debate は「討議する、議論する」。deceive はだます、declare は宣言する、decrease は減らす。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'Her __BLANK__ to succeed made her work long hours. She was determined to get promoted within a year.', '["ambition", "allergy", "allowance", "agenda"]', 0, '「成功への野心が」は Her ambition to succeed です。ambition は「野心、大志」。allergy はアレルギー、allowance は手当、agenda は議題。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The lawyer __BLANK__ the contract carefully before advising her client to sign it. She found several clauses that needed to be changed.', '["scrutinized", "simplified", "stimulated", "submitted"]', 0, '「契約を注意深く精査した」は scrutinized the contract です。scrutinize は「精査する、細かく調べる」。simplify は簡略化する、stimulate は刺激する、submit は提出する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The __BLANK__ of the new software has been postponed. The development team needs more time to fix the bugs.', '["launch", "leisure", "legacy", "liability"]', 0, '「新ソフトのリリースが延期された」は The launch of the new software です。launch は「発売、打ち上げ」。leisure は余暇、legacy は遺産、liability は責任。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The senator __BLANK__ the bill, saying it would harm the environment. She urged her colleagues to vote against it.', '["opposed", "observed", "obtained", "occupied"]', 0, '「その法案に反対した」は the senator opposed the bill です。oppose は「反対する」。observe は観察する、obtain は得る、occupy は占める。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The doctor __BLANK__ the patient to avoid strenuous exercise for at least two weeks. The injury needed time to heal.', '["instructed", "insured", "interrupted", "invaded"]', 0, '「患者に少なくとも2週間激しい運動を避けるよう指示した」は instructed the patient to avoid です。instruct は「指示する」。insure は保険をかける、interrupt は邪魔する、invade は侵略する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company''s __BLANK__ growth has attracted the attention of investors. Its stock price has doubled in the past year.', '["substantial", "suspicious", "symbolic", "systematic"]', 0, '「会社の実質的な成長が」は the company''s substantial growth です。substantial は「相当な、実質的な」。suspicious は疑わしい、symbolic は象徴的な、systematic は体系的な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The witness refused to __BLANK__ in court. She said she was afraid of what might happen to her family.', '["testify", "terminate", "tolerate", "transform"]', 0, '「法廷で証言することを拒んだ」は refused to testify です。testify は「証言する」。terminate は終了させる、tolerate は許す、transform は変える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The artist''s work has been __BLANK__ by critics as groundbreaking. Her new exhibition has drawn large crowds.', '["hailed", "halted", "handled", "harbored"]', 0, '「批評家に画期的だと称賛された」は has been hailed by critics です。hail は「称賛する、呼び止める」。halt は止める、handle は扱う、harbor は抱く。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The manager had to __BLANK__ the dispute between the two employees. They had been arguing for weeks and it was affecting the team.', '["resolve", "resort", "retreat", "revise"]', 0, '「二人の従業員の争いを解決しなければならなかった」は had to resolve the dispute です。resolve は「解決する」。resort は頼る、retreat は退く、revise は改訂する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The newspaper __BLANK__ an apology for the inaccurate article. The editor said the paper would be more careful in the future.', '["issued", "isolated", "ignited", "inherited"]', 0, '「不正確な記事について謝罪を出した」は issued an apology です。issue は「発表する、出す」。isolate は隔離する、ignite は点火する、inherit は相続する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The new regulations will __BLANK__ from next month. All companies must ensure they are in compliance by then.', '["take effect", "take place", "take part", "take care"]', 0, '「来月から新規則が効力を持つ」は will take effect from next month です。take effect で「効力を発する」。take place は起こる、take part は参加する、take care は気をつける。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The professor __BLANK__ the importance of citing sources in academic papers. Plagiarism can result in serious consequences.', '["emphasized", "eliminated", "embarrassed", "encountered"]', 0, '「学術論文で出典を明示する重要性を強調した」は emphasized the importance of です。emphasize は「強調する」。eliminate は除去する、embarrass は恥ずかしがらせる、encounter は遭遇する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The union decided to __BLANK__ the strike after the company agreed to raise wages. The negotiations had lasted for three weeks.', '["call off", "call on", "call for", "call up"]', 0, '「会社が賃金引き上げに同意したのでストライキを取りやめた」は decided to call off the strike です。call off で「中止する」。call on は訪ねる、call for は求める、call up は電話する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The researcher __BLANK__ her findings at the international conference. Her presentation was well received by the audience.', '["presented", "preserved", "pretended", "prevented"]', 0, '「国際会議で研究結果を発表した」は presented her findings です。present は「発表する、提示する」。preserve は保存する、pretend はふりをする、prevent は防ぐ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The government has __BLANK__ a committee to investigate the scandal. The report is expected to be completed by the end of the year.', '["set up", "set out", "set aside", "set back"]', 0, '「スキャンダル調査のため委員会を設置した」は has set up a committee です。set up で「設置する、立ち上げる」。set out は出発する、set aside は取っておく、set back は遅らせる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The athlete had to __BLANK__ from the competition due to a knee injury. She hopes to return next season.', '["withdraw", "withstand", "wither", "witness"]', 0, '「膝の怪我で競技から撤退しなければならなかった」は had to withdraw from です。withdraw は「撤退する、取り下げる」。withstand は耐える、wither は枯れる、witness は目撃する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The judge __BLANK__ the evidence as insufficient. The defendant was released due to lack of proof.', '["dismissed", "disposed", "disputed", "distributed"]', 0, '「証拠を不十分として退けた」は dismissed the evidence です。dismiss は「却下する、退ける」。dispose は処分する、dispute は争う、distribute は配る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company tried to __BLANK__ the negative news by releasing a statement. However, the damage to its reputation had already been done.', '["counter", "couple", "counsel", "conceal"]', 0, '「声明を出して悪いニュースに対抗しようとした」は tried to counter the negative news です。counter は「対抗する、反論する」。couple は結びつける、counsel は助言する、conceal は隠す。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The __BLANK__ of the new policy is still unclear. Officials are waiting for more data before making a final decision.', '["efficiency", "eligibility", "effectiveness", "emergency"]', 2, '「新政策の有効性はまだ不明だ」は The effectiveness of the new policy です。effectiveness は「有効性、効果」。efficiency は効率、eligibility は資格、emergency は緊急。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The author __BLANK__ her latest novel in just six months. She said the characters had been in her mind for years.', '["completed", "complicated", "complained", "complied"]', 0, '「最新の小説をわずか6か月で完成させた」は completed her latest novel です。complete は「完成させる」。complicate は複雑にする、complain は不平を言う、comply は従う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The museum will __BLANK__ the rare painting for the next three months. Visitors will need to book in advance to see it.', '["exhibit", "exclude", "exhaust", "expand"]', 0, '「今後3か月その貴重な絵を展示する」は will exhibit the rare painting です。exhibit は「展示する」。exclude は除外する、exhaust は使い果たす、expand は拡大する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The committee will __BLANK__ next Tuesday to discuss the budget. All department heads have been asked to attend.', '["convene", "consent", "consist", "consult"]', 0, '「来週火曜に委員会が招集される」は The committee will convene です。convene は「招集する、集まる」。consent は同意する、consist は成り立つ、consult は相談する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The journalist was __BLANK__ from the press conference for asking inappropriate questions. The organizers said he had violated the rules.', '["ejected", "elected", "elevated", "eliminated"]', 0, '「不適切な質問をしたため記者会見から退場させられた」は was ejected from です。eject は「追い出す、退場させる」。elect は選出する、elevate は上げる、eliminate は除去する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The government has __BLANK__ a ban on single-use plastics. The new law will come into force next year.', '["imposed", "implied", "imported", "improved"]', 0, '「使い捨てプラスチックの禁止を課した」は has imposed a ban です。impose は「課する、押しつける」。imply はほのめかす、import は輸入する、improve は改善する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The doctor __BLANK__ the patient that the surgery had been successful. She would be able to go home within a few days.', '["assured", "assessed", "assigned", "assisted"]', 0, '「手術は成功したと患者に保証した」は assured the patient that です。assure は「保証する、安心させる」。assess は評価する、assign は割り当てる、assist は援助する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company had to __BLANK__ its expansion plans due to the economic downturn. It will focus on its core business instead.', '["abandon", "abolish", "absorb", "abstract"]', 0, '「景気後退のため拡大計画を断念しなければならなかった」は had to abandon its expansion plans です。abandon は「断念する、捨てる」。abolish は廃止する、absorb は吸収する、abstract は抽象化する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The __BLANK__ of the two companies will create one of the largest firms in the industry. The deal is expected to close next quarter.', '["merger", "margin", "manual", "manner"]', 0, '「2社の合併が」は The merger of the two companies です。merger は「合併」。margin は余白・利幅、manual は手引き、manner はやり方。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The teacher __BLANK__ the students for their poor behavior. She said they would not be allowed to go on the trip if it continued.', '["reprimanded", "rewarded", "replaced", "reported"]', 0, '「行儀の悪さで生徒を叱った」は reprimanded the students です。reprimand は「叱責する」。reward は報いる、replace は取り替える、report は報告する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The scientist __BLANK__ that the discovery could lead to new treatments for the disease. More research is needed to confirm this.', '["speculated", "specified", "sponsored", "stabilized"]', 0, '「その発見が病気の新治療につながる可能性があると推測した」は speculated that です。speculate は「推測する」。specify は特定する、sponsor は後援する、stabilize は安定させる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The hotel had to __BLANK__ several guests because of the fire alarm. Everyone was allowed back in after the building was checked.', '["evacuate", "evaluate", "evaporate", "evolve"]', 0, '「火災警報のため数人の客を避難させなければならなかった」は had to evacuate several guests です。evacuate は「避難させる」。evaluate は評価する、evaporate は蒸発する、evolve は進化する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The manager decided to __BLANK__ the meeting until everyone could attend. The new date will be announced by email.', '["postpone", "possess", "portray", "presume"]', 0, '「全員が参加できるまで会議を延期することにした」は decided to postpone the meeting です。postpone は「延期する」。possess は所有する、portray は描く、presume は推測する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The report __BLANK__ a significant increase in pollution levels over the past decade. Immediate action is recommended.', '["documents", "donates", "doubts", "drafts"]', 0, '「過去10年で汚染レベルが大幅に増加したことを記録している」は the report documents です。document は「記録する、文書化する」。donate は寄付する、doubt は疑う、draft は下書きする。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The politician had to __BLANK__ the allegations before they damaged his career. He held a press conference to explain his position.', '["address", "adopt", "admire", "advise"]', 0, '「キャリアを傷つける前に疑惑に対処しなければならなかった」は had to address the allegations です。address は「（問題に）対処する」。adopt は採用する、admire は賞賛する、advise は助言する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company will __BLANK__ its workforce by 10 percent to cut costs. The layoffs will affect several departments.', '["reduce", "revive", "revise", "reveal"]', 0, '「コスト削減のため従業員を10％削減する」は will reduce its workforce です。reduce は「減らす」。revive は復活させる、revise は改訂する、reveal は明らかにする。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The artist''s early works were __BLANK__ by the public. It was only after his death that they gained recognition.', '["overlooked", "overcome", "overdone", "overdue"]', 0, '「芸術家の初期作品は一般に見過ごされていた」は were overlooked by the public です。overlook は「見過ごす、見落とす」。overcome は克服する、overdone はやりすぎの、overdue は期限過ぎの。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The committee will __BLANK__ the applications and announce the results next month. There were over five hundred submissions.', '["review", "reverse", "revive", "reward"]', 0, '「申請を審査し来月結果を発表する」は will review the applications です。review は「審査する、検討する」。reverse は逆にする、revive は復活させる、reward は報いる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The new law will __BLANK__ employers from discriminating against workers based on their age. Violations will result in heavy fines.', '["prohibit", "promote", "propose", "protect"]', 0, '「雇用主が年齢を理由に労働者を差別することを禁止する」は will prohibit employers from です。prohibit は「禁止する」。promote は促進する、propose は提案する、protect は守る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The professor __BLANK__ the students to read the entire chapter before the next class. He said there would be a quiz.', '["urged", "used", "united", "updated"]', 0, '「次の授業までに章全体を読むよう学生に促した」は urged the students to read です。urge は「促す、強く勧める」。use は使う、unite は団結させる、update は更新する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company had to __BLANK__ its product after several customers reported safety issues. A full recall was announced.', '["recall", "receive", "recent", "reckon"]', 0, '「安全上の問題が報告されたため製品を回収しなければならなかった」は had to recall its product です。recall は「回収する、思い出す」。receive は受け取る、recent は最近の、reckon は考える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The diplomat worked to __BLANK__ tensions between the two countries. She held several rounds of secret talks.', '["ease", "earn", "edit", "elect"]', 0, '「両国間の緊張を和らげるよう努めた」は worked to ease tensions です。ease は「和らげる」。earn は稼ぐ、edit は編集する、elect は選出する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The journalist was determined to __BLANK__ the truth about the scandal. She spent months investigating the story.', '["uncover", "undergo", "underline", "undertake"]', 0, '「スキャンダルの真実を暴く決意だった」は was determined to uncover the truth です。uncover は「暴く、明らかにする」。undergo は経験する、underline は下線を引く、undertake は引き受ける。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The judge __BLANK__ the jury to consider only the evidence presented in court. They should not be influenced by outside information.', '["instructed", "insured", "intended", "interpreted"]', 0, '「陪審に法廷で提示された証拠だけを考慮するよう指示した」は instructed the jury to consider です。instruct は「指示する」。insure は保険をかける、intend は意図する、interpret は解釈する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The government has promised to __BLANK__ the cost of the project. No additional taxes will be needed to fund it.', '["cover", "create", "credit", "criticize"]', 0, '「プロジェクトの費用を負担すると約束した」は has promised to cover the cost です。cover は「（費用を）負担する」。create は作る、credit は信用する、criticize は批判する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The researcher had to __BLANK__ his theory when new evidence emerged. The data did not support his original hypothesis.', '["revise", "revive", "reveal", "reverse"]', 0, '「新証拠が出て理論を修正しなければならなかった」は had to revise his theory です。revise は「修正する、改訂する」。revive は復活させる、reveal は明らかにする、reverse は逆にする。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The athlete''s __BLANK__ performance at the Olympics won her a gold medal. She broke the world record in the final.', '["outstanding", "outgoing", "outdated", "outspoken"]', 0, '「オリンピックでの傑出した演技が」は the athlete''s outstanding performance です。outstanding は「傑出した、未払いの」。outgoing は外向的な、outdated は時代遅れの、outspoken は率直な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company decided to __BLANK__ the project after it failed to attract enough investors. The idea was good but the timing was wrong.', '["scrap", "scrub", "seal", "seek"]', 0, '「十分な投資家が集まらなかったためプロジェクトを廃止することにした」は decided to scrap the project です。scrap は「廃棄する、やめる」。scrub はこする、seal は封をする、seek は求める。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The professor''s __BLANK__ on the subject was widely respected. She had published over fifty papers in the field.', '["expertise", "expense", "explosion", "expression"]', 0, '「その分野での教授の専門知識は広く尊敬されていた」は the professor''s expertise です。expertise は「専門知識、熟練」。expense は費用、explosion は爆発、expression は表現。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The police had to __BLANK__ the building when they received a bomb threat. Everyone inside was evacuated safely.', '["seal off", "see off", "sell out", "set out"]', 0, '「爆弾の脅迫を受けて建物を封鎖しなければならなかった」は had to seal off the building です。seal off で「封鎖する」。see off は見送る、sell out は売り切れる、set out は出発する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The director decided to __BLANK__ the scene because it was too violent. The film would have received a stricter rating otherwise.', '["cut out", "cut in", "cut off", "cut down"]', 0, '「そのシーンは暴力的すぎるのでカットすることにした」は decided to cut out the scene です。cut out で「削除する、やめる」。cut in は割り込む、cut off は遮る、cut down は減らす。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The team had to __BLANK__ without their star player, who was injured. They still managed to win the match.', '["get by", "get away", "get across", "get ahead"]', 0, '「怪我した主力選手なしでなんとかやらなければならなかった」は had to get by without です。get by で「なんとかやっていく」。get away は逃げる、get across は伝える、get ahead は出世する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The manager asked the staff to __BLANK__ the new software before the official launch. Their feedback would help improve the product.', '["try out", "turn out", "take out", "throw out"]', 0, '「正式リリース前に新ソフトを試してほしいと頼んだ」は asked the staff to try out です。try out で「試す、試用する」。turn out は判明する、take out は取り出す、throw out は捨てる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('準1級', 'short_fill', 'The company had to __BLANK__ to the demands of the union after a week-long strike. The workers had refused to return until their conditions were met.', '["give in", "give up", "give out", "give off"]', 0, '「1週間のストの後、組合の要求に屈しなければならなかった」は had to give in to the demands です。give in で「屈する、譲歩する」。give up はあきらめる、give out は配る、give off は発する。');
