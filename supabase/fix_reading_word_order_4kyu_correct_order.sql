-- fix_reading_word_order_4kyu_correct_order.sql
-- 既に登録済みの4級語句整序を修正するSQL（正解並びの誤り修正 + 語句並びの単調さ解消）
-- 045 マイグレーション適用済み・語句整序4級データが入っているDBで実行してください

-- ========== 正解並びのみ修正（語句はそのまま） ==========
UPDATE public.reading_word_order_questions
SET correct_order = '[1, 2, 0, 3]'
WHERE level = '4級' AND prompt_ja = '水をいただけますか。';

-- ========== 2025年3月 追加修正（順番誤り・語句欠落） ==========
-- Q14: ポール - 主語を追加し文を完成
UPDATE public.reading_word_order_questions
SET words = '["Paul", "didn''t", "have", "time", "to eat", "breakfast"]', correct_order = '[0, 1, 2, 3, 4, 5]'
WHERE level = '4級' AND prompt_ja = 'ポールは今日遅く起きたので、朝食を食べる時間がありませんでした。';

-- Q16: Do we have to（語順修正）
UPDATE public.reading_word_order_questions
SET correct_order = '[4, 2, 1, 3, 0]'
WHERE level = '4級' AND prompt_ja = '私たちは明日家の掃除をしなければいけませんか。';

-- Q21: キャロル - 主語を追加し語順を修正
UPDATE public.reading_word_order_questions
SET words = '["Carol", "left", "her house", "at 7", "for", "school"]', correct_order = '[0, 1, 2, 3, 4, 5]'
WHERE level = '4級' AND prompt_ja = 'キャロルは昨日7時に家を出て学校へ向かいました。';

-- Q23: 彼女は先週京都で - 語句を追加して文を完成
UPDATE public.reading_word_order_questions
SET words = '["she", "had", "a great weekend", "in Kyoto", "last week"]', correct_order = '[0, 1, 2, 3, 4]'
WHERE level = '4級' AND prompt_ja = '彼女は先週京都で楽しい週末を過ごしました。';

-- Q26: I visited my grandmother（語順修正）
UPDATE public.reading_word_order_questions
SET correct_order = '[1, 2, 3, 0]'
WHERE level = '4級' AND prompt_ja = '私は先週の日曜日に祖母を訪ねました。';

-- Q30: あの動物園で - at the zoo を追加して文を完成
UPDATE public.reading_word_order_questions
SET words = '["did", "you", "see", "the lions", "at the zoo"]', correct_order = '[0, 1, 2, 3, 4]'
WHERE level = '4級' AND prompt_ja = 'あの動物園でライオンを見ましたか。';

-- Q33: We will go hiking（語順修正）
UPDATE public.reading_word_order_questions
SET correct_order = '[1, 3, 0, 2, 4]'
WHERE level = '4級' AND prompt_ja = '私たちは今週末ハイキングに行くつもりです。';

-- Q46: What kind of - do you like を追加して文を完成
UPDATE public.reading_word_order_questions
SET words = '["what", "kind of", "ice cream", "do you like"]', correct_order = '[0, 1, 2, 3]'
WHERE level = '4級' AND prompt_ja = 'ビル、君はどんな種類のアイスクリームが好きですか。';

-- Q47-Q50: be good at / enjoy / like + -ing の語順（動名詞が目的語の前に来る）
UPDATE public.reading_word_order_questions
SET correct_order = '[1, 3, 2, 0]'
WHERE level = '4級' AND prompt_ja = '彼女はテニスをするのが得意です。';

UPDATE public.reading_word_order_questions
SET correct_order = '[1, 3, 2, 0]'
WHERE level = '4級' AND prompt_ja = '私は本を読むことを楽しんでいます。';

UPDATE public.reading_word_order_questions
SET correct_order = '[1, 3, 2, 0]'
WHERE level = '4級' AND prompt_ja = '彼はサッカーを見るのが好きです。';

UPDATE public.reading_word_order_questions
SET correct_order = '[1, 3, 2, 0]'
WHERE level = '4級' AND prompt_ja = '彼女は歌を歌うことが好きです。';

