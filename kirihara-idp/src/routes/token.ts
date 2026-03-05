/**
 * OAuth 2.0 トークンエンドポイント
 * POST /oauth/token
 */
import { Router, type Request, type Response } from "express";
import * as jose from "jose";
import { createHash } from "node:crypto";
import {
  consumeAuthorizationCode,
  getClient,
} from "../storage.js";
import { config } from "../config.js";
import { getSigningKey } from "../crypto/keys.js";

export function createTokenRouter(): Router {
  const router = Router();

  router.post("/", async (req: Request, res: Response) => {
    const contentType = req.headers["content-type"] || "";
    let grantType: string;
    let code: string;
    let redirectUri: string;
    let clientId: string;
    let clientSecret: string;
    let codeVerifier: string | undefined;

    if (contentType.includes("application/json")) {
      grantType = req.body.grant_type;
      code = req.body.code;
      redirectUri = req.body.redirect_uri;
      clientId = req.body.client_id ?? req.headers["x-client-id"];
      clientSecret = req.body.client_secret ?? req.headers["x-client-secret"];
      codeVerifier = req.body.code_verifier;
    } else {
      grantType = req.body.grant_type;
      code = req.body.code;
      redirectUri = req.body.redirect_uri;
      clientId = req.body.client_id;
      clientSecret = req.body.client_secret;
      codeVerifier = req.body.code_verifier;
    }

    if (grantType !== "authorization_code") {
      return res.status(400).json({
        error: "unsupported_grant_type",
        error_description: "authorization_code のみサポート",
      });
    }

    if (!code || !redirectUri || !clientId || !clientSecret) {
      return res.status(400).json({
        error: "invalid_request",
        error_description: "code, redirect_uri, client_id, client_secret は必須です",
      });
    }

    const client = getClient(clientId);
    if (!client || client.clientSecret !== clientSecret) {
      return res.status(401).json({
        error: "invalid_client",
        error_description: "クライアント認証に失敗しました",
      });
    }

    const authCode = consumeAuthorizationCode(code);
    if (!authCode) {
      return res.status(400).json({
        error: "invalid_grant",
        error_description: "認可コードが無効または期限切れです",
      });
    }

    if (authCode.clientId !== clientId || authCode.redirectUri !== redirectUri) {
      return res.status(400).json({
        error: "invalid_grant",
        error_description: "redirect_uri が一致しません",
      });
    }

    // PKCE 検証（code_challenge が含まれていた場合）
    if (authCode.codeChallenge) {
      if (!codeVerifier) {
        return res.status(400).json({
          error: "invalid_request",
          error_description: "code_verifier が必要です（PKCE）",
        });
      }
      const expected =
        authCode.codeChallengeMethod === "S256"
          ? createHash("sha256").update(codeVerifier).digest("base64url")
          : codeVerifier;
      if (expected !== authCode.codeChallenge) {
        return res.status(400).json({
          error: "invalid_grant",
          error_description: "code_verifier が一致しません",
        });
      }
    }

    const now = Math.floor(Date.now() / 1000);
    const signingKey = await getSigningKey();

    const accessTokenPayload = {
      sub: authCode.userId,
      email: authCode.userEmail,
      scope: authCode.scope,
      client_id: clientId,
      iss: config.issuer,
      aud: clientId,
      iat: now,
      exp: now + config.accessTokenExpiry,
    };

    const accessToken = await new jose.SignJWT(accessTokenPayload as Record<string, unknown>)
      .setProtectedHeader({ alg: "RS256", kid: "kirihara-idp-1" })
      .setIssuedAt(now)
      .setExpirationTime(now + config.accessTokenExpiry)
      .sign(signingKey);

    let idToken: string | undefined;
    if (authCode.scope.includes("openid")) {
      const idPayload = {
        sub: authCode.userId,
        email: authCode.userEmail,
        name: authCode.userName,
        iss: config.issuer,
        aud: clientId,
        iat: now,
        exp: now + config.idTokenExpiry,
      };
      idToken = await new jose.SignJWT(idPayload as Record<string, unknown>)
        .setProtectedHeader({ alg: "RS256", kid: "kirihara-idp-1" })
        .setIssuedAt(now)
        .setExpirationTime(now + config.idTokenExpiry)
        .sign(signingKey);
    }

    res.json({
      access_token: accessToken,
      token_type: "Bearer",
      expires_in: config.accessTokenExpiry,
      scope: authCode.scope,
      ...(idToken && { id_token: idToken }),
    });
  });

  return router;
}
