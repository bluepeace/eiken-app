-- seed_reading_short_4kyu_extra.sql
-- 英検4級 短文の語句空所補充 追加80問（21〜100）
-- 実行順: 030 マイグレーション → seed_reading_short_4kyu.sql（20問）→ 本ファイル（80問）で計100問

-- (21) swim / can + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Kate can __BLANK__ very well. She goes to the pool every week.', '["swam", "swim", "swims", "to swim"]', 1, '助動詞 can の後には動詞の原形がきます。"can swim" で「泳げる」という意味になります。');

-- (22) must / must + 原形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Can I eat this cake now? B: No. You __BLANK__ wash your hands first.', '["must", "are", "have", "were"]', 0, '「まず手を洗わなければならない」は "You must wash your hands." です。must の後は動詞の原形です。');

-- (23) watching / was 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Taro was __BLANK__ a movie when his friend called him.', '["watching", "watches", "watch", "watched"]', 0, '「電話がかかってきたとき映画を見ていた」は過去進行形 "was watching" を使います。');

-- (24) ask / ask for help
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: I can''t understand this math problem. B: Let''s __BLANK__ the teacher for help.', '["tell", "listen", "ask", "shut"]', 2, '「先生に助けを求める」は "ask 人 for help" という表現です。ask が正解。');

-- (25) had / have a hard time
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Bill''s math teacher gave him a lot of homework yesterday. Bill __BLANK__ a hard time because it was difficult.', '["played", "took", "had", "talked"]', 2, '「大変な思いをした」は "have a hard time" という表現です。過去形で "had a hard time" になります。');

-- (26) of / a cup of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: It''s so cold today. Can you make me a cup __BLANK__ hot chocolate, please? B: Sure. Just a minute.', '["at", "to", "as", "of"]', 3, '「コップ1杯の〜」は "a cup of 〜" です。of が正解。');

-- (27) kind / what kind of
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: What __BLANK__ of dog do you want? B: I want a big dog because I love to go on long walks.', '["room", "wind", "kind", "side"]', 2, '「どんな種類の」は "What kind of 〜?" という表現です。kind が正解。');

-- (28) Why / 理由を聞く
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ are you going to go to the park today? B: I want to paint a picture.', '["When", "What", "Where", "Why"]', 3, '「絵を描きたい」は理由なので、理由を聞く "Why 〜?" が正解です。');

-- (29) to watch / like to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: What do you do on weekends? B: I don''t like __BLANK__ TV, so I usually read a book.', '["to watch", "watch", "watches", "watched"]', 0, '「〜するのが好きではない」は "don''t like to do" の形。like の後は "to + 動詞の原形" です。');

-- (30) oldest / the 最上級
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: What animal is the __BLANK__ in this zoo? B: This elephant is.', '["too old", "older", "oldest", "much older"]', 2, '「この動物園でいちばん年を取っている」は最上級 "the oldest" を使います。');

-- (31) trouble / have trouble with
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Mom, I''m having __BLANK__ with my homework. B: OK, I''ll help you with it.', '["trouble", "help", "homework", "time"]', 0, '「〜で困っている」は "have trouble with 〜" という表現です。trouble が正解。');

-- (32) do / do the housework
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Mr. Smith usually __BLANK__ the housework on Sunday mornings. After that, he likes to read magazines.', '["do", "have", "make", "take"]', 0, '「家事をする」は "do the housework" という表現です。do が正解。');

-- (33) time / have a good time
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Bye, Mom. Dan and I are going to a party. B: OK, have a good __BLANK__.', '["time", "party", "day", "trip"]', 0, '「楽しんでね」は "Have a good time." という決まったあいさつです。');

-- (34) old / years old
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Daniel is fourteen years __BLANK__. He is very good at sports.', '["old", "age", "long", "much"]', 0, '「14歳」は "fourteen years old" という表現です。年齢を言うときに使います。');

-- (35) came / 過去形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Henry __BLANK__ home from school early yesterday because he was sick.', '["came", "comes", "come", "coming"]', 0, '「昨日早く帰った」は過去の出来事なので、come の過去形 "came" が正解です。');

