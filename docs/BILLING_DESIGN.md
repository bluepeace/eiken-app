# 課金設計（Stripe + 手動運用）

## 概要

- **決済**: Stripe Checkout（ホスト型決済ページ）
- **課金形態**: サブスクリプション（月額）
- **有料プラン**: プレミアム（月額 3,980円）
- **運用**: Stripe 決済に加え、手動プレミアム付与に対応（ビジネス会員・銀行振込等）

## ステータス

| 表示 | 内部値 | 説明 |
|------|--------|------|
| 継続 | active / trialing | 有料プラン利用中 |
| 解約 | canceled / unpaid / past_due | 解約済み・支払い遅延 |
| 未契約 | free | 無料ユーザー |

## 課金ソース

| 値 | 説明 |
|----|------|
| stripe | Stripe カード決済 |
| manual | 管理者による手動付与（ビジネス会員・銀行振込等） |

## 必要な設定

### 1. Stripe ダッシュボード

1. [Stripe Dashboard](https://dashboard.stripe.com/) でアカウント作成
2. **Products** で商品作成（例: AiKen プレミアム）
3. **Prices** で月額 3,980円 の価格を作成し、Price ID（`price_xxxxx`）を取得
4. **Developers > Webhooks** でエンドポイント登録
   - URL: `https://your-domain.com/api/stripe/webhook`
   - イベント: `checkout.session.completed`, `customer.subscription.updated`, `customer.subscription.deleted`, `invoice.payment_succeeded`, `invoice.payment_failed`
5. Webhook の署名シークレット（`whsec_xxxxx`）を取得

### 2. 環境変数（.env.local）

```
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_xxxxx
STRIPE_SECRET_KEY=sk_test_xxxxx
STRIPE_WEBHOOK_SECRET=whsec_xxxxx
STRIPE_PRICE_ID=price_xxxxx
NEXT_PUBLIC_APP_URL=http://localhost:3000
SUPABASE_SERVICE_ROLE_KEY=eyJ...  # Webhook で user_profiles を更新するために必要
```

## DB スキーマ

**user_profiles** に追加:

| カラム | 型 | 説明 |
|--------|-----|------|
| stripe_customer_id | text | Stripe Customer ID |
| subscription_status | text | free / active / canceled / past_due / trialing |
| subscription_current_period_end | timestamptz | 課金期間終了日時 |
| subscription_source | text | stripe / manual（手動付与時） |

## 管理画面

### 決済管理（/admin/billing）

- 継続・解約・未契約の人数、MRR（月額換算売上）
- ユーザー一覧（フィルタ・検索）
- ユーザー編集へのリンク

### ユーザー編集（/admin/users/[id]）

- **プレミアム（課金）** セクション
  - ステータス: 未契約 / 継続 / 解約 / 支払い遅延
  - 課金ソース: Stripe / 手動
- 手動でプレミアム付与: ステータスを「継続」、課金ソースを「手動」に設定

## プレミアム判定

`lib/subscription.ts` の `isPremium(profile)` を使用:

```ts
import { isPremium } from "@/lib/subscription";

// subscription_status が active または trialing のとき true
const canAccess = isPremium(profile);
```

コンテンツの範囲制限は、各ページ・API で `isPremium` を参照して実装する。

## API ルート

| パス | メソッド | 説明 |
|------|----------|------|
| /api/stripe/checkout | POST | Checkout Session 作成 → Stripe へリダイレクト |
| /api/stripe/portal | POST | 顧客ポータル URL 取得（解約・支払い方法変更） |
| /api/stripe/webhook | POST | Stripe イベント受信 |

## フロー

1. ユーザーが「プレミアムに登録」をクリック
2. /api/stripe/checkout が Checkout Session を作成
3. Stripe の決済ページへリダイレクト
4. 決済完了 → success_url（/subscribe/success）へ遷移
5. Webhook で checkout.session.completed を受信 → DB を更新（subscription_source: stripe）

**手動付与時**: 管理者がユーザー編集画面でステータスを「継続」、課金ソースを「手動」に設定。
