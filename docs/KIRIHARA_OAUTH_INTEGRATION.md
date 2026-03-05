# eiken-app と Kirihara IdP の連携手順

Kirihara Academy のアカウントで eiken-app にログインするための実装ガイドです。

## アーキテクチャ

```
[ユーザー] → [eiken-app] → [Kirihara IdP] → [Kirihara Academy 認証]
                ↑                ↓
                └── 認可コード・トークン ──┘
```

1. ユーザーが eiken-app で「Kirihara でログイン」をクリック
2. Kirihara IdP の認可画面にリダイレクト
3. Kirihara Academy のメール/パスワードでログイン
4. IdP が認可コードを発行し、eiken-app のコールバックにリダイレクト
5. eiken-app が認可コードをトークンに交換し、UserInfo でユーザー情報を取得
6. Supabase にユーザーを作成/取得し、magic link 経由でセッション確立

## 実装手順

### 1. Kirihara IdP の起動

**Perl 版（Kirihara Academy に組み込み）の場合:**

```bash
# テーブル作成
mysql -u wte -p wte < sample_academy.kirihara/WTE/oauth/oauth_tables.sql

# Apache で /WTE/oauth/ を CGI として有効化
# 詳細は sample_academy.kirihara/WTE/oauth/README.md を参照
```

**Node.js 版（kirihara-idp）の場合:**

```bash
cd kirihara-idp
npm install
npm run dev
```

### 2. eiken-app にコールバック API を追加

`app/api/auth/callback/kirihara/route.ts` を作成し、以下を実装します。

- クエリから `code` と `state` を取得
- IdP のトークンエンドポイントに POST して `access_token` を取得
- UserInfo エンドポイントでユーザー情報を取得
- Supabase Admin で `createUser` または既存ユーザーを取得
- `generateLink({ type: "magiclink", email })` で magic link を生成
- クライアントにリダイレクトし、`verifyOtp` でセッション確立

### 3. ログイン画面に「Kirihara でログイン」ボタンを追加

`LoginForm.tsx` にボタンを追加し、以下の URL にリダイレクトします。

**Perl 版（Kirihara Academy）:**
```
https://academy.kirihara.co.jp/WTE/oauth/oauth_authorize.pl?client_id=eiken-app&redirect_uri=https://eiken-app.example.com/auth/callback/kirihara&response_type=code&scope=openid%20email%20profile&state=<random>
```

**Node.js 版（kirihara-idp）:**
```
http://localhost:3001/oauth/authorize?client_id=eiken-app&redirect_uri=http://localhost:3000/auth/callback/kirihara&response_type=code&scope=openid%20email%20profile&state=<random>
```

本番では `state` に CSRF 対策用のランダム値を入れ、コールバックで検証します。

### 4. Supabase の設定

- **Redirect URLs**: `http://localhost:3000/auth/callback/kirihara` を追加
- **環境変数**: `KIRIHARA_IDP_URL`, `EIKEN_APP_CLIENT_SECRET` を設定

### 5. Supabase サードパーティ認証（オプション）

Supabase の Third-Party Auth を使う場合、Kirihara IdP の OIDC Issuer URL を登録します。  
現時点では Supabase が Kirihara をビルトインでサポートしていないため、**magic link パターン**（上記 2）を推奨します。

## セキュリティ

- **PKCE**: 認可リクエストに `code_challenge` を付与し、トークン交換時に `code_verifier` を検証
- **state**: CSRF 対策のため、認可リクエストとコールバックで `state` を検証
- **client_secret**: トークンエンドポイントでは Basic 認証または body で client_secret を送信

## 参考

- [OAuth 2.0 RFC 6749](https://datatracker.ietf.org/doc/html/rfc6749)
- [OpenID Connect Core 1.0](https://openid.net/specs/openid-connect-core-1_0.html)
- [Supabase Auth - Third-party](https://supabase.com/docs/guides/auth/third-party/overview)
