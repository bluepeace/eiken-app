/**
 * 学習モジュールごとの固定カラー
 * Stay Colorful パレット（Morpho Blue, Trendy Violet, Dazzling Fuchsia, Tree Poppy, Wild Lime）をベースに割り当て。
 */
export type ModuleKey =
  | "vocabulary"
  | "writing"
  | "reading"
  | "listening"
  | "speaking";

export const MODULE_COLORS: Record<
  ModuleKey,
  {
    /** カードのバッジ・アクセント背景 */
    badge: string;
    /** メインのテキスト・リンク色 */
    text: string;
    /** ホバー時のテキスト色 */
    textHover: string;
    /** カードのボーダー・左ライン */
    border: string;
    /** 左アクセントライン（border-l-4 用） */
    borderLeft: string;
    /** カードホバー時の背景 */
    bgHover: string;
    /** カードホバー時のみ背景色（border変更なし） */
    hoverBg: string;
    /** ドット・インディケータ */
    dot: string;
    /** 暗めの背景（カード全体など） */
    bg: string;
    /** ナビ・ダークモード用の強調色 */
    accent: string;
    /** ナビホバー色 */
    accentHover: string;
    /** ボタンなど塗りつぶし用 */
    solid: string;
    solidHover: string;
  }
> = {
  vocabulary: {
    badge: "bg-[#FF991F]/25 text-[#B86E00] border-[#FF991F]/55",
    text: "text-[#CC7A19]",
    textHover: "hover:text-[#FF991F]",
    border: "border-[#FF991F]/55",
    borderLeft: "border-l-[#FF991F]",
    bgHover: "hover:border-[#FF991F]/55 hover:bg-[#FF991F]/14",
    hoverBg: "hover:bg-[#FF991F]/12",
    dot: "bg-[#FF991F]",
    bg: "bg-[#FF991F]/14",
    accent: "text-[#FF991F]",
    accentHover: "hover:text-[#FFA940]",
    solid: "bg-[#FF991F]",
    solidHover: "hover:bg-[#E08818]"
  },
  writing: {
    badge: "bg-[#8DC63A]/25 text-[#5C8A28] border-[#8DC63A]/55",
    text: "text-[#6B9E2E]",
    textHover: "hover:text-[#8DC63A]",
    border: "border-[#8DC63A]/55",
    borderLeft: "border-l-[#8DC63A]",
    bgHover: "hover:border-[#8DC63A]/55 hover:bg-[#8DC63A]/14",
    hoverBg: "hover:bg-[#8DC63A]/12",
    dot: "bg-[#8DC63A]",
    bg: "bg-[#8DC63A]/14",
    accent: "text-[#8DC63A]",
    accentHover: "hover:text-[#9FD44D]",
    solid: "bg-[#8DC63A]",
    solidHover: "hover:bg-[#7AB32F]"
  },
  reading: {
    badge: "bg-[#009DC9]/25 text-[#006B89] border-[#009DC9]/55",
    text: "text-[#0087A8]",
    textHover: "hover:text-[#009DC9]",
    border: "border-[#009DC9]/55",
    borderLeft: "border-l-[#009DC9]",
    bgHover: "hover:border-[#009DC9]/55 hover:bg-[#009DC9]/14",
    hoverBg: "hover:bg-[#009DC9]/12",
    dot: "bg-[#009DC9]",
    bg: "bg-[#009DC9]/14",
    accent: "text-[#009DC9]",
    accentHover: "hover:text-[#00B4E0]",
    solid: "bg-[#009DC9]",
    solidHover: "hover:bg-[#0087A8]"
  },
  listening: {
    badge: "bg-[#843DAD]/25 text-[#5B2A7A] border-[#843DAD]/55",
    text: "text-[#6A3190]",
    textHover: "hover:text-[#843DAD]",
    border: "border-[#843DAD]/55",
    borderLeft: "border-l-[#843DAD]",
    bgHover: "hover:border-[#843DAD]/55 hover:bg-[#843DAD]/14",
    hoverBg: "hover:bg-[#843DAD]/12",
    dot: "bg-[#843DAD]",
    bg: "bg-[#843DAD]/14",
    accent: "text-[#843DAD]",
    accentHover: "hover:text-[#9B4FC7]",
    solid: "bg-[#843DAD]",
    solidHover: "hover:bg-[#6A3190]"
  },
  speaking: {
    badge: "bg-[#EC3496]/25 text-[#A02466] border-[#EC3496]/55",
    text: "text-[#BD2A78]",
    textHover: "hover:text-[#EC3496]",
    border: "border-[#EC3496]/55",
    borderLeft: "border-l-[#EC3496]",
    bgHover: "hover:border-[#EC3496]/55 hover:bg-[#EC3496]/14",
    hoverBg: "hover:bg-[#EC3496]/12",
    dot: "bg-[#EC3496]",
    bg: "bg-[#EC3496]/14",
    accent: "text-[#EC3496]",
    accentHover: "hover:text-[#F04DA8]",
    solid: "bg-[#EC3496]",
    solidHover: "hover:bg-[#D12A84]"
  }
};

/** パスからモジュールを判定 */
export function getModuleFromPath(pathname: string): ModuleKey | null {
  if (pathname.startsWith("/vocabulary")) return "vocabulary";
  if (pathname.startsWith("/writing")) return "writing";
  if (pathname.startsWith("/reading")) return "reading";
  if (pathname.startsWith("/listening")) return "listening";
  if (pathname.startsWith("/speaking")) return "speaking";
  return null;
}
