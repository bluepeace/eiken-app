# Kirihara Academy OAuth 2.0 / OIDC IdP

Perl + Apache + MySQL で動作する OAuth 2.0 / OpenID Connect アイデンティティプロバイダーです。  
eiken-app などで「Kirihara Academy でログイン」を実現します。

## セットアップ

### 1. テーブル作成

```bash
mysql -u wte -p wte < oauth_tables.sql
```

### 2. Apache 設定

oauth ディレクトリを CGI として実行できるようにします。

```apache
# 例: /WTE/oauth/ でアクセス可能にする場合
ScriptAlias /WTE/oauth/ /var/www/WTE/oauth/
<Directory /var/www/WTE/oauth>
    Options +ExecCGI
    AddHandler cgi-script .pl
    Require all granted
</Directory>
```

または、既存の CGI ディレクトリにシンボリックリンクを張る方法もあります。

### 3. 設定（default.ini.cgi）

`[oauth]` セクションを追加済みです。本番では `jwt_secret` を必ず変更してください。

```ini
[oauth]
jwt_secret = 本番用のランダムな文字列
```

### 4. 必要な CPAN モジュール

```bash
cpanm Config::Tiny DBI DBD::mysql CGI JSON Digest::SHA MIME::Base64
```

FCC::Class::PasswdHash は既存の WTE/lib に含まれています。

## エンドポイント

| URL | メソッド | 説明 |
|-----|---------|------|
| /WTE/oauth/oauth_authorize.pl | GET | 認可画面（ログインフォーム） |
| /WTE/oauth/oauth_authorize.pl | POST | 認可承認 |
| /WTE/oauth/oauth_token.pl | POST | トークン発行 |
| /WTE/oauth/oauth_userinfo.pl | GET | UserInfo |
| /WTE/oauth/oauth_discovery.pl | GET | OIDC Discovery |
| /WTE/oauth/oauth_jwks.pl | GET | JWKS |

## 認可 URL 例（eiken-app 用）

```
https://academy.kirihara.co.jp/WTE/oauth/oauth_authorize.pl?client_id=eiken-app&redirect_uri=https://eiken-app.example.com/auth/callback/kirihara&response_type=code&scope=openid%20email%20profile&state=xxx
```

## 注意事項

- 現在は **HS256** で JWT を署名しています。Supabase サードパーティ認証は **RS256** が必要なため、RS256 対応時は Crypt::JWT と RSA 鍵の設定が必要です。
- `oauth_clients.redirect_uris` には改行区切りで複数の redirect_uri を登録できます。
