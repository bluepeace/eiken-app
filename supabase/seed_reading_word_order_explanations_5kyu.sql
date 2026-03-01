-- seed_reading_word_order_explanations_5kyu.sql
-- 英検5級 語句整序問題の解説（045 マイグレーション・語句整序 seed 実行後に実行）

-- ========== How much / How many 疑問文 ==========
UPDATE public.reading_word_order_questions SET explanation = '「いくら」は How much。疑問文の語順は「How much + be動詞 + 主語」です。These shoes が主語なので be動詞は are。' WHERE level = '5級' AND prompt_ja = 'これらの靴はいくらですか。';
UPDATE public.reading_word_order_questions SET explanation = '「いくら」は How much。That book は単数なので be動詞は is。語順は How much + is + 主語。' WHERE level = '5級' AND prompt_ja = 'あの本はいくらですか。';
UPDATE public.reading_word_order_questions SET explanation = '「何人」は How many。There is/are の疑問文は How many + 複数名詞 + are + there。' WHERE level = '5級' AND prompt_ja = 'あなたのクラスには何人の生徒がいますか。';
UPDATE public.reading_word_order_questions SET explanation = '「いくつ」は How many。There are の疑問文は How many + 複数名詞 + are + there。' WHERE level = '5級' AND prompt_ja = '机の上にりんごがいくつありますか。';
UPDATE public.reading_word_order_questions SET explanation = '「いくら」は How much。That bag は単数なので is。How much + is + 主語の順。' WHERE level = '5級' AND prompt_ja = 'あのカバンはいくらですか。';

-- ========== What / Who / Where / When 疑問文 ==========
UPDATE public.reading_word_order_questions SET explanation = '「だれ」は Who。Who の疑問文は Who + be動詞 + 主語。in the photo は the girl を修飾します。' WHERE level = '5級' AND prompt_ja = 'この写真の中の女の子はだれですか。';
UPDATE public.reading_word_order_questions SET explanation = '「何をしている」は What are you doing。現在進行形の疑問文です。' WHERE level = '5級' AND prompt_ja = 'あなたは今何をしていますか。';
UPDATE public.reading_word_order_questions SET explanation = '「どこに」は Where。Where の疑問文は Where + be動詞 + 主語。' WHERE level = '5級' AND prompt_ja = 'あなたの本はどこにありますか。';
UPDATE public.reading_word_order_questions SET explanation = '「いつ」は When。Do で始まる疑問文で、When は文頭に置きます。When + do + 主語 + 動詞。' WHERE level = '5級' AND prompt_ja = 'あなたはいつ学校に行きますか。';
UPDATE public.reading_word_order_questions SET explanation = '「何が」は What。What do we need? で「私たちは何が必要ですか」の語順です。' WHERE level = '5級' AND prompt_ja = '私たちは何が必要ですか。';
UPDATE public.reading_word_order_questions SET explanation = '三人称単数の疑問文は Does + 主語 + 動詞の原形。What は文頭、Tom''s father が主語なので Does を使います。' WHERE level = '5級' AND prompt_ja = 'トムのお父さんは大学で何を教えていますか。';
UPDATE public.reading_word_order_questions SET explanation = '「いつ」は When。When do you get up ...? の語順です。' WHERE level = '5級' AND prompt_ja = 'あなたは朝何時に起きますか。';
UPDATE public.reading_word_order_questions SET explanation = '「だれ」は Who。Who + be動詞 + 主語で「あの男の子はだれですか」。' WHERE level = '5級' AND prompt_ja = 'あの男の子はだれですか。';
UPDATE public.reading_word_order_questions SET explanation = '「いつ」は When。When + be動詞 + 主語で「あなたの誕生日はいつですか」。' WHERE level = '5級' AND prompt_ja = 'あなたの誕生日はいつですか。';
UPDATE public.reading_word_order_questions SET explanation = '三人称単数の疑問文は Does + 主語 + 動詞の原形。What does Mary like? の語順です。' WHERE level = '5級' AND prompt_ja = 'メアリーは何が好きですか。';

