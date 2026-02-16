import { NextRequest, NextResponse } from "next/server";
import { Resend } from "resend";
import nodemailer from "nodemailer";
import { createClient } from "@supabase/supabase-js";

const CATEGORY_LABELS: Record<string, string> = {
  usage: "利用方法について",
  pricing: "料金について",
  bug: "システムの不具合について",
  business: "ビジネス提携など",
  other: "その他"
};

function buildHtml(categoryLabel: string, message: string): string {
  const escaped = message.trim().replace(/</g, "&lt;").replace(/>/g, "&gt;");
  return `
    <h2>お問い合わせを受け付けました</h2>
    <p><strong>項目:</strong> ${categoryLabel}</p>
    <h3>メッセージ:</h3>
    <pre style="white-space: pre-wrap; font-family: sans-serif; background: #f5f5f5; padding: 16px; border-radius: 8px;">${escaped}</pre>
    <p style="color: #666; font-size: 12px;">--- AiKen お問い合わせフォーム ---</p>
  `;
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { category, message } = body;

    if (!category || typeof message !== "string" || !message.trim()) {
      return NextResponse.json(
        { error: "項目とメッセージを入力してください" },
        { status: 400 }
      );
    }

    // 送信先: 管理画面の admin_email、未設定なら環境変数
    let toEmail = process.env.CONTACT_TO_EMAIL;
    if (!toEmail) {
      const supabase = createClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
      );
      const { data } = await supabase
        .from("app_settings")
        .select("admin_email")
        .eq("id", 1)
        .maybeSingle();
      toEmail = (data?.admin_email as string) ?? undefined;
    }

    if (!toEmail) {
      return NextResponse.json(
        {
          error:
            "送信先メールアドレスが設定されていません。管理画面で基本設定をご確認ください。"
        },
        { status: 500 }
      );
    }

    const categoryLabel = CATEGORY_LABELS[category] ?? category;
    const subject = `【AiKen】お問い合わせ: ${categoryLabel}`;
    const html = buildHtml(categoryLabel, message);

    // レンサバのSMTPを使う場合（SMTP_HOST が設定されていれば優先）
    if (process.env.SMTP_HOST) {
      const transporter = nodemailer.createTransport({
        host: process.env.SMTP_HOST,
        port: parseInt(process.env.SMTP_PORT ?? "587", 10),
        secure: process.env.SMTP_SECURE === "true",
        auth:
          process.env.SMTP_USER && process.env.SMTP_PASS
            ? {
                user: process.env.SMTP_USER,
                pass: process.env.SMTP_PASS
              }
            : undefined
      });

      const fromEmail =
        process.env.SMTP_FROM_EMAIL ?? process.env.SMTP_USER ?? "noreply@example.com";
      const fromName =
        process.env.CONTACT_FROM_NAME ?? "AiKen お問い合わせ";

      await transporter.sendMail({
        from: `"${fromName}" <${fromEmail}>`,
        to: toEmail,
        subject,
        html
      });

      return NextResponse.json({ success: true });
    }

    // Resend を使う場合
    const apiKey = process.env.RESEND_API_KEY;
    if (!apiKey) {
      console.error("[contact] メール送信の設定がありません。SMTP_HOST または RESEND_API_KEY を設定してください");
      return NextResponse.json(
        { error: "メール送信の設定がされていません" },
        { status: 500 }
      );
    }

    const fromEmail =
      process.env.CONTACT_FROM_EMAIL ?? "onboarding@resend.dev";
    const fromName = process.env.CONTACT_FROM_NAME ?? "AiKen お問い合わせ";

    const resend = new Resend(apiKey);
    const { data, error } = await resend.emails.send({
      from: `${fromName} <${fromEmail}>`,
      to: toEmail,
      subject,
      html
    });

    if (error) {
      console.error("[contact] Resend error:", error);
      return NextResponse.json(
        {
          error: "メールの送信に失敗しました。しばらくしてからお試しください。"
        },
        { status: 500 }
      );
    }

    return NextResponse.json({ success: true, id: data?.id });
  } catch (err) {
    console.error("[contact]", err);
    return NextResponse.json(
      { error: "送信処理中にエラーが発生しました" },
      { status: 500 }
    );
  }
}
