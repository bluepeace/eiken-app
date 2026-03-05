/**
 * OAuth 2.0 認可エンドポイント
 * GET /oauth/authorize
 */
import { Router, type Request, type Response } from "express";
import {
  getClient,
  saveAuthorizationCode,
  validateClientRedirect,
} from "../storage.js";
import { config } from "../config.js";
import type { AuthAdapter } from "../adapters/auth-adapter.js";

export function createAuthorizeRouter(authAdapter: AuthAdapter): Router {
  const router = Router();

  /** 認可画面表示（ログインフォーム含む） */
  router.get("/", (req: Request, res: Response) => {
    const { client_id, redirect_uri, scope, state, response_type } = req.query;

    if (!client_id || !redirect_uri || !response_type) {
      return res.status(400).send(`
        <!DOCTYPE html>
        <html><body>
          <h1>認可エラー</h1>
          <p>client_id, redirect_uri, response_type は必須です。</p>
        </body></html>
      `);
    }

    if (response_type !== "code") {
      return res.status(400).send(`
        <!DOCTYPE html>
        <html><body>
          <h1>認可エラー</h1>
          <p>response_type=code のみサポートしています。</p>
        </body></html>
      `);
    }

    const client = getClient(String(client_id));
    if (!client || !validateClientRedirect(String(client_id), String(redirect_uri))) {
      return res.status(400).send(`
        <!DOCTYPE html>
        <html><body>
          <h1>認可エラー</h1>
          <p>無効なクライアントまたは redirect_uri です。</p>
        </body></html>
      `);
    }

    const scopeStr = (scope as string) || "openid email profile";
    const stateStr = (state as string) || "";

    res.send(`
      <!DOCTYPE html>
      <html>
      <head><meta charset="utf-8"><title>Kirihara Academy でログイン</title></head>
      <body style="font-family: sans-serif; max-width: 400px; margin: 2rem auto; padding: 1rem;">
        <h1>Kirihara Academy でログイン</h1>
        <p>${client.clientName || client_id} にログインします。</p>
        <form method="post" action="/oauth/authorize">
          <input type="hidden" name="client_id" value="${client_id}" />
          <input type="hidden" name="redirect_uri" value="${redirect_uri}" />
          <input type="hidden" name="scope" value="${scopeStr}" />
          <input type="hidden" name="state" value="${stateStr}" />
          <input type="hidden" name="code_challenge" value="${req.query.code_challenge ?? ""}" />
          <input type="hidden" name="code_challenge_method" value="${req.query.code_challenge_method ?? ""}" />
          <div style="margin-bottom: 1rem;">
            <label>メールアドレス</label><br>
            <input type="email" name="email" required style="width: 100%; padding: 0.5rem;" />
          </div>
          <div style="margin-bottom: 1rem;">
            <label>パスワード</label><br>
            <input type="password" name="password" required style="width: 100%; padding: 0.5rem;" />
          </div>
          <button type="submit" style="padding: 0.5rem 1rem; background: #009DC9; color: white; border: none; border-radius: 4px;">
            ログイン
          </button>
        </form>
      </body>
      </html>
    `);
  });

  /** 認可承認（ログイン処理） */
  router.post("/", async (req: Request, res: Response) => {
    const {
      client_id,
      redirect_uri,
      scope,
      state,
      email,
      password,
      code_challenge,
      code_challenge_method,
    } = req.body;

    if (!client_id || !redirect_uri || !email || !password) {
      return res.redirect(
        `${redirect_uri}?error=invalid_request&error_description=missing_params&state=${state || ""}`
      );
    }

    const client = getClient(client_id);
    if (!client || !validateClientRedirect(client_id, redirect_uri)) {
      return res.redirect(
        `${redirect_uri}?error=invalid_client&state=${state || ""}`
      );
    }

    const user = await authAdapter.authenticate(email, password);
    if (!user) {
      return res.send(`
        <!DOCTYPE html>
        <html><body>
          <h1>ログイン失敗</h1>
          <p>メールアドレスまたはパスワードが正しくありません。</p>
          <a href="/oauth/authorize?client_id=${client_id}&redirect_uri=${encodeURIComponent(redirect_uri)}&scope=${scope || "openid email profile"}&state=${state || ""}&response_type=code">戻る</a>
        </body></html>
      `);
    }

    const code = saveAuthorizationCode({
      clientId: client_id,
      redirectUri: redirect_uri,
      scope: scope || "openid email profile",
      state,
      codeChallenge: code_challenge,
      codeChallengeMethod: code_challenge_method,
      userId: user.id,
      userEmail: user.email,
      userName: user.name,
      expiresAt: Date.now() + 10 * 60 * 1000, // 10分
    });

    const sep = redirect_uri.includes("?") ? "&" : "?";
    res.redirect(`${redirect_uri}${sep}code=${code}&state=${state || ""}`);
  });

  return router;
}
