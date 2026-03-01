# seed_reading_short_5kyu レビュー（レベルチェック５級との照合）

`docs/レベルチェック５級.md` の「2. 短文の語句空所補充（大問1）」に基づき、`seed_reading_short_5kyu.sql`（20問）および `seed_reading_short_5kyu_extra.sql`（80問）を照合した結果です。

---

## 1. 照合基準（レベルチェック５級 2.4 より）

- 1文〜2文程度の**短い**文または短い会話であるか。
- 空所は**1語または1フレーズ**で、4肢選択か。
- 語彙・文法が**中学1年レベル**（現在形・進行形・can・基本動詞・曜日・天気・教科・家族など）に収まっているか。
- 話題が公式の「主な場面・題材」に沿っているか（家族、学校、趣味、スポーツ、食事、天気、道案内、自己紹介、休日の予定など）。

---

## 2. 照合結果サマリ

- **seed_reading_short_5kyu.sql（20問）**: ほぼすべて5級レベルで問題なし。**(19) album** のみ「写真アルバム」として中1で出るが、語としてはやや難しめ。そのままでも可。
- **seed_reading_short_5kyu_extra.sql（80問）**: 以下の3問が**ややレベル高め**。残り77問は5級として妥当。

---

## 3. レベルが高めの問（修正案）

### 3.1 語彙・語法が中2寄りの問

| ファイル | 問 | 現状の正解・内容 | 修正案 | 理由 |
|----------|-----|------------------|--------|------|
| **extra** | (37) | **musician**（音楽家）. He plays the guitar and the piano. | **music teacher** に変更し、文を「Henry is a music **teacher**. He plays the guitar and the piano.」に | 「音楽家」は中2で習うことが多い。5級では「先生」の方がなじみやすい。 |
| **extra** | (42) | **trumpet**（トランペット）. He plays the trumpet very well. | **piano** に変更し、文を「He plays the **piano** very well.」に | 5級でよく出る楽器は piano, guitar。trumpet はやや専門的。 |
| **extra** | (46) | **I'd like** some water. / What would you like to drink? | **I want** some water. / **What do you want** to drink? に文を変更 | Would you like / I'd like は中2で習うことが多い。5級では Do you want? / I want 〜. が中心。 |

### 3.2 修正しない場合の扱い

- **musician**: そのまま出題しても、「音楽が話題」として5級範囲と解釈することは可能。単語を「teacher」にするとより5級寄りになる。
- **trumpet**: 楽器の語彙として残す場合は解説で「楽器の名前」と補足すれば可。易しくするなら piano に統一。
- **I'd like**: 丁寧な表現として中1後半で触れる教科書もある。厳密に5級に揃えるなら want に変更。

---

## 4. 修正用 SQL（適用する場合）

既存DB用に、上記3問を修正する UPDATE は **body / choices / correct_index / explanation を一括で差し替える**必要があるため、**削除してINSERTで差し替え**するか、または **UPDATE で body, choices, correct_index, explanation を更新**する形にします。  
ここでは「同一内容で body・choices・正解・解説を書き換える」前提で、**修正用の INSERT は行わず、修正案のみ記載**します。実装時は次のいずれかで対応してください。

- **方法A**: 該当3問の body, choices, correct_index, explanation を UPDATE する SQL を別ファイル（例: `fix_reading_short_5kyu_level.sql`）に用意する。
- **方法B**: `seed_reading_short_5kyu_extra.sql` の該当箇所を直接編集し、今後の新規投入時に反映する。

以下、**方法A 用の UPDATE 文**の例です。

```sql
-- (37) musician → music teacher、文を teacher に
UPDATE public.reading_short_questions
SET
  body = 'Henry is a music __BLANK__. He plays the guitar and the piano.',
  choices = '["teacher", "rabbit", "jacket", "team"]',
  correct_index = 0,
  explanation = 'ギターとピアノを弾く人は「音楽の先生」なので "teacher" が正解。music teacher で「音楽の先生」。'
WHERE level = '5級' AND question_type = 'short_fill'
  AND body LIKE '%Henry is a __BLANK__%' AND body LIKE '%guitar and the piano%';

-- (42) trumpet → piano
UPDATE public.reading_short_questions
SET
  body = 'Mr. Brown is a music teacher. He plays the __BLANK__ very well.',
  choices = '["piano", "cup", "clock", "pencil"]',
  correct_index = 0,
  explanation = '音楽の先生が弾く「楽器」は piano（ピアノ）が自然。play the 〜 で楽器を演奏する。'
WHERE level = '5級' AND question_type = 'short_fill'
  AND body LIKE '%Mr. Brown is a music teacher%' AND body LIKE '%plays the __BLANK__%';

-- (46) I'd like → I want、問いも What do you want に
UPDATE public.reading_short_questions
SET
  body = 'A: What do you __BLANK__ to drink? B: I want some water, please.',
  choices = '["want", "like", "have", "need"]',
  correct_index = 0,
  explanation = '「何が飲みたい？」は "What do you want to drink?" です。「水がほしい」は "I want some water." で答えます。'
WHERE level = '5級' AND question_type = 'short_fill'
  AND body LIKE '%What would you like to drink%' AND body LIKE '%I''d __BLANK__ some water%';
```

