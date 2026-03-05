/**
 * Kirihara Academy OAuth 2.0 / OpenID Connect Identity Provider
 *
 * 起動: npm run dev
 * エンドポイント:
 *   - GET  /oauth/authorize    認可（ログイン画面）
 *   - POST /oauth/authorize    認可承認
 *   - POST /oauth/token        トークン発行
 *   - GET  /oauth/userinfo     UserInfo（OIDC）
 *   - GET  /.well-known/openid-configuration  OIDC Discovery
 */
import express from "express";
import { createAuthorizeRouter } from "./routes/authorize.js";
import { createTokenRouter } from "./routes/token.js";
import { createUserInfoRouter } from "./routes/userinfo.js";
import { createDiscoveryRouter } from "./routes/discovery.js";
import { createJwksRouter } from "./routes/jwks.js";
import { mockAuthAdapter } from "./adapters/mock-auth-adapter.js";
import { config } from "./config.js";

const app = express();

// 本番では adapters/kirihara-auth-adapter.ts などに差し替え
const authAdapter = mockAuthAdapter;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/oauth/authorize", createAuthorizeRouter(authAdapter));
app.use("/oauth/token", createTokenRouter());
app.use("/oauth/userinfo", createUserInfoRouter(authAdapter));
app.use("/.well-known/openid-configuration", createDiscoveryRouter());
app.use("/.well-known/jwks.json", createJwksRouter());

app.get("/", (_req, res) => {
  res.json({
    name: "Kirihara Academy OAuth 2.0 / OIDC IdP",
    version: "0.1.0",
    endpoints: {
      authorize: "/oauth/authorize",
      token: "/oauth/token",
      userinfo: "/oauth/userinfo",
      discovery: "/.well-known/openid-configuration",
    },
  });
});

app.listen(config.port, () => {
  console.log(`Kirihara IdP listening at ${config.issuer}`);
  console.log(`  - Authorize: ${config.issuer}/oauth/authorize`);
  console.log(`  - Token:     ${config.issuer}/oauth/token`);
  console.log(`  - UserInfo:  ${config.issuer}/oauth/userinfo`);
});
