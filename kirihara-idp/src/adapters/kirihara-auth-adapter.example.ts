/**
 * Kirihara Academy 認証アダプター（実装例）
 *
 * このファイルを kirihara-auth-adapter.ts にコピーし、
 * 実際の Kirihara Academy の DB/API に合わせて実装してください。
 *
 * 例: Kirihara Academy が PostgreSQL を使っている場合
 *
 *   import { Pool } from "pg";
 *   const pool = new Pool({ connectionString: process.env.KIRIHARA_DB_URL });
 *
 *   async authenticate(email: string, password: string) {
 *     const result = await pool.query(
 *       "SELECT id, email, name FROM users WHERE email = $1 AND password_hash = crypt($2, password_hash)",
 *       [email, password]
 *     );
 *     const row = result.rows[0];
 *     return row ? { id: row.id, email: row.email, name: row.name } : null;
 *   }
 *
 * 例: Kirihara Academy の REST API を呼ぶ場合
 *
 *   async authenticate(email: string, password: string) {
 *     const res = await fetch("https://academy.kirihara.co.jp/api/auth/login", {
 *       method: "POST",
 *       headers: { "Content-Type": "application/json" },
 *       body: JSON.stringify({ email, password }),
 *     });
 *     if (!res.ok) return null;
 *     const data = await res.json();
 *     return { id: data.user_id, email: data.email, name: data.name };
 *   }
 */
import type { AuthAdapter } from "./auth-adapter.js";

export const kiriharaAuthAdapter: AuthAdapter = {
  async authenticate(_email: string, _password: string) {
    // TODO: Kirihara Academy の認証ロジックを実装
    throw new Error("kirihara-auth-adapter を実装してください");
  },

  async getUserById(_userId: string) {
    // TODO: Kirihara Academy のユーザー取得を実装
    throw new Error("kirihara-auth-adapter を実装してください");
  },
};
