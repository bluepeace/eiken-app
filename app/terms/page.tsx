import Link from "next/link";
import { LandingHeader } from "@/components/landing/LandingHeader";
import { LandingFooter } from "@/components/landing/LandingFooter";
import { TERMS } from "@/lib/constants/terms";

export const metadata = {
  title: "利用規約 | AiKen",
  description: "AiKen の利用規約"
};

export default function TermsPage() {
  return (
    <div className="min-h-screen bg-white">
      <LandingHeader />
      <main className="mx-auto max-w-3xl px-4 py-12">
        <h1 className="text-2xl font-bold tracking-tight text-slate-900">
          利用規約
        </h1>
        <p className="mt-2 text-sm text-slate-600">
          AiKen（アイケン、以下「本サービス」）の利用に関する規約です。
        </p>
        <p className="mt-2 text-xs text-slate-500">
          制定日：{TERMS.effectiveDate}
          <br />
          最終更新：{TERMS.lastUpdated}
        </p>

        <div className="mt-8 space-y-8">
          {TERMS.sections.map((section) => (
            <section key={section.title}>
              <h2 className="text-lg font-semibold text-slate-900">
                {section.title}
              </h2>
              <div className="mt-2 whitespace-pre-wrap text-sm leading-relaxed text-slate-700">
                {section.content}
              </div>
            </section>
          ))}
        </div>

        <div className="mt-12 flex gap-4">
          <Link
            href="/"
            className="text-sm text-[#50c2cb] hover:underline"
          >
            ← トップに戻る
          </Link>
          <Link
            href="/privacy"
            className="text-sm text-[#50c2cb] hover:underline"
          >
            プライバシーポリシー
          </Link>
          <Link
            href="/tokushoho"
            className="text-sm text-[#50c2cb] hover:underline"
          >
            特定商取引法に基づく表記
          </Link>
        </div>
      </main>
      <LandingFooter />
    </div>
  );
}
