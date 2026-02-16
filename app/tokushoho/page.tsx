import Link from "next/link";
import { LandingHeader } from "@/components/landing/LandingHeader";
import { LandingFooter } from "@/components/landing/LandingFooter";
import { TOKUSHOHO } from "@/lib/constants/tokushoho";

export const metadata = {
  title: "特定商取引法に基づく表記 | AiKen",
  description: "特定商取引法に基づく表記"
};

export default function TokushohoPage() {
  const rows: { label: string; value: string }[] = [
    { label: "事業者名", value: TOKUSHOHO.businessName },
    { label: "事業者氏名", value: TOKUSHOHO.representativeName },
    { label: "所在地", value: TOKUSHOHO.address },
    { label: "電話番号", value: TOKUSHOHO.phone },
    { label: "メールアドレス", value: TOKUSHOHO.email },
    { label: "営業時間", value: TOKUSHOHO.businessHours },
    { label: "販売価格", value: TOKUSHOHO.price },
    { label: "支払方法", value: TOKUSHOHO.paymentMethod },
    { label: "支払時期", value: TOKUSHOHO.paymentTiming },
    { label: "役務の提供時期", value: TOKUSHOHO.serviceProvision },
    { label: "返品・キャンセル・解約", value: TOKUSHOHO.refundPolicy },
    { label: "事業者の責任に関する事項", value: TOKUSHOHO.liability },
    {
      label: "支払可能な手段の価格表示に関する事項",
      value: TOKUSHOHO.priceDisplay
    },
    { label: "事業者団体の名称・所在地・連絡先", value: TOKUSHOHO.consumerOrganization },
    { label: "相談窓口", value: TOKUSHOHO.consumerCenter }
  ];

  return (
    <div className="min-h-screen bg-white">
      <LandingHeader />
      <main className="mx-auto max-w-3xl px-4 py-12">
        <h1 className="text-2xl font-bold tracking-tight text-slate-900">
          特定商取引法に基づく表記
        </h1>
        <p className="mt-2 text-sm text-slate-600">
          AiKen（アイケン）のオンラインサービス（サブスクリプション）に関する表記です。
        </p>

        <div className="mt-8 overflow-hidden rounded-xl border border-slate-200 bg-white">
          <table className="w-full text-left text-sm">
            <tbody>
              {rows.map((row) => (
                <tr
                  key={row.label}
                  className="border-b border-slate-100 last:border-b-0"
                >
                  <th className="w-48 shrink-0 border-r border-slate-100 bg-slate-50 px-4 py-3 font-medium text-slate-700">
                    {row.label}
                  </th>
                  <td className="whitespace-pre-wrap px-4 py-3 leading-relaxed text-slate-800">
                    {row.value}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <p className="mt-6 text-xs text-slate-500">
          最終更新：サービス開始時（必要に応じて更新してください）
        </p>

        <Link
          href="/"
          className="mt-8 inline-block text-sm text-[#50c2cb] hover:underline"
        >
          ← トップに戻る
        </Link>
      </main>
      <LandingFooter />
    </div>
  );
}
