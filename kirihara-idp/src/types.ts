/**
 * OAuth 2.0 / OIDC 型定義
 */

/** 登録済み OAuth クライアント */
export interface OAuthClient {
  clientId: string;
  clientSecret: string;
  redirectUris: string[];
  clientName?: string;
}

/** 認可コード（一時保存） */
export interface AuthorizationCode {
  code: string;
  clientId: string;
  redirectUri: string;
  scope: string;
  state?: string;
  codeChallenge?: string;
  codeChallengeMethod?: string;
  userId: string;
  userEmail: string;
  userName?: string;
  expiresAt: number;
}

/** 認証済みユーザー情報（Kirihara Academy から取得） */
export interface AuthenticatedUser {
  id: string;
  email: string;
  name?: string;
}

/** OIDC UserInfo レスポンス */
export interface UserInfoResponse {
  sub: string;
  email?: string;
  email_verified?: boolean;
  name?: string;
  preferred_username?: string;
}
