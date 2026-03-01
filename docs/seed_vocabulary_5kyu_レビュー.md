# seed_vocabulary_5kyu レビュー（レベルチェック５級との照合）

`docs/レベルチェック５級.md` に基づき、`supabase/seed_vocabulary_5kyu.sql`（約194語）を照合した結果です。

---

## 1. 照合結果サマリ

- **基準**: 5級＝中学初級（中1程度）、約600〜650語、名詞・動詞中心、曜日・月・数・時刻・家族・学校・身の回り・天気・スポーツ・食事など。
- **総評**: 基本動詞・時間・家族・曜日・月・数字・前置詞・疑問詞・動物・植物などはよくカバーされている。一方で、**短文・会話・語句整序のシードで使われている語の一部が単語シードにない**。また、**公式例題・単語テストで出る語**が数語欠けている。レベルがやや高めと判断できる語はごく少数。

---

## 2. レベルが高めの語（修正案）

以下の語は中2で習うことが多く、5級単語リストでは「入れる場合もある」程度。**4級に移す候補**として検討を推奨。

| 語 | 現状 | 修正案 | 理由 |
|----|------|--------|------|
| **between** | 5級（前置詞） | 4級へ移す候補 | 「〜の間に」は中2で習うことが多い。道案内で出るが、5級では near, next to までにすることが多い。 |
| **musician** | 短文シード(5kyu_extra)で使用 | 問題文はそのまま、単語は4級で登録を検討 | 「音楽家」は中2語のことが多い。5級では music, piano, guitar までで十分な場合あり。 |

**対応方針案**
- **between**: 5級のまま残しても可（多くの5級単語リストには入る）。移す場合は `vocabulary` の level を 4級 に更新する UPDATE を用意する。
- **musician**: 短文問題ではそのまま使用し、単語クイズには出さないなら 4級 で新規登録するか、5級に追加のままでも可。

**その他**: difficult, restaurant, hospital, library, because, before, after は中1で習い、5級に残して問題なし。

---

## 3. 追加したい語（レベルチェック・シード整合・公式例題より）

短文・会話・語句整序のシードおよびレベルチェックの例題で使われているが、現状の単語シードに**ない**語を挙げます。必要に応じて `seed_vocabulary_5kyu.sql` に追加するか、別ファイル `seed_vocabulary_5kyu_additions.sql` で投入してください。

### 3.1 公式例題・単語テストで出ている語

| 語 | 意味 | 品詞 | 備考 |
|----|------|------|------|
| beautiful | 美しい | 形容詞 | レベルチェック例題「It's beautiful.」 |
| cloudy | 曇りの | 形容詞 | 天気。例題選択肢にも。 |
| plate | 皿 | 名詞 | 単語テスト20問のうちの1語。 |
| clock | 時計 | 名詞 | 単語テスト20問。What time / o'clock とセットで重要。 |
| girl | 少女・女の子 | 名詞 | 単語テスト。会話の話者でも多用。 |
| hand | 手 | 名詞 | 単語テスト。Wash your hands. など。 |
| walk | 歩く | 動詞 | 単語テスト。Walk, please. など。 |

### 3.2 短文・会話・語句整序シードで使用されているが未登録の語

