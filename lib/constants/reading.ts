/**
 * リーディングモジュール用定数（READING_DESIGN.md に基づく）
 * 級セレクトと、級ごとに表示するメニュー（問題タイプ）の対応
 */

/** リーディングで選択可能な級（表示順） */
export const READING_LEVELS = [
  "1級",
  "準1級",
  "2級",
  "準2級プラス",
  "準2級",
  "3級",
  "4級",
  "5級",
] as const;

export type ReadingLevel = (typeof READING_LEVELS)[number];

/** 問題タイプのコード（URL・DB と対応） */
export const READING_PROBLEM_TYPES = [
  "short_fill",
  "conversation_fill",
  "word_order",
  "long_fill",
  "long_content",
] as const;

export type ReadingProblemType = (typeof READING_PROBLEM_TYPES)[number];

/** 問題タイプの表示名と説明・パス */
export const PROBLEM_TYPE_INFO: Record<
  ReadingProblemType,
  { label: string; path: string; description: string }
> = {
  short_fill: {
    label: "短文の語句空所補充",
    path: "/reading/short",
    description: "大問1。4肢から語句を選びます。",
  },
  conversation_fill: {
    label: "会話文の空所補充",
    path: "/reading/conversation",
    description: "大問2。会話の空所に適切な文・語句を選びます。",
  },
  word_order: {
    label: "語句整序",
    path: "/reading/word-order",
    description: "日本文の意味に合うように語句を並べ替えます。",
  },
  long_fill: {
    label: "長文の語句空所補充",
    path: "/reading/long-fill",
    description: "長文中の空所に文脈に合う語句を選びます。",
  },
  long_content: {
    label: "長文の内容一致選択",
    path: "/reading/long-content",
    description: "長文を読んで質問に4肢で答えます。",
  },
};

/** 級ごとに有効な問題タイプ（メニューに表示する） */
const LEVEL_TO_PROBLEM_TYPES: Record<ReadingLevel, ReadingProblemType[]> = {
  "1級": ["short_fill", "long_fill", "long_content"],
  "準1級": ["short_fill", "long_fill", "long_content"],
  "2級": ["short_fill", "long_fill", "long_content"],
  "準2級プラス": ["short_fill", "long_fill", "long_content"],
  "準2級": ["short_fill", "conversation_fill", "long_fill", "long_content"],
  "3級": ["short_fill", "conversation_fill", "long_content"],
  "4級": ["short_fill", "conversation_fill", "word_order", "long_content"],
  "5級": ["short_fill", "conversation_fill", "word_order"],
};

/**
 * 指定した級で表示するメニュー項目（問題タイプ）のリストを返す
 */
export function getMenuItemsForLevel(
  level: ReadingLevel
): { type: ReadingProblemType; label: string; path: string; description: string }[] {
  const types = LEVEL_TO_PROBLEM_TYPES[level] ?? [];
  return types.map((type) => ({
    type,
    ...PROBLEM_TYPE_INFO[type],
  }));
}

/** 指定した級で問題タイプが有効か */
export function isProblemTypeEnabledForLevel(
  level: string,
  problemType: ReadingProblemType
): boolean {
  if (!READING_LEVELS.includes(level as ReadingLevel)) return false;
  return LEVEL_TO_PROBLEM_TYPES[level as ReadingLevel].includes(problemType);
}
