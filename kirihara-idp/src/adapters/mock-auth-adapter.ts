/**
 * モック認証アダプター（開発・テスト用）
 *
 * 本番では adapters/kirihara-auth-adapter.ts など、
 * 実際の Kirihara Academy と連携するアダプターに差し替えてください。
 */
import type { AuthAdapter } from "./auth-adapter.js";

/** 開発用の仮ユーザー（本番では削除） */
const MOCK_USERS: Record<string, { password: string; name: string }> = {
  "test@example.com": { password: "password123", name: "テストユーザー" },
};

export const mockAuthAdapter: AuthAdapter = {
  async authenticate(email: string, password: string) {
    const user = MOCK_USERS[email];
    if (!user || user.password !== password) return null;
    return {
      id: `mock-${email.replace(/[^a-z0-9]/gi, "-")}`,
      email,
      name: user.name,
    };
  },

  async getUserById(userId: string) {
    if (!userId.startsWith("mock-")) return null;
    const email = userId.replace("mock-", "").replace(/-/g, "@");
    const user = MOCK_USERS[email];
    if (!user) return null;
    return { id: userId, email, name: user.name };
  },
};
