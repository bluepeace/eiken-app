/**
 * 会話文で話者（A:, B:, Teacher:, Student:, Woman:, Man: など）の前に改行を入れ、見やすくする
 */
export function formatConversationLines(text: string): string {
  if (!text || !text.trim()) return text;
  // 文頭以外で、空白の直後に「大文字で始まる話者名: "」が続く箇所を改行に（A/B 以外の Teacher, Student, Woman, Man, Boy 1 などにも対応）
  const withSpeakerBreaks = text.replace(
    /\s+(?=[A-Z][A-Za-z0-9.]*(?:\s+[A-Za-z0-9.]+)*:\s*")/g,
    "\n"
  );
  // 従来どおり A: / B: の前も改行（既に \n になっていなければ）
  return withSpeakerBreaks
    .replace(/\s+B:/g, "\nB:")
    .replace(/\s+A:/g, "\nA:")
    .trim();
}