-- (36) largest / the 最上級
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Many of the buildings in this city are very big. B: Yes, but this one is the __BLANK__.', '["large", "largest", "larger", "too large"]', 1, '「この中でいちばん大きい」は最上級 "the largest" を使います。');

-- (37) There / There are
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: What''s your town like, Tom? B: It''s nice. __BLANK__ are lots of parks and a big pool.', '["They", "Those", "There", "Their"]', 2, '「たくさんの公園がある」と存在を表すときは "There are 〜" を使います。There が正解。');

-- (38) professional / プロの
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Kentaro wants to be a __BLANK__ baseball player in the future. He wants to play in the United States someday.', '["difficult", "professional", "strange", "thick"]', 1, '「アメリカでプレーしたい」という夢から、「プロの」選手を表す "professional" が正解です。');

-- (39) umbrella / 傘
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: It''ll rain this evening, Peter. Don''t forget your __BLANK__. B: Thanks, Lisa.', '["umbrella", "dream", "mirror", "sandwich"]', 0, '雨の日に持っていくのは「傘」なので "umbrella" が正解。dream は夢、mirror は鏡です。');

-- (40) useful / 役に立つ
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Do you know any good sports websites? B: Yes. This website is very __BLANK__.', '["quiet", "thirsty", "tall", "useful"]', 3, '良いサイトは「役に立つ」ので "useful" が正解。quiet は静かな、thirsty は喉が渇いた、tall は背が高いです。');

-- (41) heavy / 重い
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Takeru''s bag has many large books in it. It is very __BLANK__, so Takeru can''t carry it.', '["heavy", "nervous", "late", "fast"]', 0, 'たくさんの本で「持てない」のは「重い」からなので "heavy" が正解。nervous は緊張した、late は遅いです。');

-- (42) castle / 城
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Yumi visited a __BLANK__ last weekend. She likes learning about history.', '["dictionary", "question", "castle", "cloud"]', 2, '歴史を学ぶために訪れるのは「城」のような場所なので "castle" が正解。dictionary は辞書です。');

-- (43) garden / 庭
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Peter grows potatoes in his __BLANK__. He also has an apple tree.', '["cake", "song", "meat", "garden"]', 3, '野菜や果物の木があるのは「庭」なので "garden" が正解。cake はケーキ、song は歌です。');

-- (44) part / 部分
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Did you like the book, Andy? B: Well, the first __BLANK__ of the book was interesting, but the ending wasn''t very good.', '["country", "part", "way", "road"]', 1, '「本の最初の部分」は "the first part of the book" です。part は「部分」の意味。');

-- (45) airport / 空港
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Yuta loves flying. He often goes to the __BLANK__ to watch the planes.', '["floor", "hospital", "airport", "mall"]', 2, '飛行機を見に行く場所は「空港」なので "airport" が正解。floor は床、hospital は病院です。');

-- (46) forget / forget to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Don''t __BLANK__ to turn off the light when you leave. B: I won''t.', '["forget", "remember", "want", "need"]', 0, '「〜するのを忘れないで」は "Don''t forget to do" です。forget が正解。');

-- (47) same / the same as
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My sister''s bag is the __BLANK__ as mine. We bought them together.', '["same", "different", "other", "another"]', 0, '「私のと同じ」は "the same as 〜" という表現です。same が正解。');

-- (48) already / すでに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Can you help me with this? B: I''ve __BLANK__ finished it. Here you are.', '["already", "yet", "still", "again"]', 0, '「もう終わらせた」は "I''ve already finished" です。already は「すでに、もう」の意味。');

-- (49) never / 一度も〜ない
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Emma has __BLANK__ been to London. She wants to go there next year.', '["never", "ever", "always", "often"]', 0, '「まだ行ったことがない」は "has never been to" です。never は「一度も〜ない」の意味。');

-- (50) better / 比較級
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Today I feel __BLANK__ than yesterday. I had a good sleep last night.', '["good", "better", "best", "well"]', 1, '「昨日より良く感じる」は比較級 "feel better than" を使います。good の比較級は better。');

