# Kirihara Academy ソースコード分析レポート（OAuth 連携用）

`sample_academy.kirihara` のソースコードと SQL を確認した結果をまとめます。

## システム構成

- **言語**: Perl
- **Web**: Apache + CGI
- **DB**: MySQL（データベース名: `wte`）
- **フレームワーク**: FCC（独自 MVC）

## 認証まわりの重要情報

### 1. ユーザーテーブル `members`

| カラム | 型 | 説明 |
|--------|-----|------|
| member_id | bigint | 主キー |
| member_email | varchar(255) | メールアドレス（UNIQUE） |
| member_pass | varchar(255) | パスワードハッシュ |
| member_lastname | varchar(100) | 姓 |
| member_firstname | varchar(100) | 名 |
| member_handle | varchar(30) | ハンドル名 |
| member_status | tinyint | 1=有効, 2=仮登録, 0=無効 |

### 2. パスワードハッシュ形式（FCC::Class::PasswdHash）

- **アルゴリズム**: SHA-256
- **ストレッチ**: 5000 回
- **ソルト**: 32 バイト（16進数 64 文字）、ハッシュの先頭に付与
- **形式**: `{salt_hex}{hash_hex}`（例: 64文字 + 64文字 = 128文字）

```perl
# 検証
FCC::Class::PasswdHash->new()->validate($plain_password, $member->{member_pass})
# 生成（新規登録時）
$rec->{member_pass} = FCC::Class::PasswdHash->new()->generate($plain_password);
```

### 3. ログイン処理の流れ

**ファイル**: `WTE/lib/FCC/Action/Mypage/AthlinsmtAction.pm`

1. `member_email`, `member_pass` を取得
2. `FCC::Class::Member->get_from_db_by_email($email)` で会員取得
3. `member_status == 1` を確認（有効会員のみ）
4. `FCC::Class::PasswdHash->new()->validate($pass, $member->{member_pass})` で照合
5. 成功時: `$self->{session}->create($member, $auto_login)`

### 4. DB 接続設定

**ファイル**: `WTE/default/default.ini.cgi`

```ini
db_host = localhost
db_name = wte
db_user = wte
db_pass = ...
db_port = 3306
```

## OAuth IdP を Perl で実装する場合

### 必要な CPAN モジュール

```bash
cpanm Crypt::JWT          # JWT 署名（RS256）
cpanm DBI DBD::mysql      # DB 接続（既存）
cpanm FCC::Class::Member  # 既存（会員取得）
cpanm FCC::Class::PasswdHash  # 既存（パスワード検証）
cpanm JSON                # JSON レスポンス
```

### 認証ロジック（既存コードの流用）

```perl
# メール/パスワードで認証
my $member = FCC::Class::Member->new(conf=>$conf, db=>$db)->get_from_db_by_email($email);
return undef unless $member && $member->{member_status} == 1;
return undef unless FCC::Class::PasswdHash->new()->validate($pass, $member->{member_pass});
# 成功: { id => $member->{member_id}, email => $member->{member_email}, name => ... }
```

### ユーザー情報の取得

```perl
# member_id から取得
my $member = FCC::Class::Member->new(...)->get_from_db($member_id);
# 表示名: member_handle があればそれ、なければ member_lastname + member_firstname
my $name = $member->{member_handle} || ($member->{member_lastname} . $member->{member_firstname});
```

### 新規テーブル（認可コード用）

OAuth の認可コードを保存するテーブルが必要です。

```sql
CREATE TABLE oauth_auth_codes (
  code VARCHAR(64) PRIMARY KEY,
  client_id VARCHAR(64) NOT NULL,
  redirect_uri VARCHAR(512) NOT NULL,
  member_id BIGINT UNSIGNED NOT NULL,
  scope VARCHAR(255),
  expires_at INT UNSIGNED NOT NULL,
  created_at INT UNSIGNED NOT NULL
);

CREATE TABLE oauth_clients (
  client_id VARCHAR(64) PRIMARY KEY,
  client_secret VARCHAR(128) NOT NULL,
  redirect_uris TEXT,
  client_name VARCHAR(100)
);
```

### Apache 設定例

OAuth エンドポイントを CGI または mod_perl で追加します。

```
/oauth/authorize  -> /path/to/WTE/cgi/oauth_authorize.pl
/oauth/token      -> /path/to/WTE/cgi/oauth_token.pl
/oauth/userinfo   -> /path/to/WTE/cgi/oauth_userinfo.pl
/.well-known/openid-configuration -> ...
/.well-known/jwks.json -> ...
```

## Node.js kirihara-idp を使う場合

既存の `kirihara-idp` の **AuthAdapter** を、Kirihara Academy の MySQL に直接接続する実装に差し替える方法もあります。

- **DB 接続**: `mysql2` などで `members` テーブルに接続
- **パスワード検証**: PasswdHash の形式を Node.js で再実装（salt + SHA256 x 5000）
- または、Kirihara Academy 側に「認証 API」を追加し、その API を AuthAdapter から呼ぶ

Perl で PasswdHash を再実装する方が、既存の Member/PasswdHash をそのまま使えるため、Perl 側で IdP を実装する方がシンプルです。
