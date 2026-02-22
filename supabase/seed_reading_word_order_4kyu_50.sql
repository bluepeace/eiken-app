-- seed_reading_word_order_4kyu_50.sql
-- 英検4級 語句整序問題 50問
-- 過去問（5語・to不定詞、助動詞、接続詞、受動態、慣用表現など）のレベル・出題傾向を反映
-- 028 マイグレーション実行後に実行

-- ========== May I / Could you / Would you 依頼・丁寧表現 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', 'あなたの電話番号を教えていただけますか。', '["number", "may", "your telephone", "I", "have"]', '[1, 3, 4, 2, 0]'),
  ('4級', '窓を閉めていただけますか。', '["close", "could", "you", "the window"]', '[1, 2, 0, 3]'),
  ('4級', 'もう一度言っていただけますか。', '["again", "could", "you", "say it"]', '[1, 2, 3, 0]'),
  ('4級', '地図を貸していただけますか。', '["lend", "could", "you", "me your map"]', '[1, 2, 0, 3]'),
  ('4級', '水をいただけますか。', '["have", "could", "I", "some water"]', '[2, 1, 0, 3]');

-- ========== to不定詞（目的・名詞的用法） ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', '私は本を借りるために図書館へ行きました。', '["to", "I", "borrow", "went to the library", "some books"]', '[1, 3, 0, 4, 2]'),
  ('4級', '彼は英語を学ぶために毎日勉強しています。', '["to", "he", "learn", "studies hard", "English every day"]', '[1, 3, 0, 2, 4]'),
  ('4級', '私はチケットを買うために駅へ行きました。', '["to", "I", "buy", "went to the station", "a ticket"]', '[1, 3, 0, 4, 2]'),
  ('4級', '彼女は医者になるために大学で勉強しています。', '["to", "she", "become", "is studying", "a doctor at university"]', '[1, 3, 0, 4, 2]'),
  ('4級', '彼はニュースを見るためにテレビをつけました。', '["to", "he", "watch", "turned on the TV", "the news"]', '[1, 3, 0, 4, 2]'),
  ('4級', '私は泳ぐことが好きです。', '["swim", "I", "to", "like"]', '[1, 3, 2, 0]'),
  ('4級', '彼女は料理をすることが得意です。', '["cooking", "she", "is good at"]', '[1, 2, 0]'),
  ('4級', '彼らは映画を見る時間がありませんでした。', '["they", "didn''t", "have", "time", "to see the movie"]', '[0, 1, 2, 3, 4]');

-- ========== have to / didn't have to / 過去形 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', 'ポールは今日遅く起きたので、朝食を食べる時間がありませんでした。', '["have", "didn''t", "breakfast", "for", "time"]', '[1, 0, 4, 3, 2]'),
  ('4級', 'ビルは今朝、朝食を食べる時間がありませんでした。', '["didn''t", "have", "time", "to eat", "breakfast"]', '[0, 1, 2, 3, 4]'),
  ('4級', '私たちは明日家の掃除をしなければいけませんか。', '["Do", "we", "have", "to", "clean our house tomorrow"]', '[0, 1, 2, 3, 4]'),
  ('4級', '彼女は昨日宿題をしなければなりませんでした。', '["do", "she", "to", "had", "her homework yesterday"]', '[1, 3, 2, 0, 4]'),
  ('4級', '良夫君、あなたの英語の宿題を見せてください。', '["your", "homework", "English", "show", "me"]', '[3, 4, 0, 2, 1]'),
  ('4級', 'お母さん、明日は家の掃除をしなければいけませんか。', '["Mom", "do", "we", "have to", "clean our house tomorrow"]', '[0, 1, 2, 3, 4]');

-- ========== 過去形・for the first time 等 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', '祖父は去年初めて飛行機に乗りました。', '["a plane", "for", "my grandfather", "took", "the first time"]', '[2, 3, 0, 1, 4]'),
  ('4級', 'キャロルは昨日7時に家を出て学校へ向かいました。', '["left", "her house", "at 7", "for", "school"]', '[0, 1, 2, 3, 4]'),
  ('4級', '私は新しいCDを何回も聞きました。', '["I", "listened", "to", "my new CD", "many times"]', '[0, 1, 2, 3, 4]'),
  ('4級', '彼女は先週京都で楽しい週末を過ごしました。', '["great", "a", "she", "weekend", "had"]', '[2, 4, 1, 0, 3]'),
  ('4級', '彼は昨夜11時に寝ました。', '["at eleven", "he", "last night", "went to bed"]', '[1, 3, 0, 2]'),
  ('4級', '彼らは昨日公園でサッカーをしました。', '["in the park", "they", "yesterday", "played soccer"]', '[1, 3, 0, 2]'),
  ('4級', '私は先週の日曜日に祖母を訪ねました。', '["last Sunday", "I", "visited", "my grandmother"]', '[1, 3, 0, 2]');

