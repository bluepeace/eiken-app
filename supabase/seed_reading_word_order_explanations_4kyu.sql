-- seed_reading_word_order_explanations_4kyu.sql
-- 英検4級 語句整序問題の解説（045 マイグレーション・語句整序 seed 実行後に実行）

-- ========== May I / Could you / Would you 依頼・丁寧表現 ==========
UPDATE public.reading_word_order_questions SET explanation = 'May I have ...? で「〜をいただけますか」と丁寧に頼む表現。your telephone number で「あなたの電話番号」。語順は May I have + 目的語。' WHERE level = '4級' AND prompt_ja = 'あなたの電話番号を教えていただけますか。';
UPDATE public.reading_word_order_questions SET explanation = 'Could you + 動詞の原形で「〜していただけますか」。Could you close the window? の語順です。' WHERE level = '4級' AND prompt_ja = '窓を閉めていただけますか。';
UPDATE public.reading_word_order_questions SET explanation = 'Could you say it again? で「もう一度言っていただけますか」。again は文末に置くことが多いです。' WHERE level = '4級' AND prompt_ja = 'もう一度言っていただけますか。';
UPDATE public.reading_word_order_questions SET explanation = 'Could you lend me your map? lend は「貸す」。lend + 人 + 物の語順。' WHERE level = '4級' AND prompt_ja = '地図を貸していただけますか。';
UPDATE public.reading_word_order_questions SET explanation = 'Could I have ...? で「〜をいただけますか」。Could I have some water? の語順。' WHERE level = '4級' AND prompt_ja = '水をいただけますか。';

-- ========== to不定詞（目的・名詞的用法） ==========
UPDATE public.reading_word_order_questions SET explanation = 'to不定詞の目的「〜するために」。I went to the library to borrow some books. で「本を借りるために図書館へ行った」。' WHERE level = '4級' AND prompt_ja = '私は本を借りるために図書館へ行きました。';
UPDATE public.reading_word_order_questions SET explanation = 'He studies hard to learn English. to不定詞で「英語を学ぶために」。studies hard の後に目的の to learn が続きます。' WHERE level = '4級' AND prompt_ja = '彼は英語を学ぶために毎日勉強しています。';
UPDATE public.reading_word_order_questions SET explanation = 'I went to the station to buy a ticket. 「チケットを買うために駅へ行った」。to不定詞が目的を表します。' WHERE level = '4級' AND prompt_ja = '私はチケットを買うために駅へ行きました。';
UPDATE public.reading_word_order_questions SET explanation = 'She is studying to become a doctor. 「医者になるために勉強している」。to become が目的の to不定詞。' WHERE level = '4級' AND prompt_ja = '彼女は医者になるために大学で勉強しています。';
UPDATE public.reading_word_order_questions SET explanation = 'He turned on the TV to watch the news. 「ニュースを見るためにテレビをつけた」。to watch が目的です。' WHERE level = '4級' AND prompt_ja = '彼はニュースを見るためにテレビをつけました。';
UPDATE public.reading_word_order_questions SET explanation = 'like to + 動詞の原形で「〜することが好き」。I like to swim で「私は泳ぐことが好きです」。' WHERE level = '4級' AND prompt_ja = '私は泳ぐことが好きです。';
UPDATE public.reading_word_order_questions SET explanation = 'be good at + 名詞/-ing で「〜が得意」。She is good at cooking で「彼女は料理が得意です」。' WHERE level = '4級' AND prompt_ja = '彼女は料理をすることが得意です。';
UPDATE public.reading_word_order_questions SET explanation = 'didn''t have time to do ... で「〜する時間がなかった」。They didn''t have time to see the movie. の語順。' WHERE level = '4級' AND prompt_ja = '彼らは映画を見る時間がありませんでした。';

-- ========== have to / didn't have to / 過去形 ==========
UPDATE public.reading_word_order_questions SET explanation = 'didn''t have time for breakfast で「朝食の時間がなかった」。for は「〜のための」で breakfast の前に置きます。' WHERE level = '4級' AND prompt_ja = 'ポールは今日遅く起きたので、朝食を食べる時間がありませんでした。';
UPDATE public.reading_word_order_questions SET explanation = 'didn''t have time to eat breakfast で「朝食を食べる時間がなかった」。to eat が to不定詞です。' WHERE level = '4級' AND prompt_ja = 'ビルは今朝、朝食を食べる時間がありませんでした。';
UPDATE public.reading_word_order_questions SET explanation = 'Do we have to + 動詞の原形で「私たちは〜しなければいけませんか」。have to は「〜しなければならない」。' WHERE level = '4級' AND prompt_ja = '私たちは明日家の掃除をしなければいけませんか。';
UPDATE public.reading_word_order_questions SET explanation = 'had to do ... で「〜しなければならなかった」（過去）。She had to do her homework yesterday. の語順。' WHERE level = '4級' AND prompt_ja = '彼女は昨日宿題をしなければなりませんでした。';
UPDATE public.reading_word_order_questions SET explanation = 'Show me your ... で「あなたの〜を見せてください」。your English homework で「英語の宿題」。' WHERE level = '4級' AND prompt_ja = '良夫君、あなたの英語の宿題を見せてください。';
UPDATE public.reading_word_order_questions SET explanation = 'Mom, do we have to clean ...? 「お母さん、私たちは〜を掃除しなければいけませんか」。have to の後は動詞の原形。' WHERE level = '4級' AND prompt_ja = 'お母さん、明日は家の掃除をしなければいけませんか。';

