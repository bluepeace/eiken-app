/**
 * OpenID Connect UserInfo エンドポイント
 * GET /oauth/userinfo
 */
import { Router, type Request, type Response } from "express";
import * as jose from "jose";
import type { AuthAdapter } from "../adapters/auth-adapter.js";
import { config } from "../config.js";
import { getPublicJwk } from "../crypto/keys.js";

export function createUserInfoRouter(authAdapter: AuthAdapter): Router {
  const router = Router();

  router.get("/", async (req: Request, res: Response) => {
    const authHeader = req.headers.authorization;
    if (!authHeader?.startsWith("Bearer ")) {
      res.set("WWW-Authenticate", 'Bearer error="invalid_request"');
      return res.status(401).json({
        error: "invalid_request",
        error_description: "Authorization: Bearer <token> が必要です",
      });
    }

    const token = authHeader.slice(7);
    let payload: jose.JWTPayload;

    try {
      const jwk = await getPublicJwk();
      const publicKey = await jose.importJWK(jwk, "RS256");
      const { payload: p } = await jose.jwtVerify(token, publicKey, {
        issuer: config.issuer,
      });
      payload = p;
    } catch {
      res.set("WWW-Authenticate", 'Bearer error="invalid_token"');
      return res.status(401).json({
        error: "invalid_token",
        error_description: "トークンが無効です",
      });
    }

    const userId = payload.sub as string;
    if (!userId) {
      return res.status(401).json({
        error: "invalid_token",
        error_description: "sub クレームがありません",
      });
    }

    const user = await authAdapter.getUserById(userId);
    if (!user) {
      return res.status(401).json({
        error: "invalid_token",
        error_description: "ユーザーが見つかりません",
      });
    }

    const userInfo: Record<string, unknown> = {
      sub: user.id,
      email: user.email,
      email_verified: true,
    };
    if (user.name) {
      userInfo.name = user.name;
      userInfo.preferred_username = user.name;
    }

    res.json(userInfo);
  });

  return router;
}