| 語 | 意味 | 品詞 | 使用例 |
|----|------|------|--------|
| music | 音楽 | 名詞 | I like music. / She likes music. |
| English | 英語・英語の | 名詞・形容詞 | speak English, English teacher, English class |
| math | 数学 | 名詞 | study math, Do you like math? |
| science | 理科 | 名詞 | What class? Science. |
| apple | りんご | 名詞 | I want an apple. / spell "apple" |
| milk | 牛乳 | 名詞 | I drink milk. |
| movie | 映画 | 名詞 | Let's see a movie. |
| aunt | 叔母・伯母 | 名詞 | My aunt lives in London. |
| uncle | 叔父・伯父 | 名詞 | 家族の話題 |
| boy | 男の子 | 名詞 | 会話の話者・あの男の子はだれですか |
| man | 男性 | 名詞 | Woman / Man の会話 |
| woman | 女性 | 名詞 | Woman / Man の会話 |
| draw | 描く | 動詞 | He draws pictures. |
| open | 開ける | 動詞 | Please open your book / the window. |
| close | 閉める | 動詞 | Please close the windows. |
| run | 走る | 動詞 | Don't run in the hallway. |
| walk | 歩く | 動詞 | Walk, please. |
| swim | 泳ぐ | 動詞 | Can you swim? |
| stand | 立つ | 動詞 | Stand up. |
| sit | 座る | 動詞 | Sit down. |
| sleep | 寝る | 動詞 | I sleep a lot on Sunday. |
| live | 住む | 動詞 | My aunt lives in London. |
| work | 働く | 動詞 | My mother works at the hospital. |
| love | 愛する・大好き | 動詞 | I love spring. |
| cook | 料理する | 動詞 | cook dinner |
| rain | 雨・雨が降る | 名詞・動詞 | It's raining. |
| snow | 雪 | 名詞 | We have snow in winter. |
| sunny | 晴れた | 形容詞 | It is sunny today. |
| nice | すてきな・いい | 形容詞 | Nice to meet you. / Your T-shirt is nice. |
| kind | 親切な | 形容詞 | My mother is kind. |
| clean | きれいな・掃除する | 形容詞・動詞 | My room is clean. |
| young | 若い | 形容詞 | 短文選択肢など |
| fine | 元気な | 形容詞 | I'm fine. How are you? |
| door | ドア | 名詞 | Open the door. |
| window | 窓 | 名詞 | open the window |
| bed | ベッド | 名詞 | On your bed. |
| train | 電車 | 名詞 | the next train |
| bus | バス | 名詞 | by bus |
| car | 車 | 名詞 | by car |
| bicycle | 自転車 | 名詞 | ride a bicycle |
| ticket | 切符・チケット | 名詞 | buy a ticket |
| money | お金 | 名詞 | How much? |
| yen | 円 | 名詞 | 100 yen |
| dollar | ドル | 名詞 | thirty dollars |
| minute | 分 | 名詞 | What time? / For one hour. とセット |
| please | どうぞ・ください | 感動詞・副詞 | Please open your book. |
| sorry | すまない・残念 | 形容詞 | I'm sorry. |
| excuse | 許す・言い訳 | 動詞 | Excuse me. |
| thank | 感謝する | 動詞 | Thank you. |
| thanks | ありがとう | 名詞・感動詞 | Thanks. |
| next | 次の | 形容詞 | next train, next page |
| color | 色 | 名詞 | What color? |
| red | 赤い・赤 | 形容詞・名詞 | pink T-shirt と同系統 |
| blue | 青い・青 | 形容詞・名詞 | 基本色 |
| yellow | 黄色い・黄色 | 形容詞・名詞 | 基本色 |
| green | 緑の・緑 | 形容詞・名詞 | 基本色 |
| black | 黒い・黒 | 形容詞・名詞 | black hair（例題） |
| white | 白い・白 | 形容詞・名詞 | 基本色 |
| pink | ピンクの・ピンク | 形容詞・名詞 | Your pink T-shirt |
| brown | 茶色の・茶色 | 形容詞・名詞 | 基本色 |
| floor | 床 | 名詞 | sit on the floor |
| restroom | トイレ | 名詞 | Where is the restroom? |
| grandfather | 祖父 | 名詞 | 家族 |
| grandmother | 祖母 | 名詞 | 家族 |
| need | 必要とする | 動詞 | What do we need? |
| find | 見つける | 動詞 | find my keys |
| put | 置く | 動詞 | put on |
| wear | 着る | 動詞 | wear a T-shirt |
| weather | 天気 | 名詞 | 話題「天気」 |

---

## 4. 修正・追加の実施方法

### 4.1 レベルが高めの語を4級に移す場合（任意）

```sql
-- 既存DBで between を4級に移す場合（必要なら実行）
UPDATE public.vocabulary SET level = '4級' WHERE level = '5級' AND word = 'between';
```

`musician` は現状 vocabulary にないため、4級用シードに追加するか、5級のまま新規INSERTするかで対応。

### 4.2 追加語の投入

- **方法A**: `seed_vocabulary_5kyu_additions.sql` を新規作成し、上記の追加語を INSERT する。既存の5級シードの後に実行する。
- **方法B**: `seed_vocabulary_5kyu.sql` の末尾に、上記の INSERT を追記する。

追加用の INSERT 文は `supabase/seed_vocabulary_5kyu_additions.sql` に用意する（次の節で作成）。

---

## 5. チェックリスト（実施後）

- [ ] レベルが高めの語（between, musician）の扱いを決定し、必要なら UPDATE または4級登録
- [ ] 追加語を `seed_vocabulary_5kyu_additions.sql` で投入（または seed_vocabulary_5kyu.sql にマージ）
- [ ] 既存DBに追加のみ行う場合は、additions の SQL のみ実行
- [ ] 短文・会話・語句整序で使っている語で、まだ vocabulary にない語が残っていないか再確認