-- (51) much / how much
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ is this T-shirt? B: It''s twenty dollars.', '["How much", "How many", "How long", "How old"]', 0, '値段を聞くときは "How much is 〜?" を使います。much は不可算や金額に使います。');

-- (52) many / how many
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ books did you read last month? B: I read five books.', '["How much", "How many", "How long", "How often"]', 1, '数えられる名詞の数を聞くときは "How many 〜?" を使います。books は複数なので many。');

-- (53) since / since 過去
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I have known her __BLANK__ we were in elementary school.', '["when", "since", "for", "ago"]', 1, '「小学校のときから知っている」は "have known 〜 since" で、since の後は過去の起点を表します。');

-- (54) for / for 期間
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'They have lived in this town __BLANK__ ten years.', '["since", "for", "from", "during"]', 1, '「10年間」と期間を表すときは "for + 期間" を使います。for が正解。');

-- (55) if / 条件
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I will go to the park __BLANK__ it is sunny tomorrow.', '["if", "because", "but", "so"]', 0, '「晴れなら行く」は条件を表す "if" を使います。if は「もし〜なら」の意味。');

-- (56) because / 理由
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'She didn''t go to school __BLANK__ she had a fever.', '["but", "because", "so", "and"]', 1, '「熱があったので学校に行かなかった」は理由の "because" を使います。because は「〜なので」。');

-- (57) before / 前に
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Please wash your hands __BLANK__ you eat lunch.', '["after", "before", "when", "until"]', 1, '「食事の前に手を洗う」は "before you eat" です。before は「〜の前に」。');

-- (58) after / 後に
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'We played soccer __BLANK__ school yesterday.', '["before", "after", "during", "for"]', 1, '「昨日放課後にサッカーをした」は "after school" です。after は「〜の後に」。');

-- (59) enough / 十分
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'This box is not big __BLANK__ for all the books.', '["too", "very", "enough", "so"]', 2, '「すべての本を入れるには十分大きくない」は "not big enough for" です。enough は形容詞の後におきます。');

-- (60) too / too 〜 to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'The coffee was __BLANK__ hot to drink. I waited for a few minutes.', '["too", "very", "enough", "so"]', 0, '「飲むには熱すぎた」は "too 〜 to do" の形です。too が正解。');

-- (61) something / 何か
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: I''m hungry. B: There''s __BLANK__ in the fridge. Help yourself.', '["something", "anything", "nothing", "everything"]', 0, '「冷蔵庫に何かある」は肯定文なので "something" を使います。something は「何か」の意味。');

-- (62) anything / 何か（疑問・否定）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Do you need __BLANK__ from the store? B: No, I have everything.', '["something", "anything", "nothing", "everything"]', 1, '疑問文で「何か」と言うときは "anything" を使います。anything は疑問文・否定文で使います。');

-- (63) everyone / みんな
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', '__BLANK__ in our class passed the test. We were all happy.', '["Everyone", "Someone", "Anyone", "No one"]', 0, '「クラスのみんなが」は "Everyone in our class" です。everyone は「みんな、誰もが」の意味。');

-- (64) myself / 再帰代名詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I made this cake __BLANK__. My mom taught me how.', '["myself", "yourself", "himself", "herself"]', 0, '「自分で作った」は "made it myself" です。主語が I のときは myself を使います。');

-- (65) interested / be interested in
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Tom is __BLANK__ in science. He wants to be a scientist.', '["interest", "interested", "interesting", "interests"]', 1, '「〜に興味がある」は "be interested in 〜" です。人を主語にするときは interested を使います。');

-- (66) exciting / 形容詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'The game was very __BLANK__. We all enjoyed it.', '["excite", "excited", "exciting", "excitement"]', 2, '「試合がわくわくする」は物・事が主語なので "exciting" を使います。exciting は「わくわくさせる」という意味の形容詞。');

-- (67) carefully / 副詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Please read the instructions __BLANK__ before you start.', '["careful", "carefully", "care", "caring"]', 1, '動詞 read を修飾するのは副詞なので "carefully" が正解。careful は形容詞、carefully は副詞です。');

