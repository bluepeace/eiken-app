"use client";

import { useState } from "react";
import Link from "next/link";
import { LandingHeader } from "@/components/landing/LandingHeader";
import { LandingFooter } from "@/components/landing/LandingFooter";

const CATEGORIES = [
  { value: "usage", label: "利用方法について" },
  { value: "pricing", label: "料金について" },
  { value: "bug", label: "システムの不具合について" },
  { value: "business", label: "ビジネス提携など" },
  { value: "other", label: "その他" }
] as const;

export default function ContactPage() {
  const [category, setCategory] = useState("");
  const [message, setMessage] = useState("");
  const [status, setStatus] = useState<"idle" | "sending" | "success" | "error">(
    "idle"
  );
  const [errorText, setErrorText] = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!category || !message.trim()) {
      setErrorText("項目とメッセージを入力してください");
      return;
    }
    setErrorText("");
    setStatus("sending");
    try {
      const res = await fetch("/api/contact", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ category, message: message.trim() })
      });
      const data = await res.json();
      if (!res.ok) {
        throw new Error(data.error ?? "送信に失敗しました");
      }
      setStatus("success");
      setCategory("");
      setMessage("");
    } catch (err) {
      setStatus("error");
      setErrorText(err instanceof Error ? err.message : "送信に失敗しました");
    }
  };

  return (
    <div className="min-h-screen bg-white">
      <LandingHeader />
      <main className="mx-auto max-w-xl px-4 py-12">
        <h1 className="mb-2 text-2xl font-semibold text-slate-900">
          お問い合わせ
        </h1>
        <p className="mb-8 text-sm text-slate-600">
          お問い合わせ内容を入力し、送信してください。担当者より折り返しご連絡いたします。
        </p>

        {status === "success" ? (
          <div className="rounded-xl border border-green-200 bg-green-50 p-6">
            <p className="font-medium text-green-800">
              お問い合わせを受け付けました。
            </p>
            <p className="mt-1 text-sm text-green-700">
              内容を確認のうえ、担当者よりご連絡いたします。
            </p>
            <Link
              href="/"
              className="mt-4 inline-block text-sm font-medium text-green-700 hover:underline"
            >
              トップページに戻る
            </Link>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-6">
            <div>
              <label
                htmlFor="category"
                className="block text-sm font-medium text-slate-700"
              >
                お問い合わせ項目
              </label>
              <select
                id="category"
                value={category}
                onChange={(e) => setCategory(e.target.value)}
                className="mt-1 w-full rounded-lg border border-slate-300 px-3 py-2 text-slate-900 focus:border-[#50c2cb] focus:outline-none focus:ring-1 focus:ring-[#50c2cb]"
              >
                <option value="">選択してください</option>
                {CATEGORIES.map((c) => (
                  <option key={c.value} value={c.value}>
                    {c.label}
                  </option>
                ))}
              </select>
            </div>

            <div>
              <label
                htmlFor="message"
                className="block text-sm font-medium text-slate-700"
              >
                メッセージ
              </label>
              <textarea
                id="message"
                value={message}
                onChange={(e) => setMessage(e.target.value)}
                rows={8}
                placeholder="お問い合わせ内容をご記入ください"
                className="mt-1 w-full rounded-lg border border-slate-300 px-3 py-2 text-slate-900 placeholder:text-slate-400 focus:border-[#50c2cb] focus:outline-none focus:ring-1 focus:ring-[#50c2cb]"
              />
            </div>

            {errorText && (
              <p className="text-sm text-red-600">{errorText}</p>
            )}

            <div className="flex gap-4">
              <button
                type="submit"
                disabled={status === "sending"}
                className="rounded-full bg-[#50c2cb] px-6 py-2.5 text-sm font-semibold text-white transition hover:bg-[#46adb5] disabled:opacity-60"
              >
                {status === "sending" ? "送信中..." : "送信する"}
              </button>
              <Link
                href="/"
                className="rounded-full border border-slate-300 px-6 py-2.5 text-center text-sm font-semibold text-slate-700 transition hover:bg-slate-50"
              >
                キャンセル
              </Link>
            </div>
          </form>
        )}
      </main>
      <LandingFooter />
    </div>
  );
}
