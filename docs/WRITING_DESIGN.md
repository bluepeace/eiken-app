# ライティング添削機能 設計書

## 1. 概要

英検3級〜1級のライティング問題を出題し、AIが級に応じた添削・フィードバックを行う。
時間計測、複数軸での採点、履歴・スコア推移を実装する。

---

## 2. 問題形式一覧

### 2.1 形式と対応級

| 形式 | 対応級 | 語数目安 | 説明 |
|------|--------|----------|------|
| **英作文** | 3級〜1級 | 25〜240語（級による） | Yes/No または TOPIC について意見と理由を述べる |
| **Eメール** | 3級・準2級 | 15〜50語 | 友達からのメールへの返信、質問への回答 |
| **要約** | 2級・準1級・1級 | 45〜110語（級による） | 英文を読んで要約する（2024年度から新設） |

### 2.2 3級の仕様（第一弾）

| 形式 | 語数目安 | 説明 |
|------|----------|------|
| **英作文** | 25〜35語 | Yes/Noで答え、理由を2つ述べる |
| **Eメール** | 15〜25語 | 外国人の友達からのメールへの返信 |

### 2.3 要約問題の仕様（2024年度追加）

| 級 | 語数 | 英文の長さ | 構成 |
|----|------|------------|------|
| **2級** | 45〜55語 | 約150語 | 3段落（導入・メリット・デメリット） |
| **準1級** | 60〜70語 | 約200語 | 3段落（導入・賛成派・反対派） |
| **1級** | 90〜110語 | 約300語 | 背景→問題→対策→課題 |

### 2.4 ページ構成

```
/writing                    ← ライティングTOP
  ├── 形式選択
  │   ├── [英作文] → /writing/essay?level={級}
  │   ├── [Eメール] → /writing/email（3級・準2級のとき表示）
  │   ├── [要約] → /writing/summary?level={級}（2級・準1級・1級のとき表示）
  │   └── [履歴] → /writing/history
  │
  /writing/essay            ← 英作文（3級〜1級）
  /writing/email            ← Eメール（3級・準2級）
  /writing/summary          ← 要約（2級・準1級・1級）
  /writing/history          ← 履歴一覧
```

### 2.3 フロー

1. `/writing` で「英作文」か「Eメール」を選択
2. 選択した形式のページへ遷移
3. ランダムで1問表示（問題文・指示）
4. ユーザーが回答を入力（開始時点でタイマー開始）
5. 送信ボタンでタイマー停止
6. AI添削API呼び出し
7. 採点結果・フィードバック表示
8. 結果をDBに保存、学習時間を記録

---

## 3. 採点軸

| 軸 | 説明 | 満点 |
|----|------|------|
| **時間** | 適切なスピードで書けたか（級別の目安時間内か） | 4 |
| **文法** | 文法ミスがないか | 4 |
| **語彙** | 適切な単語を使えているか | 4 |
| **構成** | 論理的な構成になっているか | 4 |
| **内容** | 問題に正しく答えているか | 4 |

**合計**: 20点満点（各4点×5軸）

### 3.1 時間の評価基準（3級）

- 英作文: 目安 8〜12分 → 5分未満は速すぎ、15分超は遅い
- Eメール: 目安 5〜8分 → 3分未満は速すぎ、10分超は遅い

※級・形式ごとに閾値を定義する。

---

## 4. データベース

### 4.1 既存テーブルの拡張

**writing_prompts** にカラム追加:

```sql
ALTER TABLE public.writing_prompts
  ADD COLUMN IF NOT EXISTS prompt_type text NOT NULL DEFAULT 'essay';
  -- 'essay' | 'email' | 'summary'

ALTER TABLE public.writing_prompts
  ADD COLUMN IF NOT EXISTS word_count_min integer,
  ADD COLUMN IF NOT EXISTS word_count_max integer,
  ADD COLUMN IF NOT EXISTS time_limit_min_seconds integer,
  ADD COLUMN IF NOT EXISTS time_limit_max_seconds integer;
```

**writing_submissions** にカラム追加:

```sql
ALTER TABLE public.writing_submissions
  ADD COLUMN IF NOT EXISTS time_seconds integer,
  ADD COLUMN IF NOT EXISTS time_score integer;
```

### 4.2 テーブル構造（最終形）

**writing_prompts**

| カラム | 型 | 説明 |
|--------|-----|------|
| id | bigserial | PK |
| level | text | 3級, 準2級, 2級, 準1級, 1級 |
| prompt_type | text | essay / email / summary |
| title | text | 問題タイトル |
| prompt | text | 問題文・指示 |
| word_count_min | int | 最低語数 |
| word_count_max | int | 最高語数 |
| time_limit_min_seconds | int | 最短推奨時間（秒） |
| time_limit_max_seconds | int | 最長推奨時間（秒） |

**writing_submissions**

