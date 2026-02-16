import { NextRequest, NextResponse } from "next/server";
import { getStripe } from "@/lib/stripe";

const priceId = process.env.STRIPE_PRICE_ID;

export async function POST(request: NextRequest) {
  try {
    if (!priceId) {
      return NextResponse.json(
        { error: "Stripe の価格が設定されていません（STRIPE_PRICE_ID）" },
        { status: 500 }
      );
    }

    const body = await request.json();
    const { auth_user_id, email } = body as {
      auth_user_id?: string;
      email?: string;
    };

    if (!email || typeof email !== "string" || !email.includes("@")) {
      return NextResponse.json(
        { error: "メールアドレスが必要です" },
        { status: 400 }
      );
    }

    const baseUrl =
      process.env.NEXT_PUBLIC_APP_URL ??
      (request.headers.get("origin") || "http://localhost:3000");

    const stripe = getStripe();
    const session = await stripe.checkout.sessions.create({
      mode: "subscription",
      line_items: [
        {
          price: priceId,
          quantity: 1
        }
      ],
      success_url: `${baseUrl}/subscribe/success?session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: `${baseUrl}/subscribe`,
      customer_email: email,
      metadata: auth_user_id ? { auth_user_id } : {},
      subscription_data: auth_user_id
        ? { metadata: { auth_user_id } }
        : undefined
    });

    if (!session.url) {
      return NextResponse.json(
        { error: "Checkout URL の作成に失敗しました" },
        { status: 500 }
      );
    }

    return NextResponse.json({ url: session.url });
  } catch (err) {
    console.error("[stripe/checkout]", err);
    return NextResponse.json(
      { error: "決済の準備に失敗しました" },
      { status: 500 }
    );
  }
}
