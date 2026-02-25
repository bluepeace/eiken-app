import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL ?? "";
const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ?? "";
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY ?? "";

export async function POST(request: NextRequest) {
  try {
    const authHeader = request.headers.get("authorization");
    const accessToken = authHeader?.replace(/^Bearer\s+/i, "") ?? "";

    if (!accessToken) {
      return NextResponse.json({ error: "認証が必要です" }, { status: 401 });
    }

    const body = await request.json();
    const { profile_id, email } = body as { profile_id?: string; email?: string };

    if (!profile_id || typeof profile_id !== "string") {
      return NextResponse.json({ error: "profile_id が必要です" }, { status: 400 });
    }
    if (!email || typeof email !== "string" || !email.includes("@")) {
      return NextResponse.json(
        { error: "有効なメールアドレスを入力してください" },
        { status: 400 }
      );
    }

    const anonClient = createClient(supabaseUrl, anonKey);
    const {
      data: { user },
      error: authError
    } = await anonClient.auth.getUser(accessToken);
    if (authError || !user) {
      return NextResponse.json({ error: "認証に失敗しました" }, { status: 401 });
    }

    const { data: profile } = await anonClient
      .from("user_profiles")
      .select("role")
      .eq("auth_user_id", user.id)
      .maybeSingle();

    if (profile?.role !== "admin") {
      return NextResponse.json({ error: "管理者のみ実行できます" }, { status: 403 });
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

    const { data: profileRow } = await serviceClient
      .from("user_profiles")
      .select("auth_user_id")
      .eq("id", profile_id)
      .maybeSingle();

    if (!profileRow?.auth_user_id) {
      return NextResponse.json({ error: "ユーザーが見つかりません" }, { status: 404 });
    }

    const authUserId = profileRow.auth_user_id;
    const { data: authUser } = await serviceClient.auth.admin.getUserById(authUserId);
    const identities = authUser?.user?.identities ?? [];
    const providers = authUser?.user?.app_metadata?.providers as string[] | undefined;
    const hasEmailProvider =
      identities.some((i: { provider?: string }) => i.provider === "email") ||
      providers?.includes("email") ||
      authUser?.user?.app_metadata?.provider === "email";
    if (!hasEmailProvider) {
      return NextResponse.json(
        { error: "Googleアカウントでログインしたユーザーはメールアドレスを編集できません" },
        { status: 400 }
      );
    }
    const { error: updateError } = await serviceClient.auth.admin.updateUserById(
      authUserId,
      { email }
    );

    if (updateError) {
      return NextResponse.json(
        { error: updateError.message },
        { status: 400 }
      );
    }

    return NextResponse.json({
      message: "メールアドレスを更新しました",
      email
    });
  } catch (err) {
    console.error("[admin/update-user-email]", err);
    return NextResponse.json(
      { error: "更新に失敗しました" },
      { status: 500 }
    );
  }
}
