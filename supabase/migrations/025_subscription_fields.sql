-- 025_subscription_fields.sql
-- 課金（Stripe サブスクリプション）用カラム追加

alter table public.user_profiles
  add column if not exists stripe_customer_id text,
  add column if not exists subscription_status text default 'free',
  add column if not exists subscription_current_period_end timestamptz;

comment on column public.user_profiles.stripe_customer_id is 'Stripe Customer ID（課金管理用）';
comment on column public.user_profiles.subscription_status is 'free | active | canceled | past_due など';
comment on column public.user_profiles.subscription_current_period_end is '現在の課金期間の終了日時';
