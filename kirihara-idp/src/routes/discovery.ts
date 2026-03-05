/**
 * OpenID Connect Discovery
 * GET /.well-known/openid-configuration
 */
import { Router, type Response } from "express";
import { config } from "../config.js";

export function createDiscoveryRouter(): Router {
  const router = Router();
  const issuer = config.issuer.replace(/\/$/, "");

  router.get("/", (_req, res: Response) => {
    res.json({
      issuer,
      authorization_endpoint: `${issuer}/oauth/authorize`,
      token_endpoint: `${issuer}/oauth/token`,
      userinfo_endpoint: `${issuer}/oauth/userinfo`,
      jwks_uri: `${issuer}/.well-known/jwks.json`,
      scopes_supported: ["openid", "email", "profile"],
      response_types_supported: ["code"],
      grant_types_supported: ["authorization_code"],
      subject_types_supported: ["public"],
      id_token_signing_alg_values_supported: ["HS256"],
    });
  });

  return router;
}
