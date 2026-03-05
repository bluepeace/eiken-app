/**
 * Kirihara IdP 設定
 * 環境変数または .env で上書き可能
 */
export const config = {
  /** IdP のベース URL（例: https://academy.kirihara.co.jp/auth） */
  issuer: process.env.KIRIHARA_IDP_ISSUER ?? "http://localhost:3001",

  /** サーバーポート */
  port: parseInt(process.env.KIRIHARA_IDP_PORT ?? "3001", 10),

  /** JWT 署名用の秘密鍵（本番では必ず環境変数で設定） */
  jwtSecret:
    process.env.KIRIHARA_IDP_JWT_SECRET ??
    "CHANGE_ME_IN_PRODUCTION_USE_STRONG_SECRET",

  /** アクセストークンの有効期限（秒） */
  accessTokenExpiry: 3600, // 1時間

  /** ID トークンの有効期限（秒） */
  idTokenExpiry: 3600,
} as const;