-- ========== Does / Do 疑問文 ==========
UPDATE public.reading_word_order_questions SET explanation = '三人称単数（your sister）の疑問文は Does + 主語 + 動詞の原形。go skiing で「スキーに行く」。' WHERE level = '5級' AND prompt_ja = 'あなたの妹さんは毎年スキーに行きますか。';
UPDATE public.reading_word_order_questions SET explanation = '三人称単数（he）の疑問文は Does + he + 動詞の原形。' WHERE level = '5級' AND prompt_ja = '彼は毎日勉強しますか。';
UPDATE public.reading_word_order_questions SET explanation = 'Do you ...? で「あなたは〜しますか」。on Sundays は「日曜日には」。' WHERE level = '5級' AND prompt_ja = 'あなたは日曜日にテニスをしますか。';
UPDATE public.reading_word_order_questions SET explanation = '三人称単数（she）の疑問文は Does + she + 動詞の原形。speak English で「英語を話す」。' WHERE level = '5級' AND prompt_ja = '彼女は英語を話しますか。';
UPDATE public.reading_word_order_questions SET explanation = 'Do you like ...? で「あなたは〜が好きですか」。' WHERE level = '5級' AND prompt_ja = 'あなたは野球が好きですか。';

-- ========== 肯定文（SVO, SVC, 時・場所の前置詞句）==========
UPDATE public.reading_word_order_questions SET explanation = '主語は The flower shop（単数）。opens at ten o''clock で「10時に開く」。時を表す at は動詞の後。' WHERE level = '5級' AND prompt_ja = 'その花屋は毎日10時に開きます。';
UPDATE public.reading_word_order_questions SET explanation = 'Today is the first day of ... で「今日は〜の初日です」。of の後に修飾される名詞が続きます。' WHERE level = '5級' AND prompt_ja = '今日は私たちの修学旅行の初日です。';
UPDATE public.reading_word_order_questions SET explanation = '主語 + 動詞 + 場所。My aunt lives in London で「私の叔母はロンドンに住んでいる」。in は場所の前置詞。' WHERE level = '5級' AND prompt_ja = '私の叔母はロンドンに住んでいます。';
UPDATE public.reading_word_order_questions SET explanation = 'He gets up at seven every morning. 主語 + 動詞 + 時の表現の順。at seven は「7時に」。' WHERE level = '5級' AND prompt_ja = '彼は毎朝7時に起きます。';
UPDATE public.reading_word_order_questions SET explanation = '現在進行形は am/are/is + -ing。I am cooking breakfast for Hiro. for は「〜のために」。' WHERE level = '5級' AND prompt_ja = '私は浩のために朝食を作っています。';
UPDATE public.reading_word_order_questions SET explanation = '主語 + 動詞 + 目的語。She likes music で「彼女は音楽が好きです」。' WHERE level = '5級' AND prompt_ja = '彼女は音楽が好きです。';
UPDATE public.reading_word_order_questions SET explanation = 'We play soccer in the park. 主語 + 動詞 + 目的語 + 場所。in the park は「公園で」。' WHERE level = '5級' AND prompt_ja = '私たちは公園でサッカーをします。';
UPDATE public.reading_word_order_questions SET explanation = '主語 + 動詞 + 時の表現。He swims on Mondays で「彼は月曜日に泳ぐ」。' WHERE level = '5級' AND prompt_ja = '彼は月曜日に泳ぎます。';
UPDATE public.reading_word_order_questions SET explanation = '場所の on the sofa「ソファの上に」。The cat is on the sofa で「その猫はソファの上にいる」。' WHERE level = '5級' AND prompt_ja = 'その猫はソファの上にいます。';
UPDATE public.reading_word_order_questions SET explanation = '主語 + 動詞 + 目的語 + 時の表現。She practices the piano every Saturday. practice は「練習する」。' WHERE level = '5級' AND prompt_ja = '彼女は毎週土曜日にピアノを練習します。';
UPDATE public.reading_word_order_questions SET explanation = 'The dog is in the garden で「その犬は庭にいる」。in は「〜の中に」。' WHERE level = '5級' AND prompt_ja = 'その犬は庭にいます。';