| カラム | 型 | 説明 |
|--------|-----|------|
| id | bigserial | PK |
| user_id | uuid | user_profiles.id |
| prompt_id | bigint | writing_prompts.id |
| content | text | 提出文 |
| time_seconds | int | かかった時間（秒） |
| overall_score | int | 総合点（0-20） |
| time_score | int | 時間の採点（0-4） |
| grammar_score | int | 文法（0-4） |
| vocabulary_score | int | 語彙（0-4） |
| organization_score | int | 構成（0-4） |
| content_score | int | 内容（0-4） |
| ai_feedback | jsonb | 詳細フィードバック |
| created_at | timestamptz | 提出日時 |

---

## 5. 学習時間への連携

提出完了時に `logStudyActivity` を呼び出す:

```ts
await logStudyActivity(profileId, "writing", {
  seconds: timeSeconds,
  submission_id: submissionId,
  prompt_id: promptId,
  level,
  prompt_type,
  overall_score
});
```

`user_activity_log` の payload.seconds が「今日の学習時間」に加算される（既存ロジック）。

---

## 6. 履歴・スコア推移

### 6.1 履歴一覧

- `/writing/history` で提出履歴を表示
- 日付・形式・問題・スコア・時間 を一覧

### 6.2 スコア推移

- グラフ表示（折れ線 or 棒）
- 軸: 日付（x） vs 総合点（y）
- 級・形式でフィルタ可能

---

## 7. ファイル構成

```
app/(dashboard)/writing/
  page.tsx              # TOP: 形式選択（英作文 / Eメール / 要約）
  essay/page.tsx        # 英作文: 問題表示・入力・結果
  email/page.tsx        # Eメール: 問題表示・入力・結果
  summary/page.tsx      # 要約: 問題表示・入力・結果（2級・準1級・1級）
  history/page.tsx      # 履歴一覧

lib/
  data/
    writing-db.ts       # fetchRandomEssayPrompt, fetchRandomEmailPrompt, fetchRandomSummaryPrompt
  ai/
    writing-feedback.ts # OpenAI 添削API（essay / email / summary 対応）
  writing-hints.ts      # 級別・形式別ヒント（ESSAY_HINTS, EMAIL_HINTS, SUMMARY_HINTS）

components/features/writing/
  WritingResult.tsx     # 採点結果表示
  WritingHintPanel.tsx  # ヒントパネル
  CorrectedTextWithHighlights.tsx
  ReadAloudButton.tsx
```

### 7.1 シードファイル一覧

| ファイル | 内容 |
|----------|------|
| seed_writing_prompts_3kyu_essay.sql | 3級英作文 |
| seed_writing_prompts_3kyu_email.sql | 3級Eメール |
| seed_writing_prompts_jun2kyu_essay.sql | 準2級英作文 |
| seed_writing_prompts_jun2kyu_email.sql | 準2級Eメール |
| seed_writing_prompts_2kyu_essay.sql | 2級英作文 |
| seed_writing_prompts_2kyu_summary.sql | 2級要約（8問） |
| seed_writing_prompts_jun1kyu_essay.sql | 準1級英作文 |
| seed_writing_prompts_jun1kyu_summary.sql | 準1級要約（3問） |
| seed_writing_prompts_1kyu_essay.sql | 1級英作文 |
| seed_writing_prompts_1kyu_summary.sql | 1級要約（3問） |

---

## 8. AI添削プロンプト（概要）

- 級（3級など）を指定
- 問題文・ユーザー回答を渡す
- 各軸のスコア（0-4）と理由をJSON形式で返すよう指示
- 語数カウント、構成チェック、文法・語彙の指摘を含める

---

## 9. 実装フェーズ

### Phase 1: 3級 英作文 ✅
- [x] DBマイグレーション（prompt_type等追加）
- [x] 英作文問題シード
- [x] `/writing` TOP（形式選択）
- [x] `/writing/essay` 問題表示・入力・タイマー
- [x] AI添削API
- [x] 結果表示・保存
- [x] 学習時間記録

### Phase 2: 3級 Eメール ✅
- [x] Eメール問題シード
- [x] `/writing/email` ページ

### Phase 3: 履歴 ✅
- [x] `/writing/history` 履歴一覧
- [ ] スコア推移グラフ（未実装）

### Phase 4: 準2級・2級・準1級・1級 英作文 ✅
- [x] 各級の問題シード
- [x] 級選択UI
- [x] 級別の語数・時間基準

### Phase 5: 要約問題（2級・準1級・1級）✅
- [x] prompt_type に 'summary' 追加
- [x] 2級要約（45〜55語）シード・UI・ヒント
- [x] 準1級要約（60〜70語）シード・UI・ヒント
- [x] 1級要約（90〜110語）シード・UI・ヒント
- [x] `/writing/summary` ページ
- [x] AI添削での要約採点基準（パラフレーズ、指示遵守等）
