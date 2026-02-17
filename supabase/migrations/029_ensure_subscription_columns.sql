-- 029_ensure_subscription_columns.sql
-- user_profiles に課金用カラムが無い場合に追加（025/026 未適用時の補完）
-- "column p.subscription_status does not exist" が出る場合はこのマイグレーションを実行

alter table public.user_profiles
  add column if not exists stripe_customer_id text,
  add column if not exists subscription_status text default 'free',
  add column if not exists subscription_current_period_end timestamptz,
  add column if not exists subscription_source text;

comment on column public.user_profiles.stripe_customer_id is 'Stripe Customer ID（課金管理用）';
comment on column public.user_profiles.subscription_status is 'free | active | canceled | past_due など';
comment on column public.user_profiles.subscription_current_period_end is '現在の課金期間の終了日時';
comment on column public.user_profiles.subscription_source is 'stripe: Stripe決済 | manual: 管理者による手動付与';
