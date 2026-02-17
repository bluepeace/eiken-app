# バディ機能 設計書

## 0. アプリコンセプトとの関係

本機能は、アプリ全体のコンセプト（[CONCEPT.md](./CONCEPT.md)）に基づいています。

- **AiKen** = **AI** ＋ **愛犬** ＋ **英検**。英検対策が必要な生徒に、愛犬のようにいつも側にいて寄り添い、大変な学習も頑張ろうと思える「いつも味方」のアプリを目指す。
- バディはその「寄り添い」を担う存在として、褒め・励まし・ヒントで学習を支える。

---

## 1. 概要

「一緒に学習するバディ」として、犬・猫・羊などのキャラクターをユーザーが選択し、ダッシュボードやヒント表示で寄り添う仕様。

- **コンセプト**: マスコットではなく「バディ」として、褒め・励まし・寄り添いのコメントを表示する
- **性別を感じさせない**表現でコメントを登録する方針

---

## 2. データベース

### 2.1 テーブル

| テーブル | 説明 |
|----------|------|
| `buddies` | バディのマスタ（名前・種類・画像）。管理画面で登録。 |
| `user_profiles.buddy_id` | ユーザーが選択したバディ（FK to buddies.id） |
| `buddy_comments` | バディが表示するコメント本文。カテゴリ別に管理。 |

### 2.2 buddies（マイグレーション 032）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | uuid | PK |
| name | text | 表示名（例: バディ、ポチ） |
| kind | text | 種類: dog / cat / sheep / other |
| image_url | text | 画像URL（ストレージ `avatars/buddies/` など） |
| sort_order | int | 表示順 |
| created_at | timestamptz | 作成日時 |

- RLS: 全員 SELECT、管理者のみ INSERT/UPDATE/DELETE
- 初期データ: 犬バディ 3 件（バディ・ポチ・コロ）をシード

### 2.3 buddy_comments（マイグレーション 033）

| カラム | 型 | 説明 |
|--------|-----|------|
| id | uuid | PK |
| body | text | コメント本文。`streak_11` では `{{days}}` で日数挿入 |
| category | text | regular / streak_0 / streak_3_5 / streak_5_10 / streak_11 |
| sort_order | int | 管理用表示順 |
| created_at | timestamptz | 作成日時 |

**カテゴリの意味**

| category | 表示条件 |
|----------|----------|
| regular | 通常。ランダムで表示。約100パターン登録を想定。 |
| streak_0 | 連続学習 0 日（はじめまして） |
| streak_3_5 | 連続 3〜5 日 |
| streak_5_10 | 連続 6〜10 日（5〜10日の意） |
| streak_11 | 連続 11 日以上。本文の `{{days}}` を実際の日数に置換 |

- RLS: 全員 SELECT、管理者のみ INSERT/UPDATE/DELETE
- シード: レギュラー約40件＋各ストリーク用 2〜3 件

---

## 3. ユーザー向け機能

### 3.1 オンボーディング（初回ログイン）

- ステップ: **1. 名前 → 2. バディ選択 → 3. 目標級 → 4. 完了**
- バディ選択: 一覧から 1 体を選んで「選んで次へ」。スキップ可（未選択のまま進む）
- 選択結果は `user_profiles.buddy_id` に保存
- 吹き出し＋バディ画像は `BuddySpeech` コンポーネントで表示

### 3.2 プロフィール

- 「一緒に学習するバディ」で表示中のバディを変更可能
- バディ一覧（ボタン）で選択して保存

### 3.3 ダッシュボード右下のバディ（BuddyWidget）

- **表示条件**: ログイン中かつバディ選択済み、PC（md以上）、管理画面・ライティング/リーディング練習ページ以外
- **表示内容**: 吹き出しにコメント＋その下にバディ画像（固定 bottom-right）
- **コメント**: DB の `buddy_comments` から取得。連続学習日数に応じてレギュラーとストリーク用を混在（後述）

### 3.4 ヒントをバディが案内（BuddyHintPanel）

- ライティング・リーディングの「わからないときはヒントを確認！」ボタンでヒントパネルを表示
- パネル内で「〇〇（バディ名）からのヒントだよ」＋バディ画像＋ヒント本文を表示
- バディ未選択時はヒント本文のみ表示（従来どおり）

### 3.5 コメント表示ロジック

- **取得**: `getProfileId` → `getStreak(profileId)` で連続日数を取得し、`pickBuddyCommentForUser(streakDays)` で 1 件取得
- **ストリークの扱い**:
  - 0 日 → streak_0 のコメントを候補に
  - 3〜5 日 → streak_3_5
  - 6〜10 日 → streak_5_10
  - 11 日以上 → streak_11（`{{days}}` を日数に置換）
  - 1〜2 日はストリーク用なし（レギュラーのみ）
- **混ぜ方**: ストリーク用が存在するとき、約 **35%** でストリーク用・**65%** でレギュラーをランダムに表示（レギュラーの中にストリークが挟まる形）

---

## 4. 管理画面

### 4.1 バディ管理（/admin/buddies）

- バディの新規登録: 名前・種類（犬/猫/羊/その他）・画像アップロード
- 一覧表示・削除
- ストレージ: `avatars` バケットの `buddies/` に保存

### 4.2 バディコメント（/admin/buddy-comments）

- コメントの追加: カテゴリ選択＋本文入力
- 一覧: カテゴリでフィルタ、編集・削除
- 11日以上用は本文に `{{days}}` を入れると表示時に日数に置換される旨を説明表示

---

## 5. ファイル構成

| パス | 役割 |
|------|------|
| `lib/data/buddies.ts` | getBuddies, getCurrentUserBuddy |
| `lib/data/buddy-comments.ts` | getBuddyCommentBodies, getStreakCategory, pickBuddyCommentForUser |
| `lib/data/admin-db.ts` | バディ・バディコメントの CRUD |
| `components/features/buddy/BuddyWidget.tsx` | 右下固定のバディ＋コメント |
| `components/features/buddy/BuddyHintPanel.tsx` | ヒントパネル（バディ＋吹き出し） |
| `app/onboarding/page.tsx` | オンボーディングのバディ選択 |
| `app/(dashboard)/profile/page.tsx` | プロフィールのバディ変更 |
| `app/(dashboard)/admin/buddies/page.tsx` | バディ管理 |
| `app/(dashboard)/admin/buddy-comments/page.tsx` | バディコメント管理 |
| `supabase/migrations/032_buddies.sql` | buddies テーブル・user_profiles.buddy_id |
| `supabase/migrations/033_buddy_comments.sql` | buddy_comments テーブル・シード |

---

## 6. 運用メモ

- レギュラーコメントは約100パターン程度を目安に管理画面で追加すると、ランダム表示のバリエーションが増える
- コメントは性別を感じさせない・褒め・励まし・寄り添いの表現を推奨
- スマホでは右下バディは非表示（`hidden md:flex`）。今後の方針で表示方法を変更可能