-- (68) quickly / 副詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'The bus is coming. We need to run __BLANK__ to the stop.', '["quick", "quicker", "quickly", "quickest"]', 2, '動詞 run を修飾するのは副詞なので "quickly" が正解。quickly は「速く」の意味。');

-- (69) better / had better
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: I have a headache. B: You __BLANK__ better go to bed early tonight.', '["have", "had", "has", "having"]', 1, '「〜したほうがいい」は "had better do" という表現です。had が正解。');

-- (70) could / 過去の能力
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'When I was five, I __BLANK__ not swim. I learned when I was seven.', '["can", "could", "will", "would"]', 1, '「5歳のときは泳げなかった」は過去の能力なので "could not swim" を使います。can の過去形は could。');

-- (71) would / Would you like
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ you like some orange juice? B: Yes, please.', '["Do", "Would", "Are", "Can"]', 1, '「オレンジジュースはいかがですか」は丁寧な "Would you like 〜?" を使います。Would が正解。');

-- (72) shall / Shall we
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ we go to the library together? B: Good idea.', '["Do", "Will", "Shall", "Can"]', 2, '「一緒に図書館に行きませんか」と提案するときは "Shall we 〜?" を使います。');

-- (73) going / be going to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My family is __BLANK__ to visit my grandparents next week.', '["go", "going", "goes", "went"]', 1, '「来週祖父母を訪ねる予定」は "be going to do" の形です。is の後は going。');

-- (74) reading / enjoy 〜ing
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Sara enjoys __BLANK__ books. She has many books in her room.', '["read", "reads", "reading", "to read"]', 2, '「読むことを楽しむ」は "enjoy 〜ing" の形です。enjoy の後は動詞の -ing 形。');

-- (75) to go / want to do
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I want __BLANK__ to the movie theater this weekend. There is a good film.', '["go", "goes", "going", "to go"]', 3, '「〜したい」は "want to do" の形です。want の後は "to + 動詞の原形"。');

-- (76) made / 過去形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My father __BLANK__ a big cake for my birthday last Sunday.', '["make", "makes", "making", "made"]', 3, '「先週の日曜日に作った」は過去の出来事なので、make の過去形 "made" が正解です。');

-- (77) written / 過去分詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'This book was __BLANK__ by a famous writer. Many people have read it.', '["wrote", "writes", "writing", "written"]', 3, '「有名な作家によって書かれた」は受動態 "was written by" です。write の過去分詞は written。');

-- (78) found / 過去形
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I __BLANK__ my key under the table. I was so glad.', '["find", "finds", "found", "finding"]', 2, '「鍵をテーブルの下で見つけた」は過去の出来事なので、find の過去形 "found" が正解。');

-- (79) taken / have 過去分詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'She has __BLANK__ many photos of the mountains. They are beautiful.', '["take", "takes", "took", "taken"]', 3, '「たくさんの写真を撮ってきた」は現在完了 "has taken" です。take の過去分詞は taken。');

-- (80) been / have been to
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Have you ever __BLANK__ to Paris? I went there two years ago.', '["go", "went", "gone", "been"]', 3, '「〜に行ったことがある」は "have been to 〜" です。go の過去分詞は been（行ったことがあるの意味で使う）。');

-- (81) yet / まだ（否定・疑問）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: Have you done your homework? B: Not __BLANK__. I will do it after dinner.', '["already", "yet", "still", "just"]', 1, '否定文で「まだ」と言うときは "not yet" を使います。yet は疑問・否定で「まだ」の意味。');

-- (82) just / たった今
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I have __BLANK__ finished my lunch. I need to go back to class now.', '["already", "yet", "still", "just"]', 3, '「たった今昼食を終えた」は "have just finished" です。just は「たった今」の意味。');

-- (83) ever / 今までに
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Have you __BLANK__ tried Japanese food? It is very delicious.', '["never", "ever", "already", "yet"]', 1, '「今までに〜したことがあるか」と聞くときは "Have you ever 過去分詞?" を使います。ever が正解。');

-- (84) once / 一度
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I have been to that museum __BLANK__. I went there with my school last year.', '["one", "once", "first", "only"]', 1, '「一度行ったことがある」は "have been 〜 once" です。once は「一度、一度だけ」の意味。');