-- ========== talk about / speak / ask 等 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', '私はケント先生に趣味についてたずねました。', '["about", "Mr. Kent", "hobbies", "asked", "his"]', '[3, 1, 0, 4, 2]'),
  ('4級', '私は、よく兄と映画について話します。', '["talk", "with", "my brother", "about", "movies"]', '[0, 1, 2, 3, 4]'),
  ('4級', '私は、数学のテストについてブラウン先生と放課後に話します。', '["I", "will", "talk", "with Mr. Brown", "about the math test"]', '[0, 1, 2, 3, 4]'),
  ('4級', 'あなたのお父さんは中国語とフランス語の両方を話せますか。', '["Can", "your father", "speak", "both", "Chinese and French"]', '[0, 1, 2, 3, 4]'),
  ('4級', 'あの動物園でライオンを見ましたか。', '["did", "see", "at", "the lions", "you"]', '[0, 4, 1, 3, 2]');

-- ========== 助動詞（will, must, should, can） ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', '彼は来週大阪へ出張します。', '["to Osaka", "he", "will", "go", "on business next week"]', '[1, 2, 3, 0, 4]'),
  ('4級', '私たちは今週末ハイキングに行くつもりです。', '["go", "we", "hiking", "will", "this weekend"]', '[1, 3, 2, 0, 4]'),
  ('4級', 'あなたは今日早く帰らなければなりません。', '["early", "you", "must", "go home", "today"]', '[1, 2, 3, 0, 4]'),
  ('4級', '彼女はピアノを弾くことができます。', '["the piano", "she", "can", "play"]', '[1, 2, 3, 0]'),
  ('4級', 'あなたはもっと野菜を食べるべきです。', '["more vegetables", "you", "should", "eat"]', '[1, 2, 3, 0]'),
  ('4級', '彼は明日までにレポートを完成させなければなりません。', '["by tomorrow", "he", "must", "finish", "the report"]', '[1, 2, 3, 4, 0]');

-- ========== 受動態 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', 'この本は多くの人々に読まれています。', '["by", "this book", "is read", "many people"]', '[1, 2, 0, 3]'),
  ('4級', 'その橋は50年前に建てられました。', '["fifty years ago", "the bridge", "was built"]', '[1, 2, 0]'),
  ('4級', 'この歌は世界中で歌われています。', '["all over the world", "this song", "is sung"]', '[1, 2, 0]'),
  ('4級', '英語は多くの国で話されています。', '["in many countries", "English", "is spoken"]', '[1, 2, 0]');

-- ========== 接続詞（because, so, when, if） ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', '雨が降っていたので、私たちは家にいました。', '["it", "rained", "so", "we", "stayed at home"]', '[0, 1, 2, 3, 4]'),
  ('4級', '彼は疲れていたので、早く寝ました。', '["He", "went to bed early", "because", "he", "was tired"]', '[0, 1, 2, 3, 4]'),
  ('4級', '彼女が電話したとき、私は宿題をしていました。', '["When", "she called", "I", "was doing", "my homework"]', '[0, 1, 2, 3, 4]'),
  ('4級', '明日晴れたら、ピクニックに行きます。', '["If", "it is sunny tomorrow", "we", "will go", "on a picnic"]', '[0, 1, 2, 3, 4]');

-- ========== What kind of / be good at / enjoy 等 ==========
INSERT INTO public.reading_word_order_questions (level, prompt_ja, words, correct_order) VALUES
  ('4級', 'ビル、君はどんな種類のアイスクリームが好きですか。', '["ice cream", "what", "kind", "do", "of"]', '[1, 2, 3, 4, 0]'),
  ('4級', '彼女はテニスをするのが得意です。', '["tennis", "she", "playing", "is good at"]', '[1, 3, 0, 2]'),
  ('4級', '私は本を読むことを楽しんでいます。', '["books", "I", "reading", "enjoy"]', '[1, 3, 0, 2]'),
  ('4級', '彼はサッカーを見るのが好きです。', '["soccer", "he", "watching", "likes"]', '[1, 3, 0, 2]'),
  ('4級', '彼女は歌を歌うことが好きです。', '["songs", "she", "singing", "likes"]', '[1, 3, 0, 2]');
