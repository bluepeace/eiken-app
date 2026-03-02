# 3級単語 レベルチェックレビュー

レベルチェック３級.md に基づき、3級英単語の妥当性を確認した結果です。

## 実施日
2025年3月

## チェック観点（レベルチェック３級より）
- 語が中学卒業レベル（約2,100語の範囲）か
- 品詞・カテゴリが適切か
- 3級頻出テーマ（人物紹介・歴史を含む場面・題材）をカバーしているか
- 準2級以上の語が混在していないか

## 1. 追加した単語（レベルチェック例題・頻出語）

| 単語 | 品詞 | 意味 | 根拠 |
|------|------|------|------|
| knock | 動詞 | ノックする・たたく | 過去問例題「Did someone just ( ) on the door?」 |
| stamp | 名詞 | 切手・スタンプ | 頻出例「invite, stamp, delicious...」 |
| delicious | 形容詞 | おいしい | 頻出例 |
| question | 名詞 | 質問・問題 | 頻出例「question, subject, trip...」 |
| subject | 名詞 | 教科・題材・主語 | 頻出例 |
| ride | 動詞 | 乗る | 頻出例「invite, ride, perform...」 |
| heavy | 形容詞 | 重い | 頻出例「delicious, heavy, hungry, bright」 |
| hungry | 形容詞 | お腹が空いた | 頻出例 |
| fact | 名詞 | 事実 | 頻出例「experience, stamp, sound, fact」 |
| interesting | 形容詞 | 興味深い・面白い | 頻出例・過去問例題選択肢 |

## 2. 修正した例文（カンマ分割の誤り）

以下の語で、example_en と example_ja がカンマで誤って分割されていた問題を修正。

| 単語 | 修正前（例） | 修正後 |
|------|-------------|--------|
| past | 'In the past' / 'things were different.' | 'In the past, things were different.' |
| actually | 'Actually' / 'I've never been there.' | 'Actually, I've never been there.' |
| certainly | 'Certainly' / 'I will help you.' | 'Certainly, I will help you.' |
| especially | 'I like fruit' / 'especially apples.' | 'I like fruit, especially apples.' |
| finally | 'Finally' / 'the bus arrived.' | 'Finally, the bus arrived.' |
| instead | 'If you can't go' / 'I'll go instead.' | 'If you can't go, I'll go instead.' |
| channel | 'Change the channel' / 'please.' | 'Change the channel, please.' |
| although | 'Although it was raining' / 'we went out.' | 'Although it was raining, we went out.' |
| though | 'Though he is young' / 'he is very wise.' | 'Though he is young, he is very wise.' |
| for example | 例文が不完全 | 'I like fruit, for example, apples.' |
| at first | 'At first' / 'I didn't like the food.' | 'At first, I didn't like the food.' |
| of course | 'Of course' / 'you can use my pen.' | 'Of course, you can use my pen.' |
| by the way | 'By the way' / 'do you have the time?' | 'By the way, do you have the time?' |

## 3. レベル超過の修正

| 単語 | 修正内容 | 理由 |
|------|----------|------|
| farmer | organic vegetables → vegetables | 「organic」は準2級寄り。3級レベルに修正 |

## 4. 関連ファイル

| ファイル | 用途 |
|----------|------|
| `supabase/seed_vocabulary_3kyu.sql` | 3級単語のメインシード（例文修正済み） |
| `supabase/seed_vocabulary_3kyu_additions.sql` | 追加10語の投入 |
| `supabase/migrations/048_vocabulary_3kyu_fix_examples.sql` | 既存DBの例文修正 |

## 5. 実行順序

1. `046_vocabulary_unique_level_word.sql` が実行済みであること
2. `seed_vocabulary_3kyu.sql` で3級単語を投入済みの場合:
   - `048_vocabulary_3kyu_fix_examples.sql` で例文を修正
   - `seed_vocabulary_3kyu_additions.sql` で追加10語を投入
