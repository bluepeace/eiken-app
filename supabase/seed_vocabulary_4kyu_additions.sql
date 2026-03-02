-- 4級単語の追加（レベルチェック４級.md に基づく頻出語・例題語）
-- seed_vocabulary_4kyu.sql 実行後、046_vocabulary_unique_level_word マイグレーション実行後に実行
-- 再実行しても重複しない（ON CONFLICT DO NOTHING）
-- 参照: docs/レベルチェック４級.md

-- 4級頻出：規則動詞
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'ask', '尋ねる・頼む', '動詞', '伝達', '/æsk/', 'Ask your teacher.', '先生に聞きなさい。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'call', '呼ぶ・電話する', '動詞', '伝達', '/kɔːl/', 'Call me tomorrow.', '明日電話して。')
ON CONFLICT (level, word) DO NOTHING;

-- 4級頻出：不規則動詞（cut, break, fly）
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'cut', '切る', '動詞', '動作', '/kʌt/', 'I cut my finger.', '指を切りました。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'break', '壊す・壊れる', '動詞', '動作', '/breɪk/', 'Don''t break the window.', '窓を壊さないで。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'fly', '飛ぶ', '動詞', '動作', '/flaɪ/', 'Birds fly in the sky.', '鳥が空を飛んでいます。')
ON CONFLICT (level, word) DO NOTHING;

-- 4級頻出：学校関連（5級と重複可）
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'math', '数学', '名詞', '学校', '/mæθ/', 'I like math.', '私は数学が好きです。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'Japanese', '日本語・日本の', '名詞・形容詞', '学校', '/ˌdʒæpəˈniːz/', 'I study Japanese.', '私は日本語を勉強しています。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'test', 'テスト・試験', '名詞', '学校', '/test/', 'We have a math test tomorrow.', '明日数学のテストがあります。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'uniform', '制服', '名詞', '学校', '/ˈjuːnɪfɔːrm/', 'We wear a uniform at school.', '私たちは学校で制服を着ます。')
ON CONFLICT (level, word) DO NOTHING;

-- 4級頻出：場所・建物
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'bank', '銀行', '名詞', '場所', '/bæŋk/', 'There is a bank near the station.', '駅の近くに銀行があります。')
ON CONFLICT (level, word) DO NOTHING;

-- 4級頻出：職業
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'doctor', '医者', '名詞', '人', '/ˈdɑːktər/', 'My father is a doctor.', '父は医者です。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'farmer', '農家・農民', '名詞', '人', '/ˈfɑːrmər/', 'He wants to be a farmer.', '彼は農家になりたいと思っています。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'pilot', 'パイロット', '名詞', '人', '/ˈpaɪlət/', 'My dream is to become a pilot.', '私の夢はパイロットになることです。')
ON CONFLICT (level, word) DO NOTHING;

-- 4級頻出：形容詞・副詞
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'fast', '速い・速く', '形容詞・副詞', '様子', '/fæst/', 'He runs very fast.', '彼はとても速く走ります。')
ON CONFLICT (level, word) DO NOTHING;

-- 例題で使用される語（member, story, contest）
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'member', '会員・メンバー', '名詞', '生活', '/ˈmembər/', 'My father is a member of a sports club.', '父はスポーツクラブの会員です。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'story', '物語・話', '名詞', '伝達', '/ˈstɔːri/', 'He told us many interesting stories.', '彼は私たちに面白い話をたくさんしてくれました。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'contest', 'コンテスト・大会', '名詞', '行事', '/ˈkɑːntest/', 'Did you win the speech contest?', 'スピーチコンテストで優勝しましたか？')
ON CONFLICT (level, word) DO NOTHING;

-- その他4級でよく出る語（例題の選択肢など）
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'group', 'グループ・群れ', '名詞', '生活', '/ɡruːp/', 'We work in groups.', '私たちはグループで作業します。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'picnic', 'ピクニック', '名詞', '娯楽', '/ˈpɪknɪk/', 'Let''s go on a picnic.', 'ピクニックに行きましょう。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'ride', '乗る', '動詞', '移動', '/raɪd/', 'I can ride a bicycle.', '自転車に乗れます。')
ON CONFLICT (level, word) DO NOTHING;
INSERT INTO public.vocabulary (level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja)
VALUES ('4級', 'fall', '落ちる・転ぶ', '動詞', '動作', '/fɔːl/', 'Don''t fall down.', '転ばないでね。')
ON CONFLICT (level, word) DO NOTHING;
