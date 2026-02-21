-- seed_reading_short_1kyu_100.sql
-- 英検1級 短文の語句空所補充 100問
-- 出題傾向: 高度な単語約55%・句動詞・イディオム約45%（大問1のレベル感に準拠）
-- 実行: マイグレーション 028, 030 適用後、本ファイルを実行

-- ========== 単語・句動詞（1〜55） ==========

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Police were sent into the streets to __BLANK__ the riots. However, instead of restoring peace, their presence only led to more violence.', '["taint", "jilt", "scour", "quell"]', 3, '「暴動を鎮圧するために」は to quell the riots です。quell は「鎮める、鎮圧する」。taint は汚す、jilt は振る、scour は徹底的に探す。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'After arguing for an hour, the couple finally discovered the __BLANK__ of their problems. They had fundamentally different values when it came to finances.', '["poise", "loam", "crux", "ward"]', 2, '「問題の核心」は the crux of their problems です。crux は「核心、最重要点」。poise は落ち着き、loam は壌土、ward は病棟・区。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'A: Ibrahim, I was surprised you didn''t __BLANK__ when we were talking about the budget at the meeting. You know more about it than anyone else. B: Well, I was going to say something, but I agreed with everything that Alice said.', '["weigh in", "scrub up", "black out", "crouch down"]', 0, '「議論に加わらなかった」は didn''t weigh in です。weigh in で「議論に意見を述べる、参加する」。scrub up は手を洗う、black out は気絶する、crouch down はしゃがむ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'A: How much did you __BLANK__ for that fancy new car you''re driving, Tom? It couldn''t have been cheap. B: It wasn''t, Pam, but I got a raise and a large bonus this quarter.', '["hang on", "while away", "zip up", "shell out"]', 3, '「いくら払ったか」は how much did you shell out です。shell out で「（多額を）支払う」。hang on は待つ、while away は時間を潰す、zip up はチャックを閉める。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Every summer, tens of thousands of tourists __BLANK__ the small town for the festival. Their sudden arrival creates traffic problems, overcrowding, and noise that bother the residents.', '["snap at", "carve out", "descend on", "lay up"]', 2, '「大勢の観光客がその町に押し寄せる」は tourists descend on the town です。descend on で「（大勢が）押し寄せる」。snap at は噛みつく、carve out は切り開く、lay up は寝かせる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Reina joined the fencing team and discovered that she had a natural talent for the sport. Her opponents were unable to __BLANK__ her attacks, so she usually won her matches.', '["clam up", "fend off", "run over", "fly into"]', 1, '「彼女の攻撃を防げなかった」は were unable to fend off her attacks です。fend off で「防ぐ、かわす」。clam up は黙る、run over は轢く、fly into は〜に激怒する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'As well as being a successful businessman, Mr. Gibbons is known for his __BLANK__. He donates money to several charities and often gives speeches at local schools free of charge.', '["callousness", "impudence", "treachery", "benevolence"]', 3, '「慈善活動で知られている」は known for his benevolence です。benevolence は「善意、慈恵」。callousness は冷淡さ、impudence は厚かましさ、treachery は裏切り。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The homeland of the ethnic minority group __BLANK__s an international border. Because of this, there are cases in which members of the same family live in different countries.', '["straddles", "abates", "coddles", "recedes"]', 0, '「その少数民族の故郷は国境にまたがっている」は straddles an international border です。straddle は「またがる、跨ぐ」。abate は弱まる、coddle は甘やかす、recede は後退する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The lifeguard told the children that if they kept __BLANK__ disregarding the rules by running in the area around the pool, they would have to leave.', '["fortuitously", "profusely", "blatantly", "dubiously"]', 2, '「規則をあからさまに無視し続けるなら」は kept blatantly disregarding です。blatantly は「あからさまに、露骨に」。fortuitously は偶然に、profusely は豊富に、dubiously は疑わしげに。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'After many hours of __BLANK__, the committee finally agreed on a design for the new company logo.', '["deliberation", "abolition", "restitution", "expulsion"]', 0, '「何時間もの審議の末」は After many hours of deliberation です。deliberation は「審議、熟考」。abolition は廃止、restitution は返還、expulsion は追放。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'We were all __BLANK__ by the figure skater''s performance. Her movements were so graceful that no one could take their eyes off her.', '["denounced", "banished", "postulated", "mesmerized"]', 3, '「フィギュアスケーターの演技に皆魅了された」は were all mesmerized by です。mesmerize は「魅了する、夢中にさせる」。denounce は非難する、banish は追放する、postulate は仮定する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The cruel dictator was __BLANK__ by the people, so there were celebrations in the streets when he was finally forced out of power.', '["devoured", "reviled", "ruffled", "deranged"]', 1, '「残忍な独裁者は国民に憎まれた」は was reviled by the people です。revile は「ののしる、酷く嫌う」。devour は食い尽くす、ruffle はくしゃくしゃにする、derange は狂わせる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Laura often used to __BLANK__ on her school assignments, but now she starts working on them as soon as her teachers give them to her.', '["transcend", "procrastinate", "evangelize", "elucidate"]', 1, '「課題を先延ばしにしていた」は used to procrastinate on です。procrastinate は「先延ばしにする」。transcend は超越する、evangelize は伝道する、elucidate は解明する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The new theme park has been a real __BLANK__ to the area, bringing in millions of tourists every year.', '["boon", "prose", "tremor", "dent"]', 0, '「この地域にとって本当の恩恵となっている」は a real boon to the area です。boon は「恩恵、ありがたいもの」。prose は散文、tremor は震え、dent はへこみ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'I can''t believe I was __BLANK__ into buying such a bad car. It was a total waste of money! B: I told you to get a second opinion before making the purchase.', '["jilted", "duped", "slanted", "scampered"]', 1, '「そんな悪い車を買わされた」は was duped into buying です。dupe は「だまして〜させる」。jilt は振る、slant は傾ける、scamper は走り回る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'When the man lost his job, he had no choice but to __BLANK__ his watch. It was a last-ditch effort to raise enough money to pay his rent.', '["scrawl", "percolate", "pawn", "sully"]', 2, '「時計を質に入れた」は to pawn his watch です。pawn は「質に入れる」。scrawl は走り書きする、percolate は浸透する、sully は汚す。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'With the final exams just a month away, now is the time for students to __BLANK__ and study hard. There will be plenty of time for relaxation after school is finished.', '["pony up", "buckle down", "foul up", "cast down"]', 1, '「今こそ本気で勉強する時だ」は to buckle down and study です。buckle down で「本腰を入れる、真剣に取り組む」。pony up は金を払う、foul up は台無しにする、cast down は落胆させる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'An increase in drunk drivers has caused police to __BLANK__. They are setting up roadblocks and giving random breath tests.', '["breeze in", "branch off", "crack down", "lop off"]', 2, '「飲酒運転の増加で警察が取り締まりを強化した」は caused police to crack down です。crack down で「厳しく取り締まる」。breeze in はふらりと入る、branch off は分岐する、lop off は切り落とす。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'When his friend from another town suddenly arrived, Rick had to __BLANK__ some food and drink quickly. Luckily, he had some snacks and soda in his refrigerator.', '["dwell on", "reel off", "rustle up", "haul off"]', 2, '「急いで食べ物と飲み物を用意しなければならなかった」は had to rustle up some food です。rustle up で「急いで用意する、こしらえる」。dwell on はくよくよ考える、reel off は淀みなく言う、haul off は殴りかかる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'When unexpected problems __BLANK__, it is important to remain calm and think logically about how to solve them.', '["fritter away", "rip off", "sound off", "crop up"]', 3, '「予期せぬ問題が起きたとき」は When unexpected problems crop up です。crop up で「突然現れる、発生する」。fritter away は浪費する、rip off はぼる、sound off は意見を述べる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The bank''s high-tech safe-deposit boxes are thought to be __BLANK__. "We are 100 percent confident no one can break into the boxes to steal our customers'' valuables," said the manager.', '["enervating", "jarring", "impregnable", "precocious"]', 2, '「金庫は侵入不可能と考えられている」は are thought to be impregnable です。impregnable は「難攻不落の、侵入できない」。enervating は衰弱させる、jarring は不快な、precocious は早熟な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Astronauts bravely risk their lives in order to explore space. The reward for these __BLANK__ people, though, is a view unlike any other.', '["diminutive", "superficial", "tedious", "intrepid"]', 3, '「これらの勇敢な人々」は these intrepid people です。intrepid は「勇敢な、大胆な」。diminutive は小さい、superficial は表面的な、tedious は退屈な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'After being __BLANK__ for nearly a decade, it was difficult for Brian to adjust to life outside of prison.', '["proclaimed", "quenched", "incarcerated", "synthesized"]', 2, '「約10年投獄された後」は After being incarcerated for です。incarcerate は「投獄する」。proclaim は宣言する、quench は消す、synthesize は合成する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Relations between the two countries are in a state of __BLANK__, and neither side is willing to sit down to work out a solution.', '["discord", "heresy", "credence", "germination"]', 0, '「両国関係は不和の状態にある」は in a state of discord です。discord は「不和、争い」。heresy は異端、credence は信用、germination は発芽。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The politician was caught on camera attempting to pay off a reporter __BLANK__. He thought no one would see him, but the camera''s zoom lens revealed everything.', '["deferentially", "sequentially", "slenderly", "discreetly"]', 3, '「記者にこっそり賄賂を渡そうとした」は to pay off a reporter discreetly です。discreetly は「控えめに、人目を避けて」。deferentially は恭しく、sequentially は順番に、slenderly は細く。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'A: Have you received the __BLANK__ of tools we ordered? B: No, but the supplier says it should arrive within the week.', '["liaison", "entreaty", "levity", "consignment"]', 3, '「注文した工具の配送物」は the consignment of tools です。consignment は「配送品、委託販売」。liaison は連絡、entreaty は懇願、levity は軽率さ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The candidate''s campaign was undermined by the __BLANK__ of her character through persistent rumors and lies spread by her opponents.', '["buttressing", "assassination", "digression", "coup"]', 1, '「彼女の人格に対する中傷で」は the assassination of her character です。character assassination で「人格攻撃、中傷」。buttress は支える、digression は脱線、coup はクーデター。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The journalist was fired for publishing __BLANK__ articles. His claims were often based on little to no evidence.', '["spurious", "ailing", "overt", "magnanimous"]', 0, '「虚偽の記事を書いたため解雇された」は for publishing spurious articles です。spurious は「偽りの、根拠のない」。ailing は病んでいる、overt は明白な、magnanimous は寛大な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'There was a time when solar power was not considered a __BLANK__ energy source. Now, however, it is commonly used in homes and businesses.', '["viable", "jammed", "reticent", "slick"]', 0, '「太陽光は実用可能なエネルギー源とは見なされていなかった」は not considered a viable energy source です。viable は「実行可能な、持続可能な」。jammed は詰まった、reticent は無口な、slick は滑るような。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Pilots were ordered to __BLANK__ from the original flight path because of an approaching storm. The new route allowed them to avoid any dangerous weather.', '["exude", "deviate", "crucify", "agonize"]', 1, '「元の航路からそれるよう命じられた」は were ordered to deviate from です。deviate は「それる、逸脱する」。exude は滲み出す、crucify は磔にする、agonize は苦悩する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The young man feared speaking in public more than anything. When he had to give a speech at his graduation, he stood __BLANK__ on stage, unable to say a word.', '["petrified", "rectified", "dignified", "gratified"]', 0, '「壇上で恐怖で固まって立っていた」は stood petrified on stage です。petrified は「恐怖で固まった」。rectify は正す、dignified は威厳のある、gratified は満足した。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The politician had three cars and a huge house with a swimming pool. Many people thought his __BLANK__ lifestyle was not appropriate for someone who claimed to speak for the poor.', '["lavish", "impromptu", "vigilant", "endemic"]', 0, '「彼の贅沢な生活様式」は his lavish lifestyle です。lavish は「贅沢な、惜しみない」。impromptu は即興の、vigilant は警戒している、endemic は固有の。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Although the war had started as the result of a serious __BLANK__ between the two countries, negotiators were finally able to solve the issue and bring peace to the region.', '["gentry", "squad", "parchment", "rift"]', 3, '「両国間の深刻な亀裂の結果」は as the result of a serious rift です。rift は「亀裂、不和」。gentry は上流階級、squad は班、parchment は羊皮紙。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Sandra is known to be a particularly __BLANK__ lawyer because of her ability to skillfully debate cases and find clever applications of the law.', '["sluggish", "adroit", "cranky", "distasteful"]', 1, '「特に腕の立つ弁護士」は a particularly adroit lawyer です。adroit は「巧みな、器用な」。sluggish は鈍い、cranky は不機嫌な、distasteful は不快な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'As a boss, Randall was terribly __BLANK__. He changed his mind frequently without committing to a specific vision to work toward.', '["corpulent", "meticulous", "capricious", "peripheral"]', 2, '「上司として非常に気まぐれだった」は was terribly capricious です。capricious は「気まぐれな、変わりやすい」。corpulent は肥満の、meticulous は几帳面な、peripheral は周辺の。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'After years of suffering from a trade imbalance, the country began to demand a more __BLANK__ exchange of goods with its neighbors.', '["maternal", "erratic", "menacing", "equitable"]', 3, '「より公平な貿易を要求し始めた」は a more equitable exchange です。equitable は「公平な」。maternal は母性的な、erratic は不安定な、menacing は脅すような。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The __BLANK__ comments made by the film critic upset the director. She felt that his harsh remarks about the acting and script were unfair.', '["caustic", "ticklish", "subversive", "impromptu"]', 0, '「批評家の辛辣なコメントが」は The caustic comments です。caustic は「辛辣な、痛烈な」。ticklish は扱いにくい、subversive は破壊的な、impromptu は即興の。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The politician''s comments on social issues have __BLANK__ a large number of voters. He is now working hard to change their negative opinion of him.', '["repulsed", "extolled", "conciliated", "bungled"]', 0, '「有権者を遠ざけてしまった」は have repulsed a large number of voters です。repulse は「嫌悪させる、撃退する」。extol は称賛する、conciliate は和解させる、bungle はやり損なう。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The man was so tired that he could not help but __BLANK__ during the meeting, even though he did his best to stay awake.', '["nod off", "pipe down", "drone on", "crank out"]', 0, '「会議中に居眠りせずにいられなかった」は could not help but nod off です。nod off で「居眠りする」。pipe down は静かにする、drone on はだらだら話す、crank out は大量に作る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The man refused to __BLANK__ to his crime. Even when the police showed him video footage of himself committing it, he still denied it.', '["tail off", "patch up", "choke off", "own up"]', 3, '「自分の罪を認めることを拒んだ」は refused to own up to his crime です。own up で「白状する、認める」。tail off は弱くなる、patch up は修復する、choke off は止める。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Many Japanese companies __BLANK__ the work of making parts to small, family-owned manufacturing shops rather than doing it themselves. Distributing work in this way makes production much more efficient.', '["hush up", "get behind", "plug in", "farm out"]', 3, '「部品製造を外注している」は farm out the work です。farm out で「外注する」。hush up は隠す、get behind は遅れる・支持する、plug in は差し込む。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Jeremy''s parents encouraged him to explore other career options in case his dream of becoming a professional baseball player did not __BLANK__.', '["sit by", "dive in", "strike back", "pan out"]', 3, '「プロ野球選手の夢が実現しなかった場合に備えて」は did not pan out です。pan out で「うまくいく、実現する」。sit by は傍観する、dive in は飛びつく、strike back は反撃する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'A: In __BLANK__ we can say that hiring him was a mistake. B: Yes, it seemed important at the time, but we should have looked for someone with more experience.', '["backlog", "upheaval", "outreach", "hindsight"]', 3, '「振り返ってみれば」は In hindsight です。in hindsight で「後から振り返ると」。backlog は未処理、upheaval は大変動、outreach は outreach 活動。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Jacinda''s golf club membership was __BLANK__ after she failed to pay her annual fees. She had to reapply and pay a penalty to rejoin.', '["appeased", "expounded", "peddled", "rescinded"]', 3, '「年会費を払わなかったため会員資格が取り消された」は was rescinded です。rescind は「取り消す、無効にする」。appease はなだめる、expound は詳しく説明する、peddle は売り歩く。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'A: How did you compete with such large corporations? B: We found our __BLANK__ in the market by offering unique services that the big companies did not provide.', '["grime", "ridge", "glaze", "niche"]', 3, '「市場でニッチを見つけた」は found our niche in the market です。niche は「隙間市場、得意分野」。grime は汚れ、ridge は尾根、glaze は釉薬。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Suzanne arrived in Japan with a high fever and was kept in __BLANK__ at the airport until authorities confirmed she wasn''t carrying a dangerous virus.', '["posterity", "quarantine", "tempest", "saturation"]', 1, '「空港で隔離された」は was kept in quarantine です。quarantine は「隔離、検疫」。posterity は子孫、tempest は嵐、saturation は飽和。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The __BLANK__ happened so swiftly that the defenders were completely overrun within hours. The troops had crossed into enemy territory under cover of darkness.', '["incursion", "grievance", "enigma", "query"]', 0, '「侵攻は非常に迅速だった」は The incursion happened so swiftly です。incursion は「侵入、侵攻」。grievance は不満、enigma は謎、query は質問。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Despite the __BLANK__ praise of many top critics, the film was unpopular with general audiences. It was too slow and abstract for most viewers.', '["fastidious", "exuberant", "unassuming", "anonymous"]', 1, '「多くの一流批評家の熱烈な賞賛にもかかわらず」は Despite the exuberant praise です。exuberant は「熱烈な、豊かな」。fastidious は気難しい、unassuming は控えめな、anonymous は匿名の。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The extreme heat and humidity caused the hikers to move __BLANK__ as they trekked through the jungle. In the end, they were barely able to keep walking.', '["brusquely", "surreptitiously", "cordially", "ploddingly"]', 3, '「ハイカーはのろのろと進んだ」は to move ploddingly です。ploddingly は「重い足取りで、のろのろと」。brusquely は無愛想に、surreptitiously はこっそり、cordially は心から。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Firefighters routinely put their lives in __BLANK__ when responding to calls for help. They face the risk of injury or death every day.', '["impasse", "contempt", "jeopardy", "futility"]', 2, '「消防士は日常的に命を危険にさらす」は put their lives in jeopardy です。in jeopardy で「危険にさらされて」。impasse は行き詰まり、contempt は軽蔑、futility は無益さ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company accountant was arrested for __BLANK__ after it was discovered she had stolen almost a million dollars from the company over five years.', '["embezzlement", "notoriety", "fortitude", "cessation"]', 0, '「横領の容疑で逮捕された」は was arrested for embezzlement です。embezzlement は「横領」。notoriety は悪名、fortitude は不屈の精神、cessation は停止。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The film has received much __BLANK__ for its excellent storytelling and its cinematic beauty. It has won several international awards.', '["clatter", "acclaim", "bigotry", "dogma"]', 1, '「優れたストーリーと映像美で高い評価を受けている」は has received much acclaim です。acclaim は「賞賛、称賛」。clatter はがちゃがちゃ、bigotry は偏狭、dogma は教条。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'It was widely known that the government was __BLANK__ with corruption. It was common for officials to demand money in exchange for permits.', '["gaunt", "meager", "rife", "virile"]', 2, '「政府は腐敗が蔓延していると広く知られていた」は was rife with corruption です。rife は「蔓延した」（rife with で「〜で満ちた」）。gaunt はやつれた、meager は乏しい、virile は男らしい。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'While one might expect to be tired following a workout, many people find that they actually feel __BLANK__ after moderate exercise.', '["invigorated", "provincial", "contiguous", "tenuous"]', 0, '「適度な運動の後はむしろ活力がみなぎると感じる」は actually feel invigorated です。invigorated は「活力づけられた」。provincial は地方の、contiguous は隣接した、tenuous は希薄な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Leilani thought it was useless to __BLANK__ her current financial situation, so instead of complaining, she decided to look for a higher-paying job.', '["collate", "revoke", "bemoan", "thwart"]', 2, '「今の経済状況を嘆いても無駄だと思った」は thought it was useless to bemoan です。bemoan は「嘆く、悲しむ」。collate は照合する、revoke は取り消す、thwart は妨げる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'After two workers were injured on the job, safety took on __BLANK__ importance at the factory. New protocols were introduced immediately.', '["paramount", "haphazard", "pristine", "heedless"]', 0, '「安全が最も重要になった」は safety took on paramount importance です。paramount は「最高の、最も重要な」。haphazard はでたらめな、pristine は pristine な、heedless は無頓着な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Although Jackie''s parents __BLANK__ her not to quit school, Jackie ignored them and began working as a yoga instructor.', '["implored", "purged", "reverted", "grafted"]', 0, '「両親は学校をやめないよう懇願したが」は Although her parents implored her です。implore は「懇願する」。purge は浄化する、revert は戻る、graft は接ぎ木する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'Although he feared the champion, the boxer made a show of __BLANK__ at the media conference by saying he would knock him out in the first round.', '["demeanor", "discretion", "congeniality", "bravado"]', 3, '「メディア会見で虚勢を張って見せた」は made a show of bravado です。bravado は「虚勢、向こう意気」。demeanor は態度、discretion は分別、congeniality は気さくさ。');