※ 実際のDBでは `body` が完全一致しない場合があるため、`id` で指定するか、LIKE 条件を環境に合わせて調整してください。

---

## 5. 追加したい問題の提案（レベルチェック５級の話題補強）

公式の「主な場面・題材」のうち、現シードでやや薄いものを補うための**追加問の例**です。必要に応じて `seed_reading_short_5kyu.sql` や新規ファイルに INSERT してください。

### 5.1 道案内（Turn right. / next to）

- 空所に **right** または **left** を入れる（Turn __BLANK__ at the corner.）。
- 空所に **next to** を入れる（The library is __BLANK__ the station.）。

### 5.2 自己紹介・出身（I'm from 〜.）

- 既に extra の (22) で "I'm from America." あり。必要なら「from + 国名」の別パターンを1問追加可能。

### 5.3 教科（science, English）

- 空所に **science** を入れる（I like __BLANK__. It is interesting.）。
- 空所に **English** を入れる（We have __BLANK__ class on Monday.）。

### 5.4 時刻（at seven / o'clock）

- 空所に **at** を入れる（I get up __BLANK__ seven.）。
- 空所に **o'clock** を入れる（It is five __BLANK__ now.）。※ 語としての扱いは要検討。

### 5.5 買い物・値段（How much）

- 空所に **much** を入れる（How __BLANK__ is this pen?）。

### 5.6 映画・音楽

- 空所に **movie** を入れる（Let's see a __BLANK__ tonight.）。
- 空所に **music** を入れる（I like __BLANK__. I listen to it every day.）。

上記のうち、**道案内・教科・時刻・How much・movie/music** あたりを優先して追加すると、レベルチェック５級の話題との整合が取りやすくなります。

---

## 6. 追加問題用 INSERT 例（任意）

以下の例はそのまま SQL として実行できます。既存の short_fill 5級の後に追加する想定です。

```sql
-- 道案内（right）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: Where is the post office? B: Turn __BLANK__ at the corner. You will see it.',
  '["right", "left", "up", "down"]',
  0,
  '「角を右に曲がって」は "Turn right at the corner." です。right は「右」、left は「左」。'
);

-- 教科（science）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: What is your favorite subject? B: I like __BLANK__. It is interesting.',
  '["science", "soccer", "breakfast", "Sunday"]',
  0,
  '「好きな教科」の答えとして「理科」は "science" です。subject は「教科」。'
);

-- 時刻（at）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I get up __BLANK__ seven every morning. Then I eat breakfast.',
  '["at", "on", "in", "for"]',
  0,
  '「7時に起きる」は "get up at seven" です。時刻の前には at を使います。'
);

-- 買い物（How much）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'A: How __BLANK__ is this bag? B: It is 3,000 yen.',
  '["many", "much", "old", "long"]',
  1,
  '「いくらですか」は "How much is 〜?" です。much は値段や量を聞くときに使います。'
);

-- 映画（movie）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'Let''s see a __BLANK__ tonight. There is a good one at the cinema.',
  '["movie", "book", "song", "game"]',
  0,
  '「今夜映画を見よう」は "Let''s see a movie." です。movie は「映画」。cinema は「映画館」。'
);

-- 音楽（music）
INSERT INTO public.reading_short_questions (level, question_type, body, choices, correct_index, explanation)
VALUES (
  '5級', 'short_fill',
  'I like __BLANK__. I listen to it every day.',
  '["music", "homework", "soccer", "window"]',
  0,
  '「音楽が好き」は "I like music." です。music は「音楽」という名詞。'
);
```

---

## 7. チェックリスト（実施後）

- [ ] レベルが高めの3問（musician, trumpet, I'd like）を修正するかどうか決定する。
- [ ] 修正する場合、`fix_reading_short_5kyu_level.sql` に UPDATE を用意するか、extra シードを直接編集する。
- [ ] 追加問題（道案内・教科・時刻・How much・映画・音楽など）を追加するか決定し、必要なら上記 INSERT を実行するかシードにマージする。
- [ ] 短文空所が「1〜2文・1空所・4肢・中1語彙・公式の話題」に収まっているか、再度確認する。
