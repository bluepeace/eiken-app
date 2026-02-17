# 管理画面 設計書

## 0. アプリコンセプト

本アプリのコンセプト（**AiKen** = AI・愛犬・英検。愛犬のように寄り添う「いつも味方」の英検対策アプリ）は [CONCEPT.md](./CONCEPT.md) に記載しています。バディ・バディコメントの管理は、このコンセプトに沿った体験を支えるための機能です。

---

## 1. 概要

管理者専用の画面を `/admin` 以下に構築する。
一般ユーザーはアクセス不可。管理者ログイン時のみ表示される。

---

## 2. 管理者の識別

### 方式: `user_profiles.role` カラム追加

- `role`: `'user'` | `'admin'`（デフォルト `'user'`）
- 既存ユーザーは `'user'`
- 管理者にするには DB で `role = 'admin'` に更新

```sql
-- 012_admin_role.sql
ALTER TABLE public.user_profiles
  ADD COLUMN IF NOT EXISTS role text NOT NULL DEFAULT 'user';
```

### 運用

- 初回: 特定メール（例: s_moriyama@writeup.co.jp）のユーザーを手動で `role = 'admin'` に更新
- 管理画面から他ユーザーを管理者に昇格することも可能（要実装）

---

## 3. 機能一覧

| 機能 | 説明 | データソース |
|------|------|--------------|
| **ユーザー一覧** | 登録ユーザーの検索・一覧 | `user_profiles` + `auth.users` |
| **ユーザー詳細・編集** | 表示名・目標級・ロールの編集 | `user_profiles` |
| **ユーザー新規登録** | メール・パスワードでアカウント作成 | Supabase Auth Admin API |
| **学習ログ** | 各ユーザーの学習履歴 | `user_activity_log`, `vocabulary_quiz_results`, `writing_submissions` |
| **単語登録** | 単語の追加・編集・削除 | `vocabulary` |
| **ライティング問題登録** | 問題の追加・編集・削除（英作文・Eメール・要約） | `writing_prompts` |
| **リーディング問題登録** | 短文空所・会話文空所の追加・編集・削除 | `reading_short_questions` |
| **バディ管理** | 一緒に学習するバディ（犬・猫など）の登録・削除 | `buddies` |
| **バディコメント** | バディが表示するコメントの登録・編集・削除（レギュラー／連続日数別） | `buddy_comments` |
| **CSVエクスポート** | ユーザー・単語・ライティング・リーディングの一覧を、現在の検索・絞り込み結果でCSVダウンロード | 各テーブル |
| **アバター設定** | ユーザーがプロフィールで選べるアバター画像の登録 | `avatar_presets` |
| **背景設定** | 月別背景画像の設定 | `monthly_backgrounds` |
| **決済管理** | 課金状態の確認・手動付与など | Stripe / `user_profiles` 課金カラム |

---

## 4. データベース・RLS

### 4.1 管理者用 RLS ポリシー

管理者は以下を実行可能にする必要がある:

| テーブル | 管理者に許可する操作 |
|----------|----------------------|
| `user_profiles` | SELECT 全件, UPDATE 全件 |
| `user_activity_log` | SELECT 全件 |
| `daily_streaks` | SELECT 全件 |
| `vocabulary` | SELECT, INSERT, UPDATE, DELETE |
| `writing_prompts` | SELECT, INSERT, UPDATE, DELETE |
| `vocabulary_quiz_results` | SELECT 全件 |
| `writing_submissions` | SELECT 全件 |

`is_admin()` のような関数を作成し、ポリシーで参照する。

```sql
-- 管理者判定関数
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS boolean AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.user_profiles
    WHERE auth_user_id = auth.uid() AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;
```

### 4.2 ユーザー新規作成

Supabase Auth の `admin.createUser()` を使用する。**Service Role Key** が必要。
アプリ側では API Route で Service Role クライアントを使い、呼び出し元が管理者であることを確認してから実行する。

---

## 5. ルーティング構成

