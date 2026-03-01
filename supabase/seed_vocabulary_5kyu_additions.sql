-- seed_vocabulary_5kyu_additions.sql
-- レベルチェック５級・短文・会話・語句整序シードとの整合のため、5級に不足している語を追加
-- 実行: seed_vocabulary_5kyu.sql 投入後、本ファイルを実行
-- 参照: docs/seed_vocabulary_5kyu_レビュー.md

-- ========== 公式例題・単語テストで出る語 ==========
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'beautiful', '美しい', '形容詞', '様子・程度', '/ˈbjuːtɪfl/', 'It is beautiful.', 'それは美しいです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'cloudy', '曇りの', '形容詞', '様子・程度', '/ˈklaʊdi/', 'It is cloudy today.', '今日は曇りです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'plate', '皿', '名詞', '食べ物・飲み物', '/pleɪt/', 'Put the food on the plate.', '食べ物を皿にのせて。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'clock', '時計', '名詞', '文房具・物', '/klɑːk/', 'What time is it by the clock?', '時計では何時ですか？');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'girl', '少女・女の子', '名詞', '人', '/ɡɜːrl/', 'That girl is my friend.', 'あの女の子は私の友達です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'hand', '手', '名詞', '体', '/hænd/', 'Wash your hands.', '手を洗いなさい。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'walk', '歩く', '動詞', '基本動詞', '/wɔːk/', 'I walk to school.', '私は学校まで歩きます。');

-- ========== 教科・言語・身の回りの名詞 ==========
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'music', '音楽', '名詞', 'スポーツ・楽器', '/ˈmjuːzɪk/', 'I like music.', '私は音楽が好きです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'English', '英語・英語の', '名詞・形容詞', '学校関連', '/ˈɪŋɡlɪʃ/', 'I speak English.', '私は英語を話します。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'math', '数学', '名詞', '学校関連', '/mæθ/', 'I study math.', '私は数学を勉強します。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'science', '理科', '名詞', '学校関連', '/ˈsaɪəns/', 'Science is fun.', '理科はおもしろい。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'apple', 'りんご', '名詞', '食べ物・飲み物', '/ˈæpl/', 'I want an apple.', 'りんごが欲しいです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'orange', 'オレンジ・みかん', '名詞・形容詞', '食べ物・飲み物', '/ˈɔːrɪndʒ/', 'Orange juice, please.', 'オレンジジュースをください。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'milk', '牛乳', '名詞', '食べ物・飲み物', '/mɪlk/', 'I drink milk.', '私は牛乳を飲みます。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'movie', '映画', '名詞', '趣味', '/ˈmuːvi/', 'Let''s see a movie.', '映画を見ましょう。');

-- ========== 家族・人 ==========
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'aunt', '叔母・伯母', '名詞', '家族', '/ænt/', 'My aunt lives in Tokyo.', '私の叔母は東京に住んでいます。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'uncle', '叔父・伯父', '名詞', '家族', '/ˈʌŋkl/', 'My uncle is tall.', '私の叔父は背が高いです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'boy', '男の子', '名詞', '人', '/bɔɪ/', 'That boy is my brother.', 'あの男の子は私の兄です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'man', '男性', '名詞', '人', '/mæn/', 'That man is my father.', 'あの男性は私の父です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'woman', '女性', '名詞', '人', '/ˈwʊmən/', 'That woman is my teacher.', 'あの女性は私の先生です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'grandfather', '祖父', '名詞', '家族', '/ˈɡrænfɑːðər/', 'My grandfather is kind.', '私の祖父は親切です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'grandmother', '祖母', '名詞', '家族', '/ˈɡrænmʌðər/', 'My grandmother cooks well.', '私の祖母は料理が上手です。');

-- ========== 基本動詞（シードで使用） ==========
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'draw', '描く', '動詞', '基本動詞', '/drɔː/', 'He draws pictures.', '彼は絵を描きます。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'open', '開ける', '動詞', '基本動詞', '/ˈoʊpən/', 'Please open the window.', '窓を開けてください。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'close', '閉める', '動詞', '基本動詞', '/kloʊz/', 'Please close the door.', 'ドアを閉めてください。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'run', '走る', '動詞', '基本動詞', '/rʌn/', 'I run in the park.', '私は公園で走ります。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'swim', '泳ぐ', '動詞', '基本動詞', '/swɪm/', 'Can you swim?', '泳げますか？');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'stand', '立つ', '動詞', '基本動詞', '/stænd/', 'Stand up, please.', '立ってください。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'sit', '座る', '動詞', '基本動詞', '/sɪt/', 'Sit down, please.', '座ってください。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'sleep', '寝る', '動詞', '基本動詞', '/sliːp/', 'I sleep at nine.', '私は9時に寝ます。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'live', '住む', '動詞', '基本動詞', '/lɪv/', 'I live in Osaka.', '私は大阪に住んでいます。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'work', '働く', '動詞', '基本動詞', '/wɜːrk/', 'My father works at a hospital.', '父は病院で働いています。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'love', '愛する・大好き', '動詞', '基本動詞', '/lʌv/', 'I love soccer.', '私はサッカーが大好きです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'cook', '料理する', '動詞', '基本動詞', '/kʊk/', 'My mother cooks dinner.', '母は夕食を作ります。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'need', '必要とする', '動詞', '基本動詞', '/niːd/', 'I need a pen.', 'ペンが必要です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'find', '見つける', '動詞', '基本動詞', '/faɪnd/', 'I cannot find my key.', '鍵が見つかりません。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'put', '置く', '動詞', '基本動詞', '/pʊt/', 'Put the book on the desk.', '本を机の上に置いて。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'wear', '着る', '動詞', '基本動詞', '/wer/', 'I wear a uniform.', '私は制服を着ています。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'rain', '雨・雨が降る', '名詞・動詞', '天気', '/reɪn/', 'It is raining.', '雨が降っています。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'excuse', '許す', '動詞', '基本動詞', '/ɪkˈskjuːz/', 'Excuse me.', 'すみません。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'thank', '感謝する', '動詞', '基本動詞', '/θæŋk/', 'Thank you.', 'ありがとうございます。');

