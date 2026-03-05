# Kirihara Academy OAuth 2.0 / OpenID Connect IdP

Kirihara Academy（academy.kirihara.co.jp）用の OAuth 2.0 / OpenID Connect アイデンティティプロバイダーです。  
eiken-app など、桐原書店が提供する他サービスで「Kirihara Academy でログイン」を実現します。

## 機能

- **OAuth 2.0 Authorization Code フロー**（PKCE 対応）
- **OpenID Connect**（ID Token, UserInfo エンドポイント）
- **OIDC Discovery**（`/.well-known/openid-configuration`）
- **JWKS**（RS256 署名、Supabase サードパーティ認証対応）

## クイックスタート

```bash
cd kirihara-idp
npm install
npm run dev
```

開発用のモック認証で起動します。

- **テストユーザー**: `test@example.com` / `password123`
- **認可 URL**: http://localhost:3001/oauth/authorize?client_id=eiken-app&redirect_uri=http://localhost:3000/auth/callback/kirihara&response_type=code&scope=openid%20email%20profile

## エンドポイント

| エンドポイント | メソッド | 説明 |
|--------------|---------|------|
| `/oauth/authorize` | GET | 認可画面（ログインフォーム）表示 |
| `/oauth/authorize` | POST | 認可承認（ログイン処理） |
| `/oauth/token` | POST | トークン発行 |
| `/oauth/userinfo` | GET | UserInfo（OIDC） |
| `/.well-known/openid-configuration` | GET | OIDC Discovery |
| `/.well-known/jwks.json` | GET | JWKS（公開鍵） |

## 環境変数

| 変数名 | 説明 | デフォルト |
|--------|------|-----------|
| `KIRIHARA_IDP_ISSUER` | IdP のベース URL | `http://localhost:3001` |
| `KIRIHARA_IDP_PORT` | サーバーポート | `3001` |
| `KIRIHARA_IDP_JWT_SECRET` | （未使用・RS256 に移行済み） | - |
| `KIRIHARA_IDP_PRIVATE_KEY` | RSA 秘密鍵（PEM） | 自動生成（開発用） |
| `EIKEN_APP_CLIENT_SECRET` | eiken-app の client_secret | `eiken-app-secret-change-me` |

### 本番用 RSA 鍵の生成

```bash
openssl genrsa -out private.pem 2048
openssl rsa -in private.pem -pubout -out public.pem
# KIRIHARA_IDP_PRIVATE_KEY に private.pem の内容を設定
```

## Kirihara Academy との連携

デフォルトでは **モック認証**（`adapters/mock-auth-adapter.ts`）が使われます。

本番では `adapters/kirihara-auth-adapter.example.ts` を参考に、実際の Kirihara Academy のユーザー DB や API と連携するアダプターを実装してください。

1. `adapters/kirihara-auth-adapter.ts` を作成
2. `src/index.ts` で `mockAuthAdapter` を `kiriharaAuthAdapter` に差し替え

```ts
// src/index.ts
import { kiriharaAuthAdapter } from "./adapters/kirihara-auth-adapter.js";
const authAdapter = kiriharaAuthAdapter;
```

## eiken-app との連携

eiken-app 側の実装手順は [../docs/KIRIHARA_OAUTH_INTEGRATION.md](../docs/KIRIHARA_OAUTH_INTEGRATION.md) を参照してください。

## ディレクトリ構成

```
kirihara-idp/
├── src/
│   ├── adapters/          # 認証アダプター
│   │   ├── auth-adapter.ts
│   │   ├── mock-auth-adapter.ts
│   │   └── kirihara-auth-adapter.example.ts
│   ├── crypto/            # 鍵管理
│   ├── routes/            # OAuth/OIDC エンドポイント
│   ├── config.ts
│   ├── storage.ts
│   ├── types.ts
│   └── index.ts
├── package.json
├── tsconfig.json
└── README.md
```
