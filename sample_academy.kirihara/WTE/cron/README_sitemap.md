# サイトマップ自動作成 (sitemap_gen.pl)

## ディレクトリ構成（標準）

| パス | 説明 |
|------|------|
| `/var/www/html` | ドキュメントルート（sitemap.xml の出力先） |
| `/var/www/WTE/cron` | cron 用スクリプト（sitemap_cron.sh, sitemap_gen.pl）を格納 |
| `/var/www/WTE/default` | default.ini.cgi を格納 |

引数なしで `sitemap_cron.sh` を実行した場合、`../default/default.ini.cgi`（= `/var/www/WTE/default/default.ini.cgi`）を読み、`../../html/sitemap.xml`（= `/var/www/html/sitemap.xml`）に出力します。

## 概要

- 開始URL・正規ドメインは **default.ini.cgi の `ssl_host_url`** から取得します（他社・他環境でも同じスクリプトを利用可能）。
- 同一ドメイン内のリンクを辿り、**ページ（HTML）のURLのみ**を収集して `sitemap.xml` を出力します。
- 画像・CSS・JS 等のURLはサイトマップに含めません。

## 正規URLルール

- 正規ドメイン: `https://www.rocky.wte.jp/`（http / https / rocky.wte.jp でアクセスしてもこの形式に統一）
- `/WTE/site.cgi?m=XXX` は **`/wte/XXX`** に正規化（クエリが `m` のみの場合）
- 例: `https://www.rocky.wte.jp/WTE/site.cgi?m=prflstfrm` → `https://www.rocky.wte.jp/wte/prflstfrm`
- パラメータが1つある場合（例: `?m=prflstfrm&s_prof_character=1`）はそのままサイトマップに含め、正規形は `https://www.rocky.wte.jp/wte/prflstfrm?s_prof_character=1`
- **パラメータは `?` 1個・`&` 1個まで**（最大2パラメータ）。それ以上付くURLはサイトマップから除外します。
- **/WTE/mypage.cgi** は `?m=XXX` のみに正規化（例: athlinfrm は `?m=athlinfrm&lang=1&target=mbrmodfrm&r=` → `?m=athlinfrm`）。
- **utm_source, utm_medium, utm_campaign など utm_*** 系のクエリ**はすべて除去する（サイトマップには含めない）。
- パス内の **連続スラッシュ（//）は 1 本（/）に正規化**する。
- **/blog** を含むURLはサイトマップ・クロール対象から除外（ブログはプラグインで管理）。
- **priority**: `/`=1.0、`/wte/about`・`/wte/plan`・`/wte/lesson`=0.9、`/WTE/*.cgi`=0.8、その他=0.6。
- **inqfrmshw のみ**: サイトマップの `<loc>` は通常 `/wte/XXX` だが、システム都合で **inqfrmshw** だけ `/WTE/site.cgi?m=inqfrmshw` 形式で出力する。

## 必要モジュール (Perl)

- `LWP::UserAgent`（HTTP 取得）
- `URI`
- `URI::QueryParam`（URI に同梱）
- `Config::Tiny`（default.ini.cgi 読み込み用。他 cron と同じ）

例: `cpan LWP::UserAgent URI Config::Tiny` または `yum install perl-LWP-Protocol-https perl-URI perl-Config-Tiny`

※ `default/default.ini.cgi` に `ssl_host_url` が無い、または読み込めない場合は `https://www.rocky.wte.jp` にフォールバックし、標準エラーに警告を出します。

### 別ドメイン・別設置場所で default.ini.cgi を読まない場合

スクリプトは **次の順** で設定ファイルを探します。

1. **SITEMAP_CONFIG** … 設定ファイルの絶対パス  
   ```bash
   export SITEMAP_CONFIG=/var/www/example.com/WTE/default/default.ini.cgi
   perl sitemap_gen.pl
   ```
2. **WTE_ROOT** … WTE ディレクトリの絶対パス（`$WTE_ROOT/default/default.ini.cgi` を読む）  
   ```bash
   export WTE_ROOT=/var/www/example.com/WTE
   perl sitemap_gen.pl
   ```
3. スクリプトからの相対パス `../default/default.ini.cgi`（同じ WTE ツリー内で実行する場合）

cron で別サイト用に使う例（同じサーバーに複数ドメインがある場合）:
```bash
# 実行時に WTE のパスを第1引数で渡す（推奨）
sh sitemap_cron.sh /var/www/html/WTE
```
```cron
# academy.kirihara.co.jp 用（WTE が /var/www/html/WTE にある場合）
0 1 * * * /var/www/WTE/cron/sitemap_cron.sh /var/www/html/WTE >> /var/www/WTE/cron/logs/sitemap_kirihara.log 2>&1
```
出力先は第1引数で指定した WTE の1つ上のディレクトリの `sitemap.xml`（例: `/var/www/html/sitemap.xml`）になります。別のパスに出力したい場合は第2引数で指定します。

## 実行方法

```bash
# 標準構成の場合（/var/www/WTE/cron で実行）
sh sitemap_cron.sh
# → /var/www/WTE/default/default.ini.cgi を参照し、/var/www/html/sitemap.xml に出力

# または Perl を直接実行（出力先を指定）
perl /var/www/WTE/cron/sitemap_gen.pl /var/www/html/sitemap.xml
```

### デバッグ（サイトマップが空になる場合）

- **標準エラーに失敗理由を出します**。実行時に `2>&1` で stderr も見てください。
- 詳細ログ（取得したURL・リンク数）を出す場合:
  ```bash
  SITEMAP_VERBOSE=1 perl WTE/cron/sitemap_gen.pl 2>&1
  ```
- SSL 証明書エラーで取得できない場合（テスト用。本番では証明書を正しく通すことを推奨）:
  ```bash
  SITEMAP_INSECURE=1 perl WTE/cron/sitemap_gen.pl 2>&1
  ```
- **LWP::Protocol::https が入っていない場合**: スクリプトは自動で **HTTP** で取得します。サイトマップに書くURLは従来どおり **https://www.rocky.wte.jp/...** になります。HTTPS で取得したい場合は次を実行してから使ってください:
  ```bash
  cpan LWP::Protocol::https
  # または（cpanm がある場合）
  cpanm LWP::Protocol::https
  # RedHat/CentOS の場合
  yum install -y perl-LWP-Protocol-https perl-IO-Socket-SSL
  ```

## cron の設定例

毎日 3:00 に実行する場合:

```cron
0 3 * * * /path/to/rocky.wte.jp/WTE/cron/sitemap_cron.sh >> /path/to/rocky.wte.jp/WTE/cron/logs/sitemap.log 2>&1
```

または Perl を直接指定:

```cron
0 3 * * * /usr/bin/perl /path/to/rocky.wte.jp/WTE/cron/sitemap_gen.pl /path/to/rocky.wte.jp/html/sitemap.xml >> /path/to/rocky.wte.jp/WTE/cron/logs/sitemap.log 2>&1
```

- `logs` ディレクトリが無い場合は `mkdir WTE/cron/logs` で作成してください。
- 実行後、`https://www.rocky.wte.jp/sitemap.xml` でアクセスできるようにドキュメントルートに `sitemap.xml` が出力されるパスを指定してください。

## 出力例

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.rocky.wte.jp/</loc>
    <lastmod>2025-02-20</lastmod>
  </url>
  <url>
    <loc>https://www.rocky.wte.jp/wte/prflstfrm</loc>
    <lastmod>2025-02-20</lastmod>
  </url>
  ...
</urlset>
```