-- ========== 過去形・for the first time 等 ==========
UPDATE public.reading_word_order_questions SET explanation = 'take a plane で「飛行機に乗る」。for the first time は「初めて」。My grandfather took a plane for the first time. の語順。' WHERE level = '4級' AND prompt_ja = '祖父は去年初めて飛行機に乗りました。';
UPDATE public.reading_word_order_questions SET explanation = 'leave ... for ... で「〜を出て〜へ向かう」。She left her house at 7 for school. at 7 は「7時に」。' WHERE level = '4級' AND prompt_ja = 'キャロルは昨日7時に家を出て学校へ向かいました。';
UPDATE public.reading_word_order_questions SET explanation = 'listen to ... で「〜を聞く」。I listened to my new CD many times. many times は「何回も」。' WHERE level = '4級' AND prompt_ja = '私は新しいCDを何回も聞きました。';
UPDATE public.reading_word_order_questions SET explanation = 'have a great weekend で「楽しい週末を過ごす」。She had a great weekend in Kyoto. の語順。' WHERE level = '4級' AND prompt_ja = '彼女は先週京都で楽しい週末を過ごしました。';
UPDATE public.reading_word_order_questions SET explanation = 'go to bed で「寝る」。He went to bed at eleven last night. 時の表現は文末に置くことが多いです。' WHERE level = '4級' AND prompt_ja = '彼は昨夜11時に寝ました。';
UPDATE public.reading_word_order_questions SET explanation = 'They played soccer in the park yesterday. 主語 + 動詞 + 場所 + 時の語順です。' WHERE level = '4級' AND prompt_ja = '彼らは昨日公園でサッカーをしました。';
UPDATE public.reading_word_order_questions SET explanation = 'I visited my grandmother last Sunday. 主語 + 動詞 + 目的語 + 時の語順。visit は「訪ねる」。' WHERE level = '4級' AND prompt_ja = '私は先週の日曜日に祖母を訪ねました。';

-- ========== talk about / speak / ask 等 ==========
UPDATE public.reading_word_order_questions SET explanation = 'ask 人 about 〜 で「人に〜についてたずねる」。I asked Mr. Kent about his hobbies. の語順。' WHERE level = '4級' AND prompt_ja = '私はケント先生に趣味についてたずねました。';
UPDATE public.reading_word_order_questions SET explanation = 'talk with 人 about 〜 で「人と〜について話す」。I talk with my brother about movies. の語順。' WHERE level = '4級' AND prompt_ja = '私は、よく兄と映画について話します。';
UPDATE public.reading_word_order_questions SET explanation = 'I will talk with Mr. Brown about the math test. will は「〜するつもり」、after school は「放課後に」の意味で文中に含まれます。' WHERE level = '4級' AND prompt_ja = '私は、数学のテストについてブラウン先生と放課後に話します。';
UPDATE public.reading_word_order_questions SET explanation = 'Can your father speak both A and B? で「お父さんはAとBの両方を話せますか」。both は「両方」で speak の後。' WHERE level = '4級' AND prompt_ja = 'あなたのお父さんは中国語とフランス語の両方を話せますか。';
UPDATE public.reading_word_order_questions SET explanation = 'Did you see ... at ...? で「〜で…を見ましたか」。Did you see the lions at the zoo? の語順。' WHERE level = '4級' AND prompt_ja = 'あの動物園でライオンを見ましたか。';

