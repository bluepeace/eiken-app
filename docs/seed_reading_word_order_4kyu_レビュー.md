# seed_reading_word_order_4kyu レビュー（レベルチェック４級との照合）

`docs/レベルチェック４級.md` の「4. 日本文付き短文の語句整序（大問3）」に基づき、4級の語句整序50問を照合した結果です。

---

## 1. 照合基準（レベルチェック４級 4.4 より）

- **日本文**が明示され、その意味に合う**1文**が作れる並びになっているか。
- 語句の数は**4〜5語句**程度が4級らしいか。
- 正解の英文が**文法的に正しく**、かつ日本文の意味と一致しているか（SVO・SVC、時・場所の順序など）。
- 過去形・助動詞・疑問文・熟語など**4級の頻出パターン**をカバーしているか。

---

## 2. 順番（correct_order）検証結果

全50問を `correct_order.map(i => words[i]).join(" ")` で検証した結果、以下の誤りを検出。

| 問 | 日本文 | 問題点 | 修正内容 |
|----|--------|--------|----------|
| 14 | ポールは今日遅く起きたので、朝食を食べる時間がありませんでした。 | 主語 Paul がない。「didn't have time for breakfast」のみ | 主語を追加し、文を完成 |
| 16 | 私たちは明日家の掃除をしなければいけませんか。 | "Do have we to" → 誤り。正しくは "Do we have to" | correct_order を [4,2,1,3,0] に |
| 21 | キャロルは昨日7時に家を出て学校へ向かいました。 | 主語がなく、語順も誤り。「left at 7 school her house for」 | 主語 Carol を追加、語順を修正 |
| 23 | 彼女は先週京都で楽しい週末を過ごしました。 | "in Kyoto" "last week" が欠落 | 語句を追加して文を完成 |
| 26 | 私は先週の日曜日に祖母を訪ねました。 | "I my grandmother last Sunday visited" → 誤り。正しくは "I visited my grandmother last Sunday" | correct_order を [1,2,3,0] に |
| 30 | あの動物園でライオンを見ましたか。 | "at the zoo" が欠落。「Did you see the lions at」で文が完結しない | 語句を追加して文を完成 |
| 33 | 私たちは今週末ハイキングに行くつもりです。 | "we will hiking go" → 誤り。正しくは "We will go hiking" | correct_order を [1,3,0,2,4] に |
| 46 | ビル、君はどんな種類のアイスクリームが好きですか。 | "you" "like" が欠落。「What kind of ice cream do」で文が完結しない | 語句を追加して文を完成 |
| 47 | 彼女はテニスをするのが得意です。 | "she is good at tennis playing" → 誤り。正しくは "She is good at playing tennis" | correct_order を [1,3,2,0] に |
| 48 | 私は本を読むことを楽しんでいます。 | "I enjoy books reading" → 誤り。正しくは "I enjoy reading books" | correct_order を [1,3,2,0] に |
| 49 | 彼はサッカーを見るのが好きです。 | "he likes soccer watching" → 誤り。正しくは "He likes watching soccer" | correct_order を [1,3,2,0] に |
| 50 | 彼女は歌を歌うことが好きです。 | "she likes songs singing" → 誤り。正しくは "She likes singing songs" | correct_order を [1,3,2,0] に |

---

## 3. レベルチェックとの照合

- **語彙**: 4級範囲内（中学2年レベル）。問題なし。
- **文法**: to不定詞、助動詞、受動態、接続詞など4級頻出パターンをカバー。問題なし。
- **語句数**: 一部6語句（Q15, Q21 修正後）があるが、4級の「4〜5語句程度」の目安に概ね沿っている。

---

## 4. 追加問題（レベルチェック例題より）

`seed_reading_word_order_4kyu_additions.sql` に以下を追加済み:

- **レベルチェック４級 4.5 の例題**: 数学のテストの間、教室はとても静かでした。
  - 語句: during the math test, was, quiet, very, The classroom
  - 正解: The classroom was very quiet during the math test.
