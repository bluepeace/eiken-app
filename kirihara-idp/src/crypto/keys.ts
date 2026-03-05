/**
 * JWT 署名用キー管理
 * RS256（非対称）をサポートし、Supabase サードパーティ認証と互換性を確保
 */
import * as jose from "jose";

let privateKey: jose.KeyLike | null = null;
let publicJwk: jose.JWK | null = null;

async function ensureKeys(): Promise<{ privateKey: jose.KeyLike; publicJwk: jose.JWK }> {
  const pem = process.env.KIRIHARA_IDP_PRIVATE_KEY;
  if (pem) {
    const pk = await jose.importPKCS8(pem, "RS256");
    privateKey = pk;
    const fullJwk = (await jose.exportJWK(pk)) as unknown as Record<string, unknown>;
    const { d, dp, dq, qi, p, q, ...publicParts } = fullJwk;
    publicJwk = { ...publicParts, kid: "kirihara-idp-1", alg: "RS256", use: "sig" } as jose.JWK;
    return { privateKey: pk, publicJwk };
  }

  if (privateKey && publicJwk) {
    return { privateKey, publicJwk };
  }

  const { privateKey: pk, publicKey: pub } = await jose.generateKeyPair("RS256", {
    modulusLength: 2048,
  });
  privateKey = pk;
  const pubJwk = await jose.exportJWK(pub);
  publicJwk = { ...pubJwk, kid: "kirihara-idp-1", alg: "RS256", use: "sig" } as jose.JWK;
  return { privateKey: pk, publicJwk };
}

/** 署名用の秘密鍵を取得 */
export async function getSigningKey(): Promise<jose.KeyLike> {
  const { privateKey: pk } = await ensureKeys();
  return pk;
}

/** 公開鍵を JWK 形式で取得（JWKS エンドポイント用） */
export async function getPublicJwk(): Promise<jose.JWK> {
  const { publicJwk: jwk } = await ensureKeys();
  return jwk;
}