-- ========== 形容詞（様子・あいさつ） ==========
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'sunny', '晴れた', '形容詞', '様子・程度', '/ˈsʌni/', 'It is sunny today.', '今日は晴れです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'nice', 'すてきな・いい', '形容詞', '様子・程度', '/naɪs/', 'Nice to meet you.', 'お会いできてうれしいです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'kind', '親切な', '形容詞', '様子・程度', '/kaɪnd/', 'My mother is kind.', '母は親切です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'clean', 'きれいな', '形容詞', '様子・程度', '/kliːn/', 'My room is clean.', '私の部屋はきれいです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'young', '若い', '形容詞', '様子・程度', '/jʌŋ/', 'She is young.', '彼女は若いです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'fine', '元気な', '形容詞', '様子・程度', '/faɪn/', 'I am fine.', '私は元気です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'sorry', 'すまない・残念', '形容詞', '様子・程度', '/ˈsɔːri/', 'I am sorry.', 'すみません。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'next', '次の', '形容詞', '様子・程度', '/nekst/', 'Take the next train.', '次の電車に乗ってください。');

-- ========== 建物・乗り物・物 ==========
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'door', 'ドア', '名詞', '場所・建物', '/dɔːr/', 'Open the door.', 'ドアを開けて。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'window', '窓', '名詞', '場所・建物', '/ˈwɪndoʊ/', 'Close the window.', '窓を閉めて。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'bed', 'ベッド', '名詞', '場所・建物', '/bed/', 'Your bag is on the bed.', 'かばんはベッドの上にあります。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'floor', '床', '名詞', '場所・建物', '/flɔːr/', 'Sit on the floor.', '床に座って。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'restroom', 'トイレ', '名詞', '場所・建物', '/ˈrestruːm/', 'Where is the restroom?', 'トイレはどこですか？');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'train', '電車', '名詞', '乗り物', '/treɪn/', 'I take the train to school.', '私は電車で学校に行きます。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'bus', 'バス', '名詞', '乗り物', '/bʌs/', 'I go by bus.', '私はバスで行きます。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'car', '車', '名詞', '乗り物', '/kɑːr/', 'My father has a car.', '父は車を持っています。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'bicycle', '自転車', '名詞', '乗り物', '/ˈbaɪsɪkl/', 'I ride a bicycle.', '私は自転車に乗ります。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'ticket', '切符・チケット', '名詞', '物', '/ˈtɪkɪt/', 'I need a ticket.', '切符が必要です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'money', 'お金', '名詞', '物', '/ˈmʌni/', 'I don''t have money.', 'お金を持っていません。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'yen', '円', '名詞', '物', '/jen/', 'It is 100 yen.', '100円です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'dollar', 'ドル', '名詞', '物', '/ˈdɑːlər/', 'It is 30 dollars.', '30ドルです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'minute', '分', '名詞', '時間', '/ˈmɪnɪt/', 'It is 5 minutes from here.', 'ここから5分です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'snow', '雪', '名詞', '天気', '/snoʊ/', 'We have snow in winter.', '冬には雪が降ります。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'weather', '天気', '名詞', '天気', '/ˈweðər/', 'The weather is nice.', '天気がいいです。');

-- ========== あいさつ・定型表現 ==========
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'please', 'どうぞ・ください', '副詞', '頻度・程度', '/pliːz/', 'Please help me.', '手伝ってください。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'thanks', 'ありがとう', '名詞・感動詞', 'あいさつ', '/θæŋks/', 'Thanks.', 'ありがとう。');

-- ========== 色 ==========
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'color', '色', '名詞', '様子・程度', '/ˈkʌlər/', 'What color is it?', '何色ですか？');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'red', '赤い・赤', '形容詞・名詞', '様子・程度', '/red/', 'I have a red pen.', '赤いペンを持っています。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'blue', '青い・青', '形容詞・名詞', '様子・程度', '/bluː/', 'The sky is blue.', '空は青いです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'yellow', '黄色い・黄色', '形容詞・名詞', '様子・程度', '/ˈjeloʊ/', 'I like yellow.', '黄色が好きです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'green', '緑の・緑', '形容詞・名詞', '様子・程度', '/ɡriːn/', 'Green is my favorite color.', '緑が一番好きな色です。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'black', '黒い・黒', '形容詞・名詞', '様子・程度', '/blæk/', 'I have black hair.', '私は黒い髪をしています。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'white', '白い・白', '形容詞・名詞', '様子・程度', '/waɪt/', 'The cat is white.', 'その猫は白いです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'pink', 'ピンクの・ピンク', '形容詞・名詞', '様子・程度', '/pɪŋk/', 'I like pink.', 'ピンクが好きです。');
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES ('5級', 'brown', '茶色の・茶色', '形容詞・名詞', '様子・程度', '/braʊn/', 'I have brown eyes.', '私は茶色い目をしています。');
