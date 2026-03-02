# seed_reading_short_4kyu レビュー（レベルチェック４級との照合）

`docs/レベルチェック４級.md` の「2. 短文の語句空所補充」「3. 会話文の文空所補充」に基づき、4級の短文空所・会話文空所を照合した結果です。

---

## 1. 照合基準（レベルチェック４級より）

### 短文語句空所
- 1文〜2文程度の**短い**文または短い会話であるか。
- 空所は**1語または1フレーズ**で、4肢選択か。
- 語彙・文法が**中学2年レベル**（現在形・過去形・進行形・助動詞・基本語彙・熟語）に収まっているか。
- 話題が公式の「主な場面・題材」に沿っているか。

### 会話文
- 会話文（2人以上のやりとり）になっているか。
- 空所に当てはまる文・語句が会話の流れに合っているか。
- 2〜3往復の短い会話か。
- 4級頻出の会話表現（挨拶・感謝・ねぎらい・依頼・承諾・時刻・提案など）か。

---

## 2. 照合結果サマリ

### 短文空所（short_fill）
- **seed_reading_short_4kyu.sql（20問）**: (15) college が4級範囲外（大学は中3程度）。修正対象。
- **seed_reading_short_4kyu_extra.sql（80問）**: 以下が**3級寄り**。修正対象。
  - (38) professional: 4級頻出語に含まれない
  - (42) castle: 4級頻出語に含まれない（museum に変更可）
  - (53)(54) since/for: 現在完了は中3で習うことが多い
  - (79)(80) have + 過去分詞: 現在完了は中3で習うことが多い
  - (94) although: 逆接の接続詞は中3で習うことが多い
  - (95) whether: 「〜かどうか」の whether は中3で習うことが多い

### 会話文（conversation_fill）
- **seed_reading_short_4kyu_conversation_50.sql（50問）**: ほぼすべて4級レベルで問題なし。挨拶・感謝・ねぎらい・依頼・承諾・時刻・提案など適切にカバー。

---

## 3. 修正内容

| ファイル | 問 | 現状 | 修正後 | 理由 |
|----------|-----|------|--------|------|
| 4kyu | (15) | college（大学生） | scientist（科学者） | college は4級範囲外。scientist は4級vocabularyにあり、職業として適切。 |
| extra | (38) | professional（プロの） | famous（有名な） | professional は4級範囲外。famous は4級頻出。 |
| extra | (42) | castle（城） | museum（博物館） | castle は4級範囲外。museum は4級vocabularyにあり、歴史学習の場として適切。 |
| extra | (53) | since（現在完了） | when（接続詞） | 現在完了は中3範囲。過去形・接続詞 when に差し替え。 |
| extra | (54) | for（期間） | before（前に） | 現在完了の for は中3範囲。before/after など中2範囲に差し替え。 |
| extra | (79) | taken（have taken） | went（過去形） | 現在完了は中3範囲。過去形に差し替え。 |
| extra | (80) | been（have been to） | went（過去形） | 現在完了は中3範囲。過去形に差し替え。 |
| extra | (94) | although | so | 逆接の although は中3範囲。理由・結果の so に差し替え。 |
| extra | (95) | whether | when | whether は中3範囲。疑問詞 when に差し替え。 |

---

## 4. 追加問題（レベルチェック例題より）

`seed_reading_short_4kyu_additions.sql` に以下を追加済み:

- **member**: My father is a ( ) of a sports club. → member
- **story/stories**: Mr. Clark told us many interesting ( ) about his trip. → stories
- **win**: Did you ( ) in the speech contest? → win
- **Good job**: 会話文のねぎらい表現（お風呂掃除終了→ねぎらい→ゲーム許可の流れ）
