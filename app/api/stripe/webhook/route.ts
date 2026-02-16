import { NextRequest, NextResponse } from "next/server";
import { getStripe } from "@/lib/stripe";
import { createClient } from "@supabase/supabase-js";
import Stripe from "stripe";

const webhookSecret = process.env.STRIPE_WEBHOOK_SECRET;

/** Get period end from subscription (Stripe API 2024+ moved current_period_end to SubscriptionItem) */
function getSubscriptionPeriodEnd(sub: Stripe.Subscription): number | null {
  const firstItem = sub.items?.data?.[0];
  return firstItem?.current_period_end ?? null;
}

export async function POST(request: NextRequest) {
  if (!webhookSecret) {
    console.error("[stripe/webhook] STRIPE_WEBHOOK_SECRET is not set");
    return NextResponse.json(
      { error: "Webhook が設定されていません" },
      { status: 500 }
    );
  }

  const body = await request.text();
  const signature = request.headers.get("stripe-signature");
  if (!signature) {
    return NextResponse.json({ error: "Missing signature" }, { status: 400 });
  }

  const stripe = getStripe();
  let event: Stripe.Event;
  try {
    event = stripe.webhooks.constructEvent(body, signature, webhookSecret);
  } catch (err) {
    const msg = err instanceof Error ? err.message : "Invalid signature";
    console.error("[stripe/webhook]", msg);
    return NextResponse.json({ error: msg }, { status: 400 });
  }

  const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY ?? process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );

  try {
    switch (event.type) {
      case "checkout.session.completed": {
        const session = event.data.object as Stripe.Checkout.Session;
        const authUserId = session.metadata?.auth_user_id;
        const customerId = session.customer as string | null;
        const subscriptionId = session.subscription as string | null;

        if (authUserId && typeof authUserId === "string") {
          let status = "active";
          let periodEnd: string | null = null;
          if (subscriptionId) {
            const sub = await stripe.subscriptions.retrieve(subscriptionId);
            status = sub.status === "active" ? "active" : sub.status;
            const periodEndTs = getSubscriptionPeriodEnd(sub);
            periodEnd = periodEndTs != null ? new Date(periodEndTs * 1000).toISOString() : null;
          }
          await supabase
            .from("user_profiles")
            .update({
              stripe_customer_id: customerId ?? undefined,
              subscription_status: status,
              subscription_current_period_end: periodEnd ?? undefined
            })
            .eq("auth_user_id", authUserId);
        }
        break;
      }

      case "customer.subscription.updated":
      case "customer.subscription.deleted": {
        const sub = event.data.object as Stripe.Subscription;
        const authUserId = sub.metadata?.auth_user_id;
        if (authUserId) {
          const status =
            sub.status === "active"
              ? "active"
              : sub.status === "canceled" || sub.status === "unpaid"
                ? "canceled"
                : sub.status;
          const periodEndTs = getSubscriptionPeriodEnd(sub);
          await supabase
            .from("user_profiles")
            .update({
              subscription_status: status,
              subscription_current_period_end:
                periodEndTs != null
                  ? new Date(periodEndTs * 1000).toISOString()
                  : null
            })
            .eq("auth_user_id", authUserId);
        }
        break;
      }

      case "invoice.payment_succeeded": {
        const invoice = event.data.object as Stripe.Invoice;
        const subRef = invoice.parent?.subscription_details?.subscription;
        const subscriptionId =
          typeof subRef === "string" ? subRef : subRef?.id ?? null;
        if (subscriptionId) {
          const sub = await stripe.subscriptions.retrieve(subscriptionId);
          const authUserId = sub.metadata?.auth_user_id;
          if (authUserId) {
            const periodEndTs = getSubscriptionPeriodEnd(sub);
            await supabase
              .from("user_profiles")
              .update({
                subscription_status: "active",
                subscription_current_period_end:
                  periodEndTs != null
                    ? new Date(periodEndTs * 1000).toISOString()
                    : undefined
              })
              .eq("auth_user_id", authUserId);
          }
        }
        break;
      }

      case "invoice.payment_failed": {
        const invoice = event.data.object as Stripe.Invoice;
        const subRef = invoice.parent?.subscription_details?.subscription;
        const subscriptionId =
          typeof subRef === "string" ? subRef : subRef?.id ?? null;
        if (subscriptionId) {
          const sub = await stripe.subscriptions.retrieve(subscriptionId);
          const authUserId = sub.metadata?.auth_user_id;
          if (authUserId) {
            await supabase
              .from("user_profiles")
              .update({ subscription_status: "past_due" })
              .eq("auth_user_id", authUserId);
          }
        }
        break;
      }

      default:
        break;
    }
  } catch (err) {
    console.error("[stripe/webhook] handler error", err);
    return NextResponse.json(
      { error: "Webhook 処理でエラーが発生しました" },
      { status: 500 }
    );
  }

  return NextResponse.json({ received: true });
}
