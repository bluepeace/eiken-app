-- fix_reading_word_order_4kyu_correct_order.sql
-- 既に登録済みの4級語句整序を修正するSQL（正解並びの誤り修正 + 語句並びの単調さ解消）
-- 045 マイグレーション適用済み・語句整序4級データが入っているDBで実行してください

-- ========== 正解並びのみ修正（語句はそのまま） ==========
UPDATE public.reading_word_order_questions
SET correct_order = '[1, 2, 0, 3]'
WHERE level = '4級' AND prompt_ja = '水をいただけますか。';

UPDATE public.reading_word_order_questions
SET correct_order = '[1, 2, 4, 0, 3]'
WHERE level = '4級' AND prompt_ja = 'ビル、君はどんな種類のアイスクリームが好きですか。';

-- ========== to不定詞（語句並びを変えて [1,3,0,2,4] を解消） ==========
UPDATE public.reading_word_order_questions
SET words = '["some books", "went to the library", "I", "borrow", "to"]', correct_order = '[2, 1, 4, 3, 0]'
WHERE level = '4級' AND prompt_ja = '私は本を借りるために図書館へ行きました。';

UPDATE public.reading_word_order_questions
SET words = '["learn", "he", "English every day", "to", "studies hard"]', correct_order = '[1, 4, 0, 3, 2]'
WHERE level = '4級' AND prompt_ja = '彼は英語を学ぶために毎日勉強しています。';

-- I went to the station to buy a ticket（to の位置を修正）
UPDATE public.reading_word_order_questions
SET words = '["a ticket", "to", "went to the station", "buy", "I"]', correct_order = '[4, 2, 1, 3, 0]'
WHERE level = '4級' AND prompt_ja = '私はチケットを買うために駅へ行きました。';

UPDATE public.reading_word_order_questions
SET words = '["a doctor at university", "to", "she", "become", "is studying"]', correct_order = '[2, 1, 4, 3, 0]'
WHERE level = '4級' AND prompt_ja = '彼女は医者になるために大学で勉強しています。';

UPDATE public.reading_word_order_questions
SET words = '["the news", "he", "watch", "turned on the TV", "to"]', correct_order = '[1, 3, 4, 2, 0]'
WHERE level = '4級' AND prompt_ja = '彼はニュースを見るためにテレビをつけました。';

-- ========== 連番 [0,1,2,3,4] を解消 ==========
UPDATE public.reading_word_order_questions
SET words = '["to see the movie", "time", "didn''t", "they", "have"]', correct_order = '[3, 1, 2, 4, 0]'
WHERE level = '4級' AND prompt_ja = '彼らは映画を見る時間がありませんでした。';

-- 主語を入れて全文に（Bill didn't have time to eat breakfast.）
UPDATE public.reading_word_order_questions
SET words = '["Bill", "breakfast", "to eat", "didn''t", "time", "have"]', correct_order = '[0, 3, 5, 4, 2, 1]'
WHERE level = '4級' AND prompt_ja = 'ビルは今朝、朝食を食べる時間がありませんでした。';

UPDATE public.reading_word_order_questions
SET words = '["clean our house tomorrow", "have", "we", "to", "Do"]', correct_order = '[4, 1, 2, 3, 0]'
WHERE level = '4級' AND prompt_ja = '私たちは明日家の掃除をしなければいけませんか。';

UPDATE public.reading_word_order_questions
SET words = '["clean our house tomorrow", "have to", "Mom", "do", "we"]', correct_order = '[2, 3, 4, 1, 0]'
WHERE level = '4級' AND prompt_ja = 'お母さん、明日は家の掃除をしなければいけませんか。';

UPDATE public.reading_word_order_questions
SET words = '["school", "for", "left", "at 7", "her house"]', correct_order = '[2, 3, 0, 4, 1]'
WHERE level = '4級' AND prompt_ja = 'キャロルは昨日7時に家を出て学校へ向かいました。';

UPDATE public.reading_word_order_questions
SET words = '["many times", "my new CD", "listened", "I", "to"]', correct_order = '[3, 1, 2, 4, 0]'
WHERE level = '4級' AND prompt_ja = '私は新しいCDを何回も聞きました。';

UPDATE public.reading_word_order_questions
SET words = '["movies", "about", "my brother", "talk", "with"]', correct_order = '[3, 4, 1, 2, 0]'
WHERE level = '4級' AND prompt_ja = '私は、よく兄と映画について話します。';

UPDATE public.reading_word_order_questions
SET words = '["about the math test", "talk", "with Mr. Brown", "I", "will"]', correct_order = '[3, 4, 1, 2, 0]'
WHERE level = '4級' AND prompt_ja = '私は、数学のテストについてブラウン先生と放課後に話します。';

UPDATE public.reading_word_order_questions
SET words = '["Chinese and French", "both", "your father", "Can", "speak"]', correct_order = '[3, 4, 1, 2, 0]'
WHERE level = '4級' AND prompt_ja = 'あなたのお父さんは中国語とフランス語の両方を話せますか。';

-- ========== 接続詞（連番解消） ==========
UPDATE public.reading_word_order_questions
SET words = '["stayed at home", "we", "rained", "so", "it"]', correct_order = '[4, 2, 3, 1, 0]'
WHERE level = '4級' AND prompt_ja = '雨が降っていたので、私たちは家にいました。';

UPDATE public.reading_word_order_questions
SET words = '["was tired", "because", "He", "he", "went to bed early"]', correct_order = '[2, 4, 1, 3, 0]'
WHERE level = '4級' AND prompt_ja = '彼は疲れていたので、早く寝ました。';

UPDATE public.reading_word_order_questions
SET words = '["my homework", "was doing", "When", "I", "she called"]', correct_order = '[2, 4, 3, 1, 0]'
WHERE level = '4級' AND prompt_ja = '彼女が電話したとき、私は宿題をしていました。';

UPDATE public.reading_word_order_questions
SET words = '["on a picnic", "will go", "If", "we", "it is sunny tomorrow"]', correct_order = '[2, 4, 3, 1, 0]'
WHERE level = '4級' AND prompt_ja = '明日晴れたら、ピクニックに行きます。';
