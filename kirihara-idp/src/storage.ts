/**
 * 認可コード・クライアントのストレージ
 *
 * 開発用のインメモリ実装です。
 * 本番では Redis や PostgreSQL に差し替えてください。
 */
import { randomBytes } from "node:crypto";
import type { AuthorizationCode, OAuthClient } from "./types.js";

const codes = new Map<string, AuthorizationCode>();
const clients = new Map<string, OAuthClient>();

/** デフォルトの eiken-app クライアント（開発用） */
const DEFAULT_CLIENT: OAuthClient = {
  clientId: "eiken-app",
  clientSecret: process.env.EIKEN_APP_CLIENT_SECRET ?? "eiken-app-secret-change-me",
  redirectUris: [
    "http://localhost:3000/auth/callback/kirihara",
    "https://eiken-app.example.com/auth/callback/kirihara",
  ],
  clientName: "eiken-app",
};

/** クライアントを初期登録 */
clients.set(DEFAULT_CLIENT.clientId, DEFAULT_CLIENT);

export function generateCode(): string {
  return randomBytes(32).toString("base64url");
}

export function saveAuthorizationCode(data: Omit<AuthorizationCode, "code">): string {
  const code = generateCode();
  codes.set(code, { ...data, code });
  return code;
}

export function consumeAuthorizationCode(code: string): AuthorizationCode | null {
  const data = codes.get(code);
  if (!data) return null;
  if (Date.now() > data.expiresAt) {
    codes.delete(code);
    return null;
  }
  codes.delete(code);
  return data;
}

export function getClient(clientId: string): OAuthClient | null {
  return clients.get(clientId) ?? null;
}

export function validateClientRedirect(
  clientId: string,
  redirectUri: string
): boolean {
  const client = getClient(clientId);
  if (!client) return false;
  return client.redirectUris.some(
    (uri) => uri === redirectUri || redirectUri.startsWith(uri + "?")
  );
}
