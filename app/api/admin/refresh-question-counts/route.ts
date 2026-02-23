import { NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

/**
 * 問題数集計を再実行する API（0:00 の cron 用）。
 * 認証: Authorization: Bearer <CRON_SECRET> または GET の ?secret=<CRON_SECRET>
 * 環境変数 CRON_SECRET を Vercel に設定してください。
 */
function isAuthorized(request: Request): boolean {
  const secret = process.env.CRON_SECRET;
  if (!secret) return false;
  const authHeader = request.headers.get("authorization");
  if (authHeader === `Bearer ${secret}`) return true;
  const url = request.url ? new URL(request.url) : null;
  if (url?.searchParams.get("secret") === secret) return true;
  return false;
}

export async function GET(request: Request) {
  if (!isAuthorized(request)) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }
  return runRefresh();
}

export async function POST(request: Request) {
  if (!isAuthorized(request)) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }
  return runRefresh();
}

async function runRefresh() {
  const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { persistSession: false } }
  );

  const { error } = await supabase.rpc("refresh_question_counts");
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
  return NextResponse.json({ ok: true });
}