-- ========== 単語・句動詞 続き（56〜105） ==========

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The senator''s __BLANK__ remarks offended many voters. He later apologized, but the damage to his campaign had been done.', '["flippant", "fluent", "frugal", "futile"]', 0, '「議員の軽率な発言が」は the senator''s flippant remarks です。flippant は「軽率な、不真面目な」。fluent は流暢な、frugal は倹約な、futile は無駄な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The negotiators managed to __BLANK__ a compromise that both sides could accept. The talks had been at a standstill for weeks.', '["broker", "browse", "bruise", "budge"]', 0, '「両者が受け入れられる妥協を仲介した」は managed to broker a compromise です。broker は「仲介する」。browse は閲覧する、bruise は打撲する、budge は動かす。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The witness gave a __BLANK__ account of what had happened. Her story never changed, even under intense questioning.', '["coherent", "cohesive", "colloquial", "colossal"]', 0, '「証人は一貫した証言をした」は gave a coherent account です。coherent は「一貫した、筋の通った」。cohesive は結束した、colloquial は口語の、colossal は巨大な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The dictator __BLANK__ all opposition to his rule. Anyone who spoke out was arrested or forced to flee the country.', '["suppressed", "surpassed", "suspected", "sustained"]', 0, '「独裁者は反対勢力をことごとく弾圧した」は suppressed all opposition です。suppress は「弾圧する、抑える」。surpass は超える、suspect は疑う、sustain は支える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The journalist was accused of __BLANK__ the facts to make the story more sensational. Her editor demanded a full retraction.', '["distorting", "distributing", "distinguishing", "distressing"]', 0, '「事実を歪めて記事を扇情的にしたと非難された」は accused of distorting the facts です。distort は「歪める」。distribute は配る、distinguish は区別する、distress は苦しめる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The committee''s decision was __BLANK__. No one was willing to challenge the chairperson, so the proposal passed without debate.', '["unanimous", "unruly", "unseemly", "unwieldy"]', 0, '「委員会の決定は全会一致だった」は the decision was unanimous です。unanimous は「全会一致の」。unruly は手に負えない、unseemly は不適切な、unwieldy は扱いにくい。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The drought __BLANK__ the region''s water supply. Farmers were forced to let their crops die and sell their livestock.', '["depleted", "deployed", "deposed", "depicted"]', 0, '「干ばつが地域の水供給を枯渇させた」は depleted the region''s water supply です。deplete は「枯渇させる」。deploy は配置する、depose は廃位する、depict は描く。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The professor''s __BLANK__ style made his lectures difficult to follow. He jumped from one topic to another without clear transitions.', '["digressive", "diligent", "discrete", "discreet"]', 0, '「教授の脱線しがちな話し方で」は the professor''s digressive style です。digressive は「脱線する、本題からそれる」。diligent は勤勉な、discrete は離散した、discreet は慎重な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company tried to __BLANK__ the scandal by paying off the victims. The cover-up only made things worse when it was discovered.', '["hush up", "hold up", "hand out", "hinge on"]', 0, '「被害者に金を払ってスキャンダルを隠そうとした」は tried to hush up the scandal です。hush up で「隠す、もみ消す」。hold up は持ちこたえる、hand out は配る、hinge on は〜次第である。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The new policy will __BLANK__ the rights of minority groups. Activists have vowed to fight the legislation in court.', '["undermine", "underestimate", "undergo", "underline"]', 0, '「新政策は少数派の権利を損なう」は will undermine the rights です。undermine は「損なう、弱体化させる」。underestimate は過小評価する、undergo は経験する、underline は下線を引く。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The diplomat was known for his __BLANK__ in handling sensitive negotiations. He never lost his temper or said anything he would regret.', '["composure", "compromise", "compulsion", "computation"]', 0, '「デリケートな交渉での冷静さで知られていた」は known for his composure です。composure は「落ち着き、冷静さ」。compromise は妥協、compulsion は強迫、computation は計算。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The evidence was __BLANK__ and did not prove the defendant''s guilt. The jury had no choice but to acquit him.', '["inconclusive", "inconsistent", "inconspicuous", "inconsiderate"]', 0, '「証拠は決定的ではなく有罪を立証しなかった」は The evidence was inconclusive です。inconclusive は「決定的でない」。inconsistent は矛盾した、inconspicuous は目立たない、inconsiderate は思いやりがない。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The author''s latest novel has been __BLANK__ by critics as her best work yet. It has already sold over a million copies.', '["hailed", "halted", "hampered", "harnessed"]', 0, '「批評家にこれまでの最高作と称賛されている」は has been hailed by critics です。hail は「称賛する」。halt は止める、hamper は妨げる、harness は利用する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The government has __BLANK__ a state of emergency in the flood-affected regions. Rescue teams are being sent from across the country.', '["invoked", "invaded", "inverted", "invested"]', 0, '「被災地域に非常事態を宣言した」は has invoked a state of emergency です。invoke は「（法・権限を）発動する」。invade は侵略する、invert は逆にする、invest は投資する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The CEO''s __BLANK__ management style left employees confused. They never knew what to expect from one day to the next.', '["erratic", "erroneous", "erudite", "esoteric"]', 0, '「CEOの気まぐれな経営スタイルで」は the CEO''s erratic management style です。erratic は「不安定な、気まぐれな」。erroneous は誤った、erudite は博学な、esoteric は難解な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The treaty was __BLANK__ after years of negotiation. Both countries finally agreed on the terms of the trade agreement.', '["ratified", "rectified", "refuted", "relinquished"]', 0, '「何年もの交渉の末条約が批准された」は The treaty was ratified です。ratify は「批准する」。rectify は正す、refute は反論する、relinquish は手放す。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The professor urged his students to __BLANK__ the primary sources rather than relying on summaries. He said there was no substitute for reading the originals.', '["consult", "console", "consign", "consist"]', 0, '「要約に頼らず一次資料を参照するよう促した」は urged his students to consult です。consult は「参照する、相談する」。console は慰める、consign は委託する、consist は成り立つ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company''s profits have __BLANK__ for the third quarter in a row. Investors are starting to lose confidence in the management.', '["plummeted", "plundered", "polarized", "ponder"]', 0, '「利益が3期連続で急落した」は profits have plummeted です。plummet は「急落する」。plunder は略奪する、polarize は二極化する、ponder は考える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The judge showed __BLANK__ to the first-time offender. He gave her a suspended sentence instead of prison time.', '["leniency", "leverage", "liability", "lucidity"]', 0, '「初犯に寛大さを示した」は showed leniency to です。leniency は「寛大さ」。leverage はてこ、liability は責任、lucidity は明晰さ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The scientist''s theory was __BLANK__ by her peers. They found several flaws in her methodology and conclusions.', '["repudiated", "reputed", "requisite", "resilient"]', 0, '「科学者の理論は同僚に拒否された」は was repudiated by her peers です。repudiate は「拒否する、否認する」。reputed は評判の、requisite は必要な、resilient は回復力のある。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The documentary __BLANK__ the suffering of refugees. Many viewers said it had changed their views on immigration policy.', '["highlighted", "hindered", "hinted", "hoisted"]', 0, '「ドキュメンタリーは難民の苦しみを浮き彫りにした」は highlighted the suffering です。highlight は「際立たせる、強調する」。hinder は妨げる、hint はほのめかす、hoist は持ち上げる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The opposition leader __BLANK__ the government''s handling of the crisis. She said that thousands of lives could have been saved with better planning.', '["lambasted", "lamented", "lavished", "legitimized"]', 0, '「野党党首は政府の危機対応を酷評した」は lambasted the government''s handling です。lambaste は「酷評する、厳しく非難する」。lament は嘆く、lavish は惜しみなく与える、legitimize は正当化する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The artist refused to __BLANK__ his vision to please the critics. He said he would rather be misunderstood than compromise his work.', '["modify", "molest", "muster", "mutilate"]', 0, '「批評家を喜ばせるために自分のビジョンを変えることを拒んだ」は refused to modify his vision です。modify は「修正する、変える」。molest は虐待する、muster は集める、mutilate は傷つける。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The report __BLANK__ a link between the chemical and cancer. The company has denied the findings and is demanding a new study.', '["postulated", "postponed", "possessed", "portrayed"]', 0, '「報告書はその化学物質とがんの関連を仮定した」は postulated a link です。postulate は「仮定する、仮説を立てる」。postpone は延期する、possess は所有する、portray は描く。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The general was __BLANK__ for his role in the coup. He was stripped of his rank and sentenced to life in prison.', '["prosecuted", "prospered", "protruded", "provoked"]', 0, '「将軍はクーデターでの役割で起訴された」は was prosecuted for です。prosecute は「起訴する」。prosper は繁栄する、protrude は突き出る、provoke は挑発する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The speaker''s __BLANK__ tone bored the audience. Many people left before the presentation was over.', '["monotonous", "momentous", "monetary", "monitor"]', 0, '「話者の単調な口調が聴衆を退屈させた」は the speaker''s monotonous tone です。monotonous は「単調な」。momentous は重大な、monetary は金銭の、monitor は監視する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company had to __BLANK__ its expansion plans when the economy went into recession. It focused on cutting costs instead.', '["scrap", "scrape", "scrub", "sculpt"]', 0, '「景気後退で拡大計画を断念しなければならなかった」は had to scrap its expansion plans です。scrap は「廃棄する、やめる」。scrape はこする、scrub はこする、sculpt は彫刻する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The witness was __BLANK__ when asked about his whereabouts on the night of the crime. The prosecutor accused him of lying.', '["evasive", "elusive", "excessive", "exclusive"]', 0, '「犯罪の夜の所在を聞かれたとき証人は言葉を濁した」は the witness was evasive です。evasive は「回避的な、はぐらかす」。elusive は捉えにくい、excessive は過剰な、exclusive は排他的な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The union threatened to __BLANK__ if their demands were not met. The strike would have shut down the factory for weeks.', '["walk out", "work out", "watch out", "wear out"]', 0, '「要求が満たされなければストに突入すると脅した」は threatened to walk out です。walk out で「ストライキに入る、退席する」。work out は解決する、watch out は気をつける、wear out はすり減らす。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The politician had to __BLANK__ his earlier statement after it was revealed that he had been misinformed. He apologized for the confusion.', '["take back", "take in", "take on", "take up"]', 0, '「誤った情報に基づいていたことがわかり、以前の発言を撤回しなければならなかった」は had to take back his statement です。take back で「撤回する、取り消す」。take in は取り込む、take on は引き受ける、take up は始める。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The team had to __BLANK__ without their star player, who was suspended. They still managed to win the championship.', '["get by", "get at", "get away", "get across"]', 0, '「出場停止の主力選手なしでなんとかやらなければならなかった」は had to get by without です。get by で「なんとかやっていく」。get at は言外に示す、get away は逃げる、get across は伝える。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The investigation __BLANK__ that several officials had accepted bribes. The scandal led to the resignation of the entire cabinet.', '["uncovered", "unloaded", "unlocked", "unveiled"]', 0, '「調査で複数の官僚が賄賂を受け取っていたことが明らかになった」は uncovered that です。uncover は「明らかにする、暴く」。unload は荷を下ろす、unlock は鍵を開ける、unveil はベールを取る。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The author''s __BLANK__ use of language made the novel difficult to read. Many readers gave up after the first few chapters.', '["arcane", "ardent", "arid", "arrogant"]', 0, '「著者の難解な言葉遣いで小説は読みづらかった」は the author''s arcane use of language です。arcane は「難解な、秘伝の」。ardent は熱心な、arid は乾燥した、arrogant は傲慢な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The government has __BLANK__ a commission to look into the allegations. The report is expected to be completed within six months.', '["set up", "set off", "set aside", "set back"]', 0, '「疑惑を調査する委員会を設置した」は has set up a commission です。set up で「設置する」。set off は出発する、set aside は取っておく、set back は遅らせる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company''s __BLANK__ growth has surprised analysts. Its revenue has increased by over 50 percent in the past year.', '["exponential", "experimental", "expendable", "expressive"]', 0, '「会社の急成長がアナリストを驚かせた」は the company''s exponential growth です。exponential は「指数関数的な、急激な」。experimental は実験的な、expendable は消耗品の、expressive は表現豊かな。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The professor __BLANK__ the student''s thesis for its lack of original research. He said it relied too heavily on other people''s work.', '["faulted", "favored", "feigned", "ferried"]', 0, '「教授は学生の論文を独創的研究の欠如で批判した」は faulted the student''s thesis です。fault は「欠点を指摘する、責める」。favor は好む、feign は装う、ferry は運ぶ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The treaty was designed to __BLANK__ conflict between the two nations. It established clear borders and trade agreements.', '["forestall", "foretell", "forfeit", "forgive"]', 0, '「条約は両国間の紛争を未然に防ぐために作られた」は designed to forestall conflict です。forestall は「未然に防ぐ、先手を打つ」。foretell は予言する、forfeit は没収する、forgive は許す。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The journalist was __BLANK__ in her criticism of the government. She did not hesitate to name officials who had broken the law.', '["vociferous", "volatile", "voluntary", "voracious"]', 0, '「記者は政府批判で大声を張り上げた」は was vociferous in her criticism です。vociferous は「大声で主張する、やかましい」。volatile は揮発性の、voluntary は自発的な、voracious は貪欲な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company''s __BLANK__ to the crisis was widely criticized. Many said it had acted too slowly and had put profits before people.', '["response", "respite", "revenue", "reverence"]', 0, '「会社の危機への対応は広く批判された」は the company''s response to the crisis です。response は「対応、反応」。respite は休息、revenue は収入、reverence は敬意。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The judge __BLANK__ the jury to disregard the witness''s last statement. He said it had been improper and could not be used as evidence.', '["instructed", "insured", "insulated", "integrated"]', 0, '「陪審に証人の最後の発言を無視するよう指示した」は instructed the jury to disregard です。instruct は「指示する」。insure は保険をかける、insulate は断熱する、integrate は統合する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The scientist''s findings have __BLANK__ the way we understand the disease. Her research has opened up new possibilities for treatment.', '["revolutionized", "reverted", "revoked", "revived"]', 0, '「科学者の発見はその病気の理解の仕方を一変させた」は have revolutionized the way です。revolutionize は「革命を起こす、一変させる」。revert は戻る、revoke は取り消す、revive は復活させる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The actor''s __BLANK__ performance earned him an Oscar. Critics said he had completely transformed himself for the role.', '["stellar", "stagnant", "stark", "stately"]', 0, '「俳優の素晴らしい演技がオスカーをもたらした」は the actor''s stellar performance です。stellar は「一流の、星のような」。stagnant は停滞した、stark は荒涼とした、stately は堂々とした。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The committee decided to __BLANK__ the proposal until more data could be collected. They did not want to make a decision based on incomplete information.', '["table", "tackle", "tally", "tamper"]', 0, '「委員会はより多くのデータが集まるまで提案を棚上げすることにした」は decided to table the proposal です。table は「（議案を）棚上げする」（主に米）。tackle は取り組む、tally は一致する、tamper はいじる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The diplomat worked tirelessly to __BLANK__ tensions between the two countries. She believed that dialogue was the only path to peace.', '["defuse", "deflect", "defraud", "defy"]', 0, '「両国間の緊張を和らげるために尽力した」は to defuse tensions です。defuse は「（緊張・危機を）和らげる」。deflect はそらす、defraud はだます、defy は逆らう。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company''s __BLANK__ practices have drawn criticism from environmental groups. They say the firm is putting profits ahead of the planet.', '["exploitative", "explosive", "exponential", "expressive"]', 0, '「会社の搾取的なやり方が環境団体の批判を招いた」は the company''s exploitative practices です。exploitative は「搾取的な」。explosive は爆発的な、exponential は指数関数的な、expressive は表現豊かな。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The author''s new book has __BLANK__ controversy. Some readers praise it as bold, while others condemn it as offensive.', '["sparked", "spared", "spanned", "spawned"]', 0, '「著者の新刊が論争を引き起こした」は has sparked controversy です。spark は「引き起こす、火花を散らす」。spare は免れる、span は及ぶ、spawn は生み出す。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The witness''s testimony was __BLANK__ by the defense lawyer. He pointed out several inconsistencies in her story.', '["discredited", "dispatched", "dispersed", "disposed"]', 0, '「証人の証言は弁護人によって信用を失わせられた」は was discredited by です。discredit は「信用を失わせる」。dispatch は派遣する、disperse は散らす、dispose は処分する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The president''s __BLANK__ speech failed to inspire the nation. Many felt he had missed an opportunity to unite the country.', '["lackluster", "lamentable", "lateral", "lavish"]', 0, '「大統領の精彩を欠いた演説は国民を奮い立たせなかった」は the president''s lackluster speech です。lackluster は「精彩を欠いた、ぱっとしない」。lamentable は嘆かわしい、lateral は横の、lavish は贅沢な。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The scientist was __BLANK__ in her pursuit of the truth. She spent decades on research that others had abandoned as hopeless.', '["tenacious", "tentative", "terminal", "terrestrial"]', 0, '「科学者は真実の追究で粘り強かった」は was tenacious in her pursuit です。tenacious は「粘り強い、しつこい」。tentative は仮の、terminal は末期の、terrestrial は地上の。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company had to __BLANK__ its workforce when the market collapsed. Thousands of employees lost their jobs overnight.', '["slash", "slam", "slay", "sling"]', 0, '「市場が崩壊したとき従業員を大幅に削減しなければならなかった」は had to slash its workforce です。slash は「大幅に削減する」。slam はバタンと閉める、slay は殺す、sling は投げる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The politician''s __BLANK__ remarks cost him the election. Voters were offended by his insensitive comments about the poor.', '["tactless", "tactical", "tangible", "tantalizing"]', 0, '「政治家の無神経な発言が選挙で敗北の原因になった」は the politician''s tactless remarks です。tactless は「無神経な、機転の利かない」。tactical は戦術的な、tangible は触れられる、tantalizing は心をそそる。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The report __BLANK__ that the project would cost twice the original estimate. The board decided to look for cheaper alternatives.', '["projected", "prohibited", "prolonged", "promoted"]', 0, '「報告書はプロジェクトの費用が当初見積もりの2倍になると予測した」は projected that です。project は「予測する、投影する」。prohibit は禁止する、prolong は延長する、promote は促進する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The artist''s work has been __BLANK__ by critics as derivative. They say he has borrowed too heavily from the masters without adding anything new.', '["dismissed", "dispersed", "disposed", "disputed"]', 0, '「芸術家の作品は批評家に模倣的だと切り捨てられた」は has been dismissed by critics です。dismiss は「却下する、軽く見る」。disperse は散らす、dispose は処分する、dispute は争う。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The government has __BLANK__ a crackdown on tax evasion. New laws will give authorities more power to pursue offenders.', '["announced", "annulled", "annotated", "annexed"]', 0, '「政府は脱税取り締まりの強化を発表した」は has announced a crackdown です。announce は「発表する」。annul は無効にする、annotate は注釈をつける、annex は併合する。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The professor''s __BLANK__ with the subject was evident in every lecture. She could answer any question without hesitation.', '["familiarity", "formality", "fragility", "futility"]', 0, '「教授のその分野への精通ぶりは毎回の講義で明らかだった」は the professor''s familiarity with です。familiarity は「精通、親しみ」。formality は形式、fragility は脆弱さ、futility は無益さ。');

INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('1級', 'short_fill', 'The company tried to __BLANK__ the negative publicity by launching a charity campaign. The move was seen as an attempt to improve its image.', '["counter", "couple", "counsel", "conceal"]', 0, '「悪い評判に対抗しようと慈善キャンペーンを始めた」は tried to counter the negative publicity です。counter は「対抗する」。couple は結びつける、counsel は助言する、conceal は隠す。');
