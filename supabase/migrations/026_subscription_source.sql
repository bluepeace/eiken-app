-- 026_subscription_source.sql
-- 課金ソース（Stripe / 手動）の追跡、手動プレミアム運用に対応

alter table public.user_profiles
  add column if not exists subscription_source text;

comment on column public.user_profiles.subscription_source is 'stripe: Stripe決済 | manual: 管理者による手動付与（ビジネス会員・銀行振込等）';
