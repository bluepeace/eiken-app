import Link from "next/link";
import { profileLevelToVocabularyLevel } from "@/lib/data/vocabulary-db";
import { MODULE_COLORS, type ModuleKey } from "@/lib/constants/module-colors";

const MODULES = [
  {
    key: "vocabulary",
    titleEn: "Vocabulary",
    description: "フラッシュカードと SRS で効率よく暗記。",
    badge: "毎日の基本",
    href: "/vocabulary"
  },
  {
    key: "writing",
    titleEn: "Writing",
    description: "AI 添削で文法・構成・語彙をフィードバック。",
    badge: "AI 添削",
    href: "/writing",
    hideForLevels: ["英検4級", "英検5級"]
  },
  {
    key: "speaking",
    titleEn: "Speaking",
    description: "面接形式のロールプレイでアウトプット練習。",
    badge: "音声入力",
    href: "/speaking",
    hideForLevels: ["英検4級", "英検5級"],
    comingSoon: true
  },
  {
    key: "listening",
    titleEn: "Listening",
    description: "速度調整やディクテーションで耳を鍛える。",
    badge: "音声教材",
    href: "/listening",
    comingSoon: true
  },
  {
    key: "reading",
    titleEn: "Reading",
    description: "長文読解と要約で読解力をアップ。",
    badge: "長文対策",
    href: "/reading"
  }
] as const;

interface LearningModulesGridProps {
  targetLevel?: string | null;
}

export function LearningModulesGrid({ targetLevel }: LearningModulesGridProps) {
  const levelParam = targetLevel
    ? encodeURIComponent(profileLevelToVocabularyLevel(targetLevel))
    : null;

  const modules = MODULES.filter(
    (m) =>
      !(
        "hideForLevels" in m &&
        targetLevel &&
        (m.hideForLevels as readonly string[]).includes(targetLevel)
      )
  );
  return (
    <section className="space-y-3">
      <div className="flex items-center justify-between">
        <h2 className="text-sm font-semibold text-slate-900">学習モジュール</h2>
        <p className="text-[11px] text-slate-500">
          今日は 1〜2 モジュールに集中するのがおすすめです。
        </p>
      </div>
      <div className="grid gap-3 md:grid-cols-3">
        {modules.map((m) => {
          const colors = MODULE_COLORS[m.key as ModuleKey];
          const href =
              m.key === "vocabulary" || m.key === "writing" || m.key === "reading"
                ? levelParam
                  ? `${m.href}?level=${levelParam}`
                  : m.href
                : m.href;
          const comingSoon = "comingSoon" in m && m.comingSoon;

          if (comingSoon) {
            return (
              <div
                key={m.key}
                className={`flex flex-col justify-between rounded-2xl border-l-4 ${colors.borderLeft} border ${colors.border} bg-white p-5 shadow-md opacity-75 cursor-not-allowed`}
                aria-disabled="true"
              >
                <div className="space-y-2">
                  <div className="flex items-center gap-2 flex-wrap">
                    <div
                      className={`inline-flex items-center gap-2 rounded-full border px-2.5 py-0.5 text-xs font-medium ${colors.badge}`}
                    >
                      <span>{m.badge}</span>
                    </div>
                    <span className="rounded-full bg-slate-200 px-2.5 py-0.5 text-xs font-medium text-slate-600">
                      開発中
                    </span>
                  </div>
                  <h3 className={`text-xl font-bold ${colors.text}`}>
                    {m.titleEn}
                  </h3>
                  <p className="text-sm leading-relaxed text-slate-600">{m.description}</p>
                </div>
                <div className="mt-4 text-sm text-slate-500">
                  準備ができ次第、利用可能になります
                </div>
              </div>
            );
          }

          return (
            <Link
              key={m.key}
              href={href}
              className={`flex flex-col justify-between rounded-2xl border-l-4 ${colors.borderLeft} border ${colors.border} bg-white p-5 shadow-md transition-all duration-200 ease-out hover:-translate-y-0.5 hover:shadow-xl ${colors.hoverBg}`}
            >
              <div className="space-y-2">
                <div
                  className={`inline-flex items-center gap-2 rounded-full border px-2.5 py-0.5 text-xs font-medium ${colors.badge}`}
                >
                  <span>{m.badge}</span>
                </div>
                <h3 className={`text-xl font-bold ${colors.text}`}>
                  {m.titleEn}
                </h3>
                <p className="text-sm leading-relaxed text-slate-600">{m.description}</p>
              </div>
              <div className="mt-4">
                <span
                  className={`inline-flex items-center text-sm font-semibold ${colors.text}`}
                >
                  開く
                  <span aria-hidden="true" className="ml-1">
                    →
                  </span>
                </span>
              </div>
            </Link>
          );
        })}
      </div>
    </section>
  );
}

