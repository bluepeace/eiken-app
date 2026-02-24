"use client";

import Link from "next/link";

export default function SubscribeSuccessPage() {
  return (
    <main className="mx-auto max-w-2xl px-4 py-12">
      <div className="rounded-2xl border border-slate-200 bg-white p-8 text-center shadow-sm">
        <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-[#009DC9]/20">
          <svg
            className="h-8 w-8 text-[#009DC9]"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M5 13l4 4L19 7"
            />
          </svg>
        </div>
        <h1 className="text-xl font-semibold text-slate-900">
          登録ありがとうございます！
        </h1>
        <p className="mt-2 text-slate-600">
          プレミアムプランへの登録が完了しました。登録内容の確認メールをお送りしました。
        </p>
        <Link
          href="/dashboard"
          className="mt-6 inline-flex rounded-full bg-[#009DC9] px-6 py-2.5 text-sm font-semibold text-white hover:bg-[#0087A8]"
        >
          ダッシュボードへ
        </Link>
      </div>
    </main>
  );
}
