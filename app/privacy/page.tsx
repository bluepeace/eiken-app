import Link from "next/link";
import { LandingHeader } from "@/components/landing/LandingHeader";
import { LandingFooter } from "@/components/landing/LandingFooter";
import { PRIVACY_POLICY } from "@/lib/constants/privacy-policy";

export const metadata = {
  title: "プライバシーポリシー | AiKen",
  description: "AiKen のプライバシーポリシー"
};

export default function PrivacyPage() {
  return (
    <div className="min-h-screen bg-white">
      <LandingHeader />
      <main className="mx-auto max-w-3xl px-4 py-12">
        <h1 className="text-2xl font-bold tracking-tight text-slate-900">
          プライバシーポリシー
        </h1>
        <p className="mt-2 text-sm text-slate-600">
          {PRIVACY_POLICY.operatorName}（以下「当サービス」）は、ユーザーの個人情報の取り扱いについて以下のとおり定めます。
        </p>
        <p className="mt-2 text-xs text-slate-500">
          制定日：{PRIVACY_POLICY.effectiveDate}
          <br />
          最終更新：{PRIVACY_POLICY.lastUpdated}
        </p>

        <div className="mt-8 space-y-8">
          {PRIVACY_POLICY.sections.map((section) => (
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

        <div className="mt-12 flex flex-wrap gap-4">
          <Link href="/" className="text-sm text-[#50c2cb] hover:underline">
            ← トップに戻る
          </Link>
          <Link href="/terms" className="text-sm text-[#50c2cb] hover:underline">
            利用規約
          </Link>
          <Link href="/tokushoho" className="text-sm text-[#50c2cb] hover:underline">
            特定商取引法に基づく表記
          </Link>
        </div>
      </main>
      <LandingFooter />
    </div>
  );
}
