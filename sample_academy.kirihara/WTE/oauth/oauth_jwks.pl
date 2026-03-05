#!/usr/bin/perl
######################################################################
# JSON Web Key Set (JWKS) エンドポイント
# GET /.well-known/jwks.json
# HS256 使用時は空の keys 配列を返す（公開鍵不要）
# RS256 使用時は oauth_jwt_public_key を JWK 形式で返す
######################################################################
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use CGI;
use OAuth::Common;
use JSON qw(encode_json);

my $q = CGI->new;
my $c = OAuth::Common::load_config();

my $keys = [];

# RS256 用の公開鍵が設定されている場合
if ($c->{oauth_jwt_public_key}) {
    # PEM 形式の公開鍵を JWK に変換（Crypt::OpenSSL::RSA 等が必要）
    # 簡易実装: 設定で JWK を直接指定する場合
    if ($c->{oauth_jwk}) {
        $keys = [ $c->{oauth_jwk} ];
    }
}

# HS256 の場合は keys は空でよい（クライアントは client_secret で検証）
# Supabase サードパーティ認証で RS256 が必要な場合は、別途 RS256 鍵を設定すること

print $q->header(
    -type          => 'application/json; charset=utf-8',
    -Cache_Control => 'public, max-age=3600',
);
print encode_json({ keys => $keys });