-- (85) always / いつも
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My brother __BLANK__ gets up early. He likes to run in the morning.', '["always", "never", "sometimes", "once"]', 0, '「いつも早起きする」は "always gets up early" です。always は「いつも」の意味の副詞。');

-- (86) sometimes / ときどき
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I __BLANK__ play tennis with my friends on weekends.', '["always", "never", "sometimes", "usually"]', 2, '「週末にときどきテニスをする」は "sometimes play" です。sometimes は「ときどき」の意味。');

-- (87) both / 両方
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My parents __BLANK__ work at the same hospital. They are doctors.', '["all", "both", "each", "every"]', 1, '「両親とも」は2人なので "both" を使います。both は「両方とも」の意味。');

-- (88) all / みんな
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'We __BLANK__ enjoyed the party. Thank you for inviting us.', '["all", "both", "each", "every"]', 0, '「私たちはみんなパーティーを楽しんだ」は "We all enjoyed" です。all は「みんな」の意味。');

-- (89) another / もう一つ
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: This pen doesn''t work. B: Here is __BLANK__ one. You can use it.', '["other", "another", "the other", "others"]', 1, '「もう1本」は "another one" です。another は「別の1つ、もう1つ」の意味。');

-- (90) other / the other
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I have two cats. One is black and the __BLANK__ is white.', '["other", "another", "others", "another one"]', 0, '「2つのうちもう1方は」は "the other" です。2つあるとき、残り1つを指します。');

-- (91) during / 〜の間
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'Please don''t talk __BLANK__ the lesson. Listen to the teacher.', '["for", "since", "during", "while"]', 2, '「授業の間は話さないで」は "during the lesson" です。during は「〜の間に」の意味。');

-- (92) until / 〜まで
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I will wait here __BLANK__ you come back. Don''t be late.', '["when", "until", "after", "before"]', 1, '「あなたが戻ってくるまで待つ」は "wait until 〜" です。until は「〜まで」の意味。');

-- (93) while / 〜している間
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'My mother was cooking __BLANK__ I was doing my homework.', '["during", "while", "when", "as"]', 1, '「母が料理している間、私は宿題をしていた」は "while I was doing" です。while は「〜している間に」。');

-- (94) although / けれども
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', '__BLANK__ it was raining, we went to the park. We had umbrellas.', '["Because", "Although", "So", "If"]', 1, '「雨だったけれど公園に行った」は "Although it was raining" です。although は「〜だけれども」の意味。');

-- (95) whether / 〜かどうか
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I don''t know __BLANK__ she will come to the party or not.', '["if", "whether", "that", "what"]', 1, '「彼女がパーティーに来るかどうかわからない」は "whether 〜 or not" を使います。whether が正解。');

-- (96) that / 接続詞
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'short_fill', 'I think __BLANK__ this book is very interesting. You should read it.', '["what", "which", "that", "if"]', 2, '「この本はとても面白いと思う」は "I think that 〜" です。that は文をつなぐ接続詞。');

-- (97) which / どちら
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ bag is yours, the red one or the blue one? B: The blue one.', '["What", "Which", "Whose", "Who"]', 1, '「どちらのかばんがあなたの？」は "Which bag is yours?" です。限られた選択肢から選ぶときは which。');

-- (98) whose / 誰の
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ notebook is this? B: I think it''s Ken''s.', '["Who", "Whose", "Which", "Whom"]', 1, '「これは誰のノート？」は "Whose notebook is this?" です。whose は「誰の」という意味。');

-- (99) how / How long
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ long did you stay in Tokyo? B: I stayed for three days.', '["How", "What", "When", "Where"]', 0, '「どのくらいの間」は "How long 〜?" で聞きます。期間をたずねる表現です。');

-- (100) often / How often
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES ('4級', 'conversation_fill', 'A: __BLANK__ often do you play soccer? B: I play twice a week.', '["How", "What", "When", "Why"]', 0, '「どのくらいの頻度で」は "How often 〜?" で聞きます。often が正解。');
