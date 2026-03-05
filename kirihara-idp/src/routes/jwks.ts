/**
 * JSON Web Key Set (JWKS) エンドポイント
 * GET /.well-known/jwks.json
 */
import { Router, type Response } from "express";
import { getPublicJwk } from "../crypto/keys.js";

export function createJwksRouter(): Router {
  const router = Router();

  router.get("/", async (_req, res: Response) => {
    const jwk = await getPublicJwk();
    res.json({ keys: [jwk] });
  });

  return router;
}
