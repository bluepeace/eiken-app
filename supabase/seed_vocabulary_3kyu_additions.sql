-- 3級 追加単語（レベルチェック３級に基づく頻出語）
-- 046_vocabulary_unique_level_word 実行後に実行可能。既存DBへの追加用。
-- 参照: docs/レベルチェック３級.md
-- 重複防止: ON CONFLICT は vocabulary に unique(level, word) がある場合に使用可能。

INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja) VALUES
('3級', 'knock', 'ノックする・たたく', '動詞', '日常・基本', '/nɑːk/', 'Someone knocked on the door.', '誰かがドアをノックしました。'),
('3級', 'stamp', '切手・スタンプ', '名詞', '社会・環境・公共', '/stæmp/', 'I need a stamp for this letter.', 'この手紙に切手が必要です。'),
('3級', 'delicious', 'おいしい', '形容詞', '様子・性質', '/dɪˈlɪʃəs/', 'This cake is delicious.', 'このケーキはおいしいです。'),
('3級', 'question', '質問・問題', '名詞', '抽象概念', '/ˈkwestʃən/', 'Do you have any questions?', '質問はありますか？'),
('3級', 'subject', '教科・題材・主語', '名詞', '社会・環境・公共', '/ˈsʌbdʒɪkt/', 'What is your favorite subject?', '一番好きな教科は何ですか？'),
('3級', 'ride', '乗る・（乗り物で）行く', '動詞', '日常・基本', '/raɪd/', 'I rode a bike to school.', '自転車で学校に行きました。'),
('3級', 'heavy', '重い', '形容詞', '様子・性質', '/ˈhevi/', 'This bag is too heavy.', 'この鞄は重すぎます。'),
('3級', 'hungry', 'お腹が空いた', '形容詞', '様子・性質', '/ˈhʌŋɡri/', 'I am hungry. Let''s eat lunch.', 'お腹が空きました。昼食を食べましょう。'),
('3級', 'fact', '事実', '名詞', '抽象概念', '/fækt/', 'The fact is that he was late.', '事実は彼が遅れたということです。'),
('3級', 'interesting', '興味深い・面白い', '形容詞', '様子・性質', '/ˈɪntrəstɪŋ/', 'It was an interesting experience.', 'それは興味深い経験でした。')
ON CONFLICT (level, word) DO NOTHING;
