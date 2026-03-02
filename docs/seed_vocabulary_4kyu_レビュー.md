# seed_vocabulary_4kyu レビュー（レベルチェック４級との照合）

`docs/レベルチェック４級.md` に基づき、`supabase/seed_vocabulary_4kyu.sql` および `seed_vocabulary_4kyu_additions.sql` を照合した結果です。

---

## 1. 照合結果サマリ

- **基準**: 4級＝中学中級（中2程度）、約800〜1,300語、学校・場所・職業・趣味・旅行・食事・天気・海外の文化など。
- **総評**: 既存の4級単語はおおむね中学2年レベルに収まっている。**例文の typo を修正**し、**レベルチェックで挙げられた頻出語・例題語を追加**した。

---

## 2. 修正した内容（seed_vocabulary_4kyu.sql）

### 2.1 例文の typo 修正

| 語 | 修正前 | 修正後 |
|----|--------|--------|
| especially | example_en/example_ja が分割されていた | 'I like fruit, especially apples.' / '果物が好きです。特にりんごが。' |
| finally | example_en/example_ja が分割されていた | 'Finally, the rain stopped.' / 'ついに雨が止みました。' |
| slowly | example_en/example_ja が分割されていた | 'Speak more slowly, please.' / 'もっとゆっくり話してください。' |
| actually | example_en/example_ja が分割されていた | 'Actually, I don't like natto.' / '実は納豆は好きではありません。' |

---

## 3. 追加した語（seed_vocabulary_4kyu_additions.sql）

### 3.1 4級頻出（ドキュメント 1.2 より）

| カテゴリ | 追加語 |
|----------|--------|
| 規則動詞 | ask, call |
| 不規則動詞 | cut, break, fly |
| 学校関連 | math, Japanese, test, uniform |
| 場所・建物 | bank |
| 職業 | doctor, farmer, pilot |
| 形容詞・副詞 | fast |

### 3.2 例題で使用される語（ドキュメント 1.5 より）

| 語 | 意味 | 例題 |
|----|------|------|
| member | 会員・メンバー | My father is a (member) of a sports club. |
| story | 物語・話 | Mr. Clark told us many interesting (stories). |
| contest | コンテスト・大会 | Did you (win) in the speech contest? |

### 3.3 その他4級でよく出る語

| 語 | 意味 |
|----|------|
| group | グループ・群れ |
| picnic | ピクニック |
| ride | 乗る |
| fall | 落ちる・転ぶ |

---

## 4. レベル確認（3級以上の語の混在）

以下の語は中学2年で習うことが多く、4級に残して問題なしと判断。

- **environment**（環境）: 「Protect the environment」は中学でよく出る表現
- **actually**（実は）: 会話で頻出、4級で出る
- **especially**（特に）: 4級で出る
- **appointment**（予約・約束）: 4級の会話・案内で出る

---

## 5. 実行順序・既存DBの修正方法

### 新規セットアップ時
1. `seed_vocabulary_4kyu.sql` を実行
2. マイグレーション `046_vocabulary_unique_level_word` を実行（ユニーク制約追加）
3. `seed_vocabulary_4kyu_additions.sql` を実行

### 既存DBの修正時（再実行で重複しない）
- **046 マイグレーション**: `(level, word)` にユニーク制約を追加。既存の重複は id が小さい方を残して削除。
- **047 マイグレーション**: 4級の例文 typo（especially, finally, slowly, actually）を UPDATE で修正。
- **additions シード**: `ON CONFLICT (level, word) DO NOTHING` により、再実行しても重複登録されない。

### 今後の修正フロー
- **既存行の修正**: マイグレーション（UPDATE）で対応
- **新規語の追加**: additions シードに `ON CONFLICT DO NOTHING` で追加し、再実行可能

---

*本ドキュメントは「レベルチェック４級」に基づく単語シードの妥当性確認に使用する。*
