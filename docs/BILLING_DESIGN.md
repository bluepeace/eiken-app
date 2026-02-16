# 課金設計（Stripe）

## 概要

- **決済**: Stripe Checkout（ホスト型決済ページ）
- **課金形態**: サブスクリプション（月額）
- **有料プラン**: プレミアム（例: 月額980円）

## 必要な設定

### 1. Stripe ダッシュボード

1. [Stripe Dashboard](https://dashboard.stripe.com/) でアカウント作成
2. **Products** で商品作成（例: AiKen プレミアム）
3. **Prices** で月額価格を作成し、Price ID（`price_xxxxx`）を取得
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
| subscription_status | text | free / active / canceled / past_due |
| subscription_current_period_end | timestamptz | 課金期間終了日時 |

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
5. Webhook で checkout.session.completed を受信 → DB を更新
