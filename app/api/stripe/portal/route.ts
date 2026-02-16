import { NextRequest, NextResponse } from "next/server";
import { getStripe } from "@/lib/stripe";
import { createClient } from "@supabase/supabase-js";

/** サブスクリプション管理（解約・支払い方法変更）のポータルURLを返す */
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { auth_user_id } = body as { auth_user_id?: string };

    if (!auth_user_id) {
      return NextResponse.json(
        { error: "ログインが必要です" },
        { status: 400 }
      );
    }

    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
    );

    const { data: profile } = await supabase
      .from("user_profiles")
      .select("stripe_customer_id")
      .eq("auth_user_id", auth_user_id)
      .maybeSingle();

    const customerId = profile?.stripe_customer_id;
    if (!customerId) {
      return NextResponse.json(
        { error: "課金情報が見つかりません" },
        { status: 400 }
      );
    }

    const baseUrl =
      process.env.NEXT_PUBLIC_APP_URL ??
      (request.headers.get("origin") || "http://localhost:3000");

    const stripe = getStripe();
    const session = await stripe.billingPortal.sessions.create({
      customer: customerId,
      return_url: `${baseUrl}/profile`
    });

    return NextResponse.json({ url: session.url });
  } catch (err) {
    console.error("[stripe/portal]", err);
    return NextResponse.json(
      { error: "ポータルの準備に失敗しました" },
      { status: 500 }
    );
  }
}