```
/admin                    → ダッシュボード（概要）
/admin/settings           → 基本設定
/admin/billing            → 決済管理
/admin/users              → ユーザー一覧
/admin/users/[id]         → ユーザー詳細・編集
/admin/users/new          → ユーザー新規登録
/admin/users/[id]/vocabulary-history  → 単語学習履歴
/admin/users/[id]/writing-history     → ライティング提出履歴
/admin/vocabulary         → 単語一覧・登録
/admin/vocabulary/[id]    → 単語編集
/admin/writing            → ライティング問題一覧・登録
/admin/writing/[id]       → ライティング問題編集
/admin/reading            → リーディング問題一覧・登録
/admin/reading/[id]       → リーディング問題編集
/admin/buddies            → バディ管理
/admin/buddy-comments     → バディコメント管理
/admin/avatars            → アバター設定
/admin/backgrounds        → 背景設定
```

---

## 6. 技術的な実装方針

1. **管理者チェック**: Server Component または API Route で `user_profiles.role = 'admin'` を確認
2. **レイアウト**: `/admin/layout.tsx` で管理者判定、未承認時は `/dashboard` へリダイレクト
3. **ナビ**: 管理者の場合のみ AppShell に「管理画面」リンクを表示
4. **Service Role**: `.env.local` に `SUPABASE_SERVICE_ROLE_KEY` を追加（ユーザー新規作成用 API のみで使用）
5. **既存の anon key**: 管理者ポリシーがあれば、一覧・編集・単語・問題の CRUD は anon クライアントで可能

---

## 7. 実装フェーズ

| フェーズ | 内容 | 工数目安 |
|----------|------|----------|
| **Phase 1** | DB マイグレーション（role, is_admin, RLS ポリシー）、管理画面レイアウト・認可、ユーザー一覧・詳細・編集 | 中 |
| **Phase 2** | 学習ログ閲覧、単語 CRUD、ライティング問題 CRUD | 中 |
| **Phase 3** | ユーザー新規登録（Service Role API）、管理者昇格 UI | 小 |

---

## 8. CSVエクスポート

各一覧画面（ユーザー・単語・ライティング・リーディング）に「CSVダウンロード（絞り込み結果）」ボタンを設置。

- **挙動**: 現在の検索・フィルタ・ソートをかけた結果だけをCSV化してダウンロード
- **実装**: クライアント側で `filteredUsers` / `filteredItems` を `lib/utils/csv-export.ts` の `exportToCsv` に渡し、BOM付きUTF-8でダウンロード
- **ファイル名**: `users_2025-02-13.csv` のように日付付き

---

## 9. バディ・バディコメント

- **バディ**: オンボーディングでユーザーが選択する「一緒に学習するキャラクター」。管理画面で登録（名前・種類・画像）。詳細は [BUDDY_DESIGN.md](./BUDDY_DESIGN.md) を参照。
- **バディコメント**: ダッシュボード右下やヒントで表示する文言を管理画面で登録。レギュラー（通常）と連続学習日数別（0日／3〜5日／6〜10日／11日以上）のカテゴリがあり、ランダムで表示される。

---

## 10. 参考: 既存テーブル構造

- `user_profiles`: id, auth_user_id, display_name, target_level, avatar_url, avatar_style, buddy_id, role, display_id, 課金関連..., created_at
- `buddies`: id, name, kind, image_url, sort_order, created_at
- `buddy_comments`: id, body, category, sort_order, created_at（category: regular / streak_0 / streak_3_5 / streak_5_10 / streak_11）
- `vocabulary`: id, level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja
- `writing_prompts`: id, level, prompt_type, title, prompt, word_count_min, word_count_max, time_limit_min_seconds, time_limit_max_seconds（prompt_type: essay / email / summary）
- `reading_short_questions`: id, level, question_type, body, choices, correct_index, explanation, created_at
- `user_activity_log`: user_id, activity_type, payload, created_at
- `vocabulary_quiz_results`: user_id, vocabulary_id, is_correct, created_at
- `writing_submissions`: user_id, prompt_id, content, scores..., ai_feedback, created_at
