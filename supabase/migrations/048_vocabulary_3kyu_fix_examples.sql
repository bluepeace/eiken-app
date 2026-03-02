-- 048_vocabulary_3kyu_fix_examples.sql
-- 3級単語の例文 typo 修正（カンマ分割誤り・farmer の organic）
-- 046 実行後に実行可能。既存DBの修正用。
-- 参照: docs/レベルチェック３級.md

UPDATE public.vocabulary
SET example_en = 'In the past, things were different.',
    example_ja = '昔は事情が違っていました。'
WHERE level = '3級' AND word = 'past';

UPDATE public.vocabulary
SET example_en = 'Actually, I''ve never been there.',
    example_ja = '実はそこへ行ったことがありません。'
WHERE level = '3級' AND word = 'actually';

UPDATE public.vocabulary
SET example_en = 'Certainly, I will help you.',
    example_ja = 'かしこまりました。お手伝いします。'
WHERE level = '3級' AND word = 'certainly';

UPDATE public.vocabulary
SET example_en = 'I like fruit, especially apples.',
    example_ja = '果物が好きです。特にりんごが。'
WHERE level = '3級' AND word = 'especially';

UPDATE public.vocabulary
SET example_en = 'Finally, the bus arrived.',
    example_ja = 'ついにバスが到着しました。'
WHERE level = '3級' AND word = 'finally';

UPDATE public.vocabulary
SET example_en = 'If you can''t go, I''ll go instead.',
    example_ja = 'あなたが行けないなら、私が代わりに行きます。'
WHERE level = '3級' AND word = 'instead';

UPDATE public.vocabulary
SET example_en = 'Change the channel, please.',
    example_ja = 'チャンネルを変えてください。'
WHERE level = '3級' AND word = 'channel';

UPDATE public.vocabulary
SET example_en = 'Although it was raining, we went out.',
    example_ja = '雨が降っていましたが、私たちは出かけました。'
WHERE level = '3級' AND word = 'although';

UPDATE public.vocabulary
SET example_en = 'Though he is young, he is very wise.',
    example_ja = '彼は若いけれど、とても賢いです。'
WHERE level = '3級' AND word = 'though';

UPDATE public.vocabulary
SET example_en = 'I like fruit, for example, apples.',
    example_ja = '例えばりんごなど、果物が好きです。'
WHERE level = '3級' AND word = 'for example';

UPDATE public.vocabulary
SET example_en = 'At first, I didn''t like the food.',
    example_ja = '最初はその食べ物が好きではありませんでした。'
WHERE level = '3級' AND word = 'at first';

UPDATE public.vocabulary
SET example_en = 'Of course, you can use my pen.',
    example_ja = 'もちろん、私のペンを使っていいですよ。'
WHERE level = '3級' AND word = 'of course';

UPDATE public.vocabulary
SET example_en = 'By the way, do you have the time?',
    example_ja = 'ところで、今何時ですか？'
WHERE level = '3級' AND word = 'by the way';

UPDATE public.vocabulary
SET example_en = 'The farmer grows vegetables.',
    example_ja = 'その農家は野菜を育てています。'
WHERE level = '3級' AND word = 'farmer';
