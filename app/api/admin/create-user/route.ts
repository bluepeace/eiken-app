import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL ?? "";
const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ?? "";
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY ?? "";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const {
      access_token,
      email,
      password,
      organization_id,
      display_name
    } = body as {
      access_token?: string;
      email?: string;
      password?: string;
      organization_id?: number;
      display_name?: string;
    };

    if (!access_token || typeof access_token !== "string") {
      return NextResponse.json(
        { error: "認証が必要です" },
        { status: 401 }
      );
    }
    if (!email || typeof email !== "string" || !email.includes("@")) {
      return NextResponse.json(
        { error: "有効なメールアドレスを入力してください" },
        { status: 400 }
      );
    }
    if (!password || typeof password !== "string" || password.length < 6) {
      return NextResponse.json(
        { error: "パスワードは6文字以上で入力してください" },
        { status: 400 }
      );
    }

    const orgId = organization_id != null ? Number(organization_id) : 1;
    if (Number.isNaN(orgId) || orgId < 1) {
      return NextResponse.json(
        { error: "所属企業を選択してください" },
        { status: 400 }
      );
    }

    const anonClient = createClient(supabaseUrl, anonKey);
    const { data: { user }, error: authError } = await anonClient.auth.getUser(access_token);
    if (authError || !user) {
      return NextResponse.json(
        { error: "認証に失敗しました" },
        { status: 401 }
      );
    }

    const { data: profile } = await anonClient
      .from("user_profiles")
      .select("role")
      .eq("auth_user_id", user.id)
      .maybeSingle();

    if (profile?.role !== "admin") {
      return NextResponse.json(
        { error: "管理者のみ実行できます" },
        { status: 403 }
      );
    }

    if (!serviceRoleKey) {
      return NextResponse.json(
        { error: "サーバー設定エラー（SUPABASE_SERVICE_ROLE_KEY）" },
        { status: 500 }
      );
    }

    const serviceClient = createClient(supabaseUrl, serviceRoleKey, {
      auth: { autoRefreshToken: false, persistSession: false }
    });

    const { data: newUser, error: createError } = await serviceClient.auth.admin.createUser({
      email,
      password,
      email_confirm: true
    });

    if (createError) {
      return NextResponse.json(
        { error: createError.message },
        { status: 400 }
      );
    }
    if (!newUser.user) {
      return NextResponse.json(
        { error: "ユーザー作成に失敗しました" },
        { status: 500 }
      );
    }

    const { error: profileError } = await serviceClient
      .from("user_profiles")
      .insert({
        auth_user_id: newUser.user.id,
        display_name: display_name?.trim() || null,
        organization_id: orgId
      });

    if (profileError) {
      return NextResponse.json(
        { error: profileError.message },
        { status: 500 }
      );
    }

    return NextResponse.json({
      message: "会員を登録しました",
      email: newUser.user.email
    });
  } catch (err) {
    console.error("[admin/create-user]", err);
    return NextResponse.json(
      { error: "登録に失敗しました" },
      { status: 500 }
    );
  }
}
