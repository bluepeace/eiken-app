/**
 * Kirihara Academy 認証アダプター
 *
 * 既存の Kirihara Academy のユーザー認証（メール/パスワード）と連携するためのインターフェースです。
 * 実際の Kirihara Academy の DB/API に合わせて実装を差し替えてください。
 *
 * 例:
 * - 同じ PostgreSQL を参照する
 * - Kirihara Academy の REST API を呼び出す
 * - LDAP など外部 IdP と連携する
 */
export interface AuthAdapter {
  /**
   * メールアドレスとパスワードでユーザーを認証する
   * @returns 認証成功時はユーザー情報、失敗時は null
   */
  authenticate(
    email: string,
    password: string
  ): Promise<{ id: string; email: string; name?: string } | null>;

  /**
   * ユーザー ID でユーザー情報を取得する（セッション検証用）
   */
  getUserById(userId: string): Promise<{ id: string; email: string; name?: string } | null>;
}
