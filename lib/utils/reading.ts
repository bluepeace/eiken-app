/**
 * 会話文で A: / B: の前に改行を入れ、見やすくする
 */
export function formatConversationLines(text: string): string {
  if (!text || !text.trim()) return text;
  return text
    .replace(/\s+B:/g, "\nB:")
    .replace(/\s+A:/g, "\nA:")
    .trim();
}
