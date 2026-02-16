/**
 * プレミアム（有料）判定ユーティリティ
 * subscription_status が active / trialing のとき true
 * Stripe 決済・手動付与のどちらも同じロジックで判定
 */
export function isPremium(
  profile:
    | { subscription_status?: string | null }
    | null
    | undefined
): boolean {
  if (!profile?.subscription_status) return false;
  const s = profile.subscription_status;
  return s === "active" || s === "trialing";
}

/** サブスクリプションの表示用ステータス（継続 / 解約） */
export function getSubscriptionDisplayStatus(status: string | null | undefined): string {
  switch (status) {
    case "active":
    case "trialing":
      return "継続";
    case "canceled":
    case "unpaid":
    case "past_due":
      return "解約";
    default:
      return "未契約";
  }
}

/** 課金ソースの表示用ラベル */
export function getSubscriptionSourceLabel(source: string | null | undefined): string {
  switch (source) {
    case "manual":
      return "手動";
    case "stripe":
      return "Stripe";
    default:
      return "-";
  }
}
