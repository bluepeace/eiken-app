# 問題数集計の cron 設定（Vercel + Supabase）

毎日 0:00（日本時間）に問題数ダッシュボード用の集計を回す方法です。**どちらか一方**を選んで設定してください。

---

## 方法A: Supabase pg_cron（おすすめ）

API を叩かず、Supabase 内だけで実行します。

### 1. pg_cron を有効にする

1. [Supabase Dashboard](https://supabase.com/dashboard) → プロジェクトを選択
2. **Database** → **Extensions**
3. 「pg_cron」を検索して **Enable** にする

### 2. スケジュールを登録する

**SQL Editor** で次を実行します。

```sql
-- 毎日 日本時間 0:00 = UTC 15:00 に実行
select cron.schedule(
  'refresh-question-counts',
  '0 15 * * *',
  $$select public.refresh_question_counts()$$
);
```

- ジョブ名: `refresh-question-counts`
- スケジュール: `0 15 * * *` = 毎日 UTC 15:00 = 日本時間 0:00
- 実行内容: `refresh_question_counts()` を呼ぶ

### 確認・削除

```sql
-- 登録済みジョブ一覧
select * from cron.job;

-- 削除する場合
select cron.unschedule('refresh-question-counts');
```

---

## 方法B: Vercel Cron

Vercel の Cron で API を叩いて集計を実行します。

### 1. 環境変数を設定する

1. [Vercel Dashboard](https://vercel.com) → プロジェクト → **Settings** → **Environment Variables**
2. 次の変数を追加:
   - **Name**: `CRON_SECRET`
   - **Value**: ランダムな長い文字列（例: `openssl rand -hex 32` で生成）
   - **Environment**: Production（必要なら Preview も）

### 2. Vercel Cron について

Vercel の `vercel.json` の Cron は **path だけ**指定するため、**CRON_SECRET を渡せません**。そのため次のどちらかにしてください。

- **方法A（Supabase pg_cron）を使う** … こちらを推奨します。
- **外部の cron サービスを使う** … 下記「方法C」を参照。

`vercel.json` に cron を書いたままにすると、0:00 に API が呼ばれますが 401 になります。Vercel だけで完結させたい場合は **方法A（pg_cron）** にし、`vercel.json` の `crons` は削除してかまいません。

---

## 方法C: 外部の cron サービス（Vercel の API を叩く場合）

[cron-job.org](https://cron-job.org) や [EasyCron](https://www.easycron.com/) などで、毎日 0:00（日本時間）に次の URL を **GET** で呼びます。

```
https://あなたのドメイン.vercel.app/api/admin/refresh-question-counts?secret=CRON_SECRETの値
```

- 環境変数 `CRON_SECRET` に設定した値を `secret=` の後にそのまま付けてください。
- サーバーのログに URL が残る可能性があるため、**方法A（pg_cron）** の方が安全です。

---

## 手動で試す

- **管理画面**: 問題数ダッシュボードの「今すぐ集計」ボタン
- **API**:  
  `GET https://あなたのドメイン/api/admin/refresh-question-counts?secret=CRON_SECRET`  
  または  
  `POST` で `Authorization: Bearer CRON_SECRET`