-- ========== to不定詞（語句並びを変えて [1,3,0,2,4] を解消） ==========
UPDATE public.reading_word_order_questions
SET words = '["some books", "went to the library", "I", "borrow", "to"]', correct_order = '[2, 1, 4, 3, 0]'
WHERE level = '4級' AND prompt_ja = '私は本を借りるために図書館へ行きました。';

UPDATE public.reading_word_order_questions
SET words = '["learn", "he", "English every day", "to", "studies hard"]', correct_order = '[1, 4, 3, 0, 2]'
WHERE level = '4級' AND prompt_ja = '彼は英語を学ぶために毎日勉強しています。';

-- I went to the station to buy a ticket（to の位置を修正）
UPDATE public.reading_word_order_questions
SET words = '["a ticket", "to", "went to the station", "buy", "I"]', correct_order = '[4, 2, 1, 3, 0]'
WHERE level = '4級' AND prompt_ja = '私はチケットを買うために駅へ行きました。';

-- She is studying to become a doctor at university.（to の位置を修正）
UPDATE public.reading_word_order_questions
SET words = '["a doctor at university", "to", "she", "become", "is studying"]', correct_order = '[2, 4, 1, 3, 0]'
WHERE level = '4級' AND prompt_ja = '彼女は医者になるために大学で勉強しています。';

UPDATE public.reading_word_order_questions
SET words = '["the news", "he", "watch", "turned on the TV", "to"]', correct_order = '[1, 3, 4, 2, 0]'
WHERE level = '4級' AND prompt_ja = '彼はニュースを見るためにテレビをつけました。';

-- ========== 連番 [0,1,2,3,4] を解消 ==========
-- They didn't have time to see the movie.（time の位置を修正）
UPDATE public.reading_word_order_questions
SET words = '["to see the movie", "time", "didn''t", "they", "have"]', correct_order = '[3, 2, 4, 1, 0]'
WHERE level = '4級' AND prompt_ja = '彼らは映画を見る時間がありませんでした。';

-- 主語を入れて全文に（Bill didn't have time to eat breakfast.）
UPDATE public.reading_word_order_questions
SET words = '["Bill", "breakfast", "to eat", "didn''t", "time", "have"]', correct_order = '[0, 3, 5, 4, 2, 1]'
WHERE level = '4級' AND prompt_ja = 'ビルは今朝、朝食を食べる時間がありませんでした。';

UPDATE public.reading_word_order_questions
SET words = '["clean our house tomorrow", "have to", "Mom", "do", "we"]', correct_order = '[2, 3, 4, 1, 0]'
WHERE level = '4級' AND prompt_ja = 'お母さん、明日は家の掃除をしなければいけませんか。';

UPDATE public.reading_word_order_questions
SET words = '["many times", "my new CD", "listened", "I", "to"]', correct_order = '[3, 2, 4, 1, 0]'
WHERE level = '4級' AND prompt_ja = '私は新しいCDを何回も聞きました。';

UPDATE public.reading_word_order_questions
SET words = '["movies", "about", "my brother", "talk", "with"]', correct_order = '[3, 4, 2, 1, 0]'
WHERE level = '4級' AND prompt_ja = '私は、よく兄と映画について話します。';

UPDATE public.reading_word_order_questions
SET words = '["about the math test", "talk", "with Mr. Brown", "I", "will"]', correct_order = '[3, 4, 1, 2, 0]'
WHERE level = '4級' AND prompt_ja = '私は、数学のテストについてブラウン先生と放課後に話します。';

UPDATE public.reading_word_order_questions
SET words = '["Chinese and French", "both", "your father", "Can", "speak"]', correct_order = '[3, 4, 1, 2, 0]'
WHERE level = '4級' AND prompt_ja = 'あなたのお父さんは中国語とフランス語の両方を話せますか。';

-- 注: Q14, Q16, Q21, Q23, Q26, Q30, Q33, Q46, Q47-Q50 の修正は上記「2025年3月 追加修正」に含まれています

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