-- ========== 助動詞（will, must, should, can） ==========
UPDATE public.reading_word_order_questions SET explanation = 'He will go to Osaka on business next week. will + 動詞の原形で「〜するつもり」。on business は「出張で」。' WHERE level = '4級' AND prompt_ja = '彼は来週大阪へ出張します。';
UPDATE public.reading_word_order_questions SET explanation = 'We will go hiking this weekend. go hiking で「ハイキングに行く」。will は主語の直後に置きます。' WHERE level = '4級' AND prompt_ja = '私たちは今週末ハイキングに行くつもりです。';
UPDATE public.reading_word_order_questions SET explanation = 'You must go home early today. must + 動詞の原形で「〜しなければならない」。early は「早く」。' WHERE level = '4級' AND prompt_ja = 'あなたは今日早く帰らなければなりません。';
UPDATE public.reading_word_order_questions SET explanation = 'She can play the piano. can + 動詞の原形で「〜できる」。主語 + can + 動詞の順。' WHERE level = '4級' AND prompt_ja = '彼女はピアノを弾くことができます。';
UPDATE public.reading_word_order_questions SET explanation = 'You should eat more vegetables. should + 動詞の原形で「〜すべき」。more は「もっと」。' WHERE level = '4級' AND prompt_ja = 'あなたはもっと野菜を食べるべきです。';
UPDATE public.reading_word_order_questions SET explanation = 'He must finish the report by tomorrow. by tomorrow は「明日までに」。must の後は動詞の原形。' WHERE level = '4級' AND prompt_ja = '彼は明日までにレポートを完成させなければなりません。';

-- ========== 受動態 ==========
UPDATE public.reading_word_order_questions SET explanation = '受動態は「be動詞 + 過去分詞 + by 〜」。This book is read by many people で「この本は多くの人々に読まれている」。' WHERE level = '4級' AND prompt_ja = 'この本は多くの人々に読まれています。';
UPDATE public.reading_word_order_questions SET explanation = 'The bridge was built fifty years ago. 受動態の過去形は was/were + 過去分詞。fifty years ago は「50年前に」。' WHERE level = '4級' AND prompt_ja = 'その橋は50年前に建てられました。';
UPDATE public.reading_word_order_questions SET explanation = 'This song is sung all over the world. 受動態の現在形。all over the world は「世界中で」。' WHERE level = '4級' AND prompt_ja = 'この歌は世界中で歌われています。';
UPDATE public.reading_word_order_questions SET explanation = 'English is spoken in many countries. 受動態。「英語は多くの国で話されている」。in many countries は「多くの国で」。' WHERE level = '4級' AND prompt_ja = '英語は多くの国で話されています。';

-- ========== 接続詞（because, so, when, if） ==========
UPDATE public.reading_word_order_questions SET explanation = 'so は「だから」で前の文の結果を表します。It rained, so we stayed at home. で「雨が降った、だから私たちは家にいた」。' WHERE level = '4級' AND prompt_ja = '雨が降っていたので、私たちは家にいました。';
UPDATE public.reading_word_order_questions SET explanation = 'because は「〜なので」で理由を表します。He went to bed early because he was tired. の語順。' WHERE level = '4級' AND prompt_ja = '彼は疲れていたので、早く寝ました。';
UPDATE public.reading_word_order_questions SET explanation = 'When は「〜とき」で時を表す接続詞。When she called, I was doing my homework. の語順。' WHERE level = '4級' AND prompt_ja = '彼女が電話したとき、私は宿題をしていました。';
UPDATE public.reading_word_order_questions SET explanation = 'If は「もし〜なら」で条件を表します。If it is sunny tomorrow, we will go on a picnic. の語順。' WHERE level = '4級' AND prompt_ja = '明日晴れたら、ピクニックに行きます。';

-- ========== What kind of / be good at / enjoy 等 ==========
UPDATE public.reading_word_order_questions SET explanation = 'What kind of ...? で「どんな種類の〜」。What kind of ice cream do you like? の語順。kind of は続けて使います。' WHERE level = '4級' AND prompt_ja = 'ビル、君はどんな種類のアイスクリームが好きですか。';
UPDATE public.reading_word_order_questions SET explanation = 'She is good at playing tennis. be good at + -ing で「〜するのが得意」。playing が動名詞です。' WHERE level = '4級' AND prompt_ja = '彼女はテニスをするのが得意です。';
UPDATE public.reading_word_order_questions SET explanation = 'enjoy + -ing で「〜することを楽しむ」。I enjoy reading books で「私は本を読むことを楽しんでいる」。' WHERE level = '4級' AND prompt_ja = '私は本を読むことを楽しんでいます。';
UPDATE public.reading_word_order_questions SET explanation = 'He likes watching soccer. like + -ing で「〜するのが好き」。watching は動名詞です。' WHERE level = '4級' AND prompt_ja = '彼はサッカーを見るのが好きです。';
UPDATE public.reading_word_order_questions SET explanation = 'She likes singing songs. like + -ing で「〜するのが好き」。singing は動名詞です。' WHERE level = '4級' AND prompt_ja = '彼女は歌を歌うことが好きです。';
