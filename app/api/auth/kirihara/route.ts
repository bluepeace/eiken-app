import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL ?? "";
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY ?? "";
const kiriharaTokenUrl =
  process.env.KIRIHARA_OAUTH_TOKEN_URL ??
  "https://academy.kirihara.co.jp/WTE/oauth/oauth_token.pl";
const kiriharaUserinfoUrl =
  process.env.KIRIHARA_OAUTH_USERINFO_URL ??
  "https://academy.kirihara.co.jp/WTE/oauth/oauth_userinfo.pl";
const clientId = "eiken-app";
const clientSecret = process.env.KIRIHARA_OAUTH_CLIENT_SECRET ?? "";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { code, state } = body as { code?: string; state?: string };

    if (!code || typeof code !== "string") {
      return NextResponse.json(
        { error: "認可コードがありません" },
        { status: 400 }
      );
    }

    if (!serviceRoleKey) {
      return NextResponse.json(
        { error: "サーバー設定エラー（SUPABASE_SERVICE_ROLE_KEY）" },
        { status: 500 }
      );
    }

    // トークンエンドポイントでアクセストークンを取得
    const tokenRes = await fetch(kiriharaTokenUrl, {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({
        grant_type: "authorization_code",
        code,
        redirect_uri: `${request.nextUrl.origin}/auth/callback/kirihara`,
        client_id: clientId,
        client_secret: clientSecret
      })
    });

    if (!tokenRes.ok) {
      const errText = await tokenRes.text();
      console.error("[kirihara] token error:", tokenRes.status, errText);
      return NextResponse.json(
        { error: "トークン取得に失敗しました" },
        { status: 400 }
      );
    }

    const tokenData = (await tokenRes.json()) as {
      access_token?: string;
      id_token?: string;
    };
    const accessToken = tokenData.access_token ?? tokenData.id_token;

    if (!accessToken) {
      return NextResponse.json(
        { error: "トークンが取得できませんでした" },
        { status: 400 }
      );
    }

    // UserInfo でユーザー情報を取得
    const userinfoRes = await fetch(kiriharaUserinfoUrl, {
      headers: { Authorization: `Bearer ${accessToken}` }
    });

    if (!userinfoRes.ok) {
      return NextResponse.json(
        { error: "ユーザー情報の取得に失敗しました" },
        { status: 400 }
      );
    }

    const userinfo = (await userinfoRes.json()) as {
      sub?: string;
      email?: string;
      name?: string;
    };

    const email = userinfo.email;
    if (!email || !email.includes("@")) {
      return NextResponse.json(
        { error: "メールアドレスを取得できませんでした" },
        { status: 400 }
      );
    }

    const supabaseAdmin = createClient(supabaseUrl, serviceRoleKey, {
      auth: { autoRefreshToken: false, persistSession: false }
    });

    // 新規ユーザー作成（既存の場合はエラーになるが、その場合は generateLink のみ実行）
    const { error: createError } =
      await supabaseAdmin.auth.admin.createUser({
        email,
        email_confirm: true,
        user_metadata: {
          display_name: userinfo.name ?? email.split("@")[0],
          provider: "kirihara"
        }
      });

    // 既存ユーザーの場合は "User already registered" 等のエラーになるが、その場合は generateLink で続行
    if (createError && !createError.message?.includes("already") && !createError.message?.includes("registered")) {
      console.error("[kirihara] createUser error:", createError);
      return NextResponse.json(
        { error: "アカウント作成に失敗しました" },
        { status: 500 }
      );
    }

    // Magic link を生成（セッション確立用）
    const { data: linkData, error: linkError } =
      await supabaseAdmin.auth.admin.generateLink({
        type: "magiclink",
        email
      });

    if (linkError || !linkData?.properties?.hashed_token) {
      console.error("[kirihara] generateLink error:", linkError);
      return NextResponse.json(
        { error: "ログインリンクの生成に失敗しました" },
        { status: 500 }
      );
    }

    return NextResponse.json({
      token_hash: linkData.properties.hashed_token,
      state
    });
  } catch (err) {
    console.error("[kirihara] callback error:", err);
    return NextResponse.json(
      { error: "認証処理中にエラーが発生しました" },
      { status: 500 }
    );
  }
}