-- ========== Let's / Would you like ==========
UPDATE public.reading_word_order_questions SET explanation = 'Let''s + 動詞の原形で「〜しましょう」。Let''s play soccer in the park で「公園でサッカーをしましょう」。' WHERE level = '5級' AND prompt_ja = '放課後、公園でサッカーをしましょう。';
UPDATE public.reading_word_order_questions SET explanation = 'Would you like ...? で「〜はいかがですか」という丁寧な勧め。Would you like some more coffee? の語順。' WHERE level = '5級' AND prompt_ja = 'コーヒーのお代わりはいかがですか。';
UPDATE public.reading_word_order_questions SET explanation = 'Let''s see a movie now で「今から映画を見ましょう」。Let''s + 動詞の原形。' WHERE level = '5級' AND prompt_ja = '今から映画を見ましょう。';
UPDATE public.reading_word_order_questions SET explanation = 'Would you like some juice? で「ジュースをいかがですか」。Would you like + 名詞の語順。' WHERE level = '5級' AND prompt_ja = 'ジュースをいかがですか。';
UPDATE public.reading_word_order_questions SET explanation = 'Let''s do our homework now で「今から宿題をしましょう」。' WHERE level = '5級' AND prompt_ja = '今から宿題をしましょう。';

-- ========== 現在進行形・Can ==========
UPDATE public.reading_word_order_questions SET explanation = '現在進行形は be動詞 + -ing。She is playing the piano で「彼女は今ピアノを弾いている」。' WHERE level = '5級' AND prompt_ja = '彼女は今ピアノを弾いています。';
UPDATE public.reading_word_order_questions SET explanation = 'Can you + 動詞の原形で「あなたは〜できますか」。speak English で「英語を話す」。' WHERE level = '5級' AND prompt_ja = 'あなたは英語を話せますか。';
UPDATE public.reading_word_order_questions SET explanation = 'Can I + 動詞の原形で「私は〜できる」。I can swim で「私は泳ぐことができる」。' WHERE level = '5級' AND prompt_ja = '私は泳ぐことができます。';
UPDATE public.reading_word_order_questions SET explanation = '現在進行形。He is doing his homework で「彼は今宿題をしている」。doing が動詞の-ing形。' WHERE level = '5級' AND prompt_ja = '彼は今宿題をしています。';
UPDATE public.reading_word_order_questions SET explanation = 'Can you ride a bicycle? で「あなたは自転車に乗れますか」。ride は「乗る」。' WHERE level = '5級' AND prompt_ja = 'あなたは自転車に乗れますか。';
UPDATE public.reading_word_order_questions SET explanation = 'My mother is cooking dinner で「母は今夕食を作っている」。現在進行形は is + -ing。' WHERE level = '5級' AND prompt_ja = '母は今夕食を作っています。';
UPDATE public.reading_word_order_questions SET explanation = 'I can speak Japanese で「私は日本語を話すことができる」。can + 動詞の原形。' WHERE level = '5級' AND prompt_ja = '私は日本語を話すことができます。';

-- ========== その他（否定・依頼・挨拶応答など）==========
UPDATE public.reading_word_order_questions SET explanation = '否定文は be動詞 + not。He isn''t at school today で「彼は今日学校にいない」。' WHERE level = '5級' AND prompt_ja = '彼は今日学校にいません。';
UPDATE public.reading_word_order_questions SET explanation = 'Can I + 動詞の原形で「〜してもいいですか」と許可を求めます。Can I open the window? の語順。' WHERE level = '5級' AND prompt_ja = '窓を開けてもいいですか。';
UPDATE public.reading_word_order_questions SET explanation = '三人称単数の否定は doesn''t + 動詞の原形。My brother doesn''t like fish で「弟は魚が好きではない」。' WHERE level = '5級' AND prompt_ja = '私の弟は魚が好きではありません。';
UPDATE public.reading_word_order_questions SET explanation = 'I don''t have ... で「私は〜を持っていない」。any homework today は「今日の宿題（は何も）」。' WHERE level = '5級' AND prompt_ja = '私は今日宿題がありません。';
UPDATE public.reading_word_order_questions SET explanation = '過去の否定は wasn''t（was not）。She wasn''t at home yesterday で「彼女は昨日家にいなかった」。' WHERE level = '5級' AND prompt_ja = '彼女は昨日家にいませんでした。';
UPDATE public.reading_word_order_questions SET explanation = 'Can I have ...? で「〜をいただけますか」と丁寧に頼む表現。Have を文の意味の中心に置きます。' WHERE level = '5級' AND prompt_ja = '水をいただけますか。';
UPDATE public.reading_word_order_questions SET explanation = '過去形。He came to school yesterday で「彼は昨日学校に来た」。came は come の過去形。' WHERE level = '5級' AND prompt_ja = '彼は昨日学校に来ました。';
