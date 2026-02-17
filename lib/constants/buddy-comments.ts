/**
 * ダッシュボード右下のバディが表示するコメント。
 * パスに応じたメッセージを優先し、なければ共通メッセージから選ぶ。
 */

const BY_PATH: Record<string, string[]> = {
  "/dashboard": [
    "今日も一緒に頑張ろう！",
    "少しずつで大丈夫だよ。",
    "また会えてうれしいな。",
    "今日の調子はどう？"
  ],
  "/vocabulary": [
    "単語、たくさん覚えようね。",
    "復習すると忘れにくくなるよ。",
    "一緒に単語、頑張ろう！"
  ],
  "/vocabulary/history": [
    "よく頑張ってるね。",
    "履歴、すごい量だね。"
  ],
  "/writing": [
    "英作文、一緒に頑張ろう。",
    "書く練習、大事だね。",
    "添削結果を確認してみよう。"
  ],
  "/writing/history": [
    "過去の作文、見直すと伸びるよ。",
    "たくさん書いてるね。"
  ],
  "/reading": [
    "リーディング、集中して読もう。",
    "長文も一緒に攻略しよう。"
  ],
  "/profile": [
    "設定、ちゃんとしてえらいね。",
    "目標、一緒に達成しよう。"
  ],
  "/badges": [
    "バッジ、たくさん集めようね。",
    "また新しいバッジ、取ろう。"
  ]
};

const GENERAL: string[] = [
  "一緒に学習、頑張ろう。",
  "今日も少しずつでいいよ。",
  "また会えてうれしい。",
  "無理しないでね。",
  "困ったらいつでも聞いてね。",
  "続けてるの、えらいね。"
];

/** パスに合うコメントを1つ返す（完全一致 → 前方一致の長い順で BY_PATH を探し、なければ GENERAL） */
export function pickBuddyComment(pathname: string): string {
  const pathKey = pathname.replace(/\/$/, "") || "/";
  const exact = BY_PATH[pathKey];
  if (exact?.length) {
    const day = typeof window !== "undefined" ? Math.floor(Date.now() / 86400000) : 0;
    const index = (day + pathKey.length) % exact.length;
    return exact[Math.max(0, index)];
  }
  const prefixKeys = Object.keys(BY_PATH).filter((k) => pathKey.startsWith(k)).sort((a, b) => b.length - a.length);
  const pathComments = prefixKeys.length > 0 ? BY_PATH[prefixKeys[0]] : null;
  const pool = pathComments?.length ? pathComments : GENERAL;
  const day = typeof window !== "undefined" ? Math.floor(Date.now() / 86400000) : 0;
  const seed = pathKey.length + pathKey.slice(0, 8).split("").reduce((a, c) => a + c.charCodeAt(0), 0);
  const index = (day + seed) % pool.length;
  return pool[Math.max(0, index)];
}
