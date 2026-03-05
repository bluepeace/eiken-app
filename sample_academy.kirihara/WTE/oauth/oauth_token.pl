#!/usr/bin/perl
######################################################################
# OAuth 2.0 トークンエンドポイント
# POST: 認可コードをアクセストークンに交換
######################################################################
use strict;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/../lib";
use CGI;
use OAuth::Common;
use JSON qw(encode_json decode_json);

my $q = CGI->new;
my $c = OAuth::Common::load_config();
my $dbh = OAuth::Common::connect_db($c);

# POST パラメータ取得（application/x-www-form-urlencoded）
# OAuth 2.0 トークンエンドポイントは通常 form-urlencoded で送信
my %params = $q->Vars;

my $grant_type    = $params{grant_type}    || '';
my $code          = $params{code}          || '';
my $redirect_uri  = $params{redirect_uri}  || '';
my $client_id     = $params{client_id}     || $q->http('X-Client-Id');
my $client_secret = $params{client_secret} || $q->http('X-Client-Secret');
my $code_verifier = $params{code_verifier}  || '';

if ($grant_type ne 'authorization_code') {
    json_error(400, 'unsupported_grant_type', 'authorization_code のみサポート');
}

if (!$code || !$redirect_uri || !$client_id || !$client_secret) {
    json_error(400, 'invalid_request', 'code, redirect_uri, client_id, client_secret は必須です');
}

my $client = OAuth::Common::get_client($dbh, $client_id);
if (!$client || $client->{client_secret} ne $client_secret) {
    json_error(401, 'invalid_client', 'クライアント認証に失敗しました');
}

my $auth_code = OAuth::Common::consume_auth_code($dbh, $code);
if (!$auth_code) {
    json_error(400, 'invalid_grant', '認可コードが無効または期限切れです');
}

if ($auth_code->{client_id} ne $client_id || $auth_code->{redirect_uri} ne $redirect_uri) {
    json_error(400, 'invalid_grant', 'redirect_uri が一致しません');
}

if ($auth_code->{code_challenge} && !OAuth::Common::verify_pkce($code_verifier, $auth_code->{code_challenge}, $auth_code->{code_challenge_method})) {
    json_error(400, 'invalid_grant', 'code_verifier が一致しません');
}

my $member = OAuth::Common::get_member_by_id($dbh, $auth_code->{member_id});
if (!$member) {
    json_error(400, 'invalid_grant', 'ユーザーが見つかりません');
}

# JWT 発行（Crypt::JWT 使用）
my $access_token = build_jwt($c, $member, $client_id, $auth_code->{scope}, 'access');
my $id_token;
if ($auth_code->{scope} =~ /openid/) {
    $id_token = build_jwt($c, $member, $client_id, $auth_code->{scope}, 'id');
}

my $expires_in = 3600;
my $res = {
    access_token => $access_token,
    token_type   => 'Bearer',
    expires_in   => $expires_in,
    scope        => $auth_code->{scope},
};
$res->{id_token} = $id_token if $id_token;

$dbh->disconnect();

print $q->header(
    -type            => 'application/json; charset=utf-8',
    -Cache_Control    => 'no-store',
    -Pragma          => 'no-cache',
);
print encode_json($res);

#----------------------------------------------------------------------
sub build_jwt {
    my ($c, $member, $client_id, $scope, $type) = @_;
    my $iss = $c->{oauth_issuer};
    my $now = time;
    my $exp = $now + 3600;

    my $name = $member->{member_handle};
    if (!$name || $name eq '') {
        $name = ($member->{member_lastname} || '') . ($member->{member_firstname} || '');
    }

    my $payload = {
        sub   => $member->{member_id},
        iss   => $iss,
        aud   => $client_id,
        iat   => $now,
        exp   => $exp,
    };

    if ($type eq 'access') {
        $payload->{email} = $member->{member_email};
        $payload->{scope} = $scope;
        $payload->{client_id} = $client_id;
    } else {
        $payload->{email} = $member->{member_email};
        $payload->{name}  = $name if $name;
    }

    return sign_jwt($c, $payload);
}

sub sign_jwt {
    my ($c, $payload) = @_;
    eval { require Crypt::JWT; };
    if ($@) {
        # Crypt::JWT がなければ簡易実装（HS256）でフォールバック
        return sign_jwt_fallback($c, $payload);
    }
    my $key = $c->{oauth_jwt_secret} || $c->{pwdrst_secret_key} || 'change-me-in-production';
    my $private_key = $c->{oauth_jwt_private_key};
    if ($private_key) {
        return Crypt::JWT::encode_jwt(
            payload => $payload,
            key     => $private_key,
            alg     => 'RS256',
            kid     => 'kirihara-idp-1',
        );
    }
    return Crypt::JWT::encode_jwt(
        payload => $payload,
        key     => $key,
        alg     => 'HS256',
    );
}

# Crypt::JWT がない場合の簡易 HS256 フォールバック
sub sign_jwt_fallback {
    my ($c, $payload) = @_;
    require Digest::SHA;
    require MIME::Base64;
    my $key = $c->{oauth_jwt_secret} || $c->{pwdrst_secret_key} || 'change-me-in-production';
    my $header = { alg => 'HS256', typ => 'JWT' };
    my $header_b64 = OAuth::Common::base64url_encode(encode_json($header));
    my $payload_b64 = OAuth::Common::base64url_encode(encode_json($payload));
    my $sig_input = $header_b64 . '.' . $payload_b64;
    my $sig = Digest::SHA::hmac_sha256($sig_input, $key);
    my $sig_b64 = OAuth::Common::base64url_encode($sig);
    return $sig_input . '.' . $sig_b64;
}

sub json_error {
    my ($status, $error, $desc) = @_;
    my $q = CGI->new;
    print $q->header(
        -type         => 'application/json; charset=utf-8',
        -status       => $status,
        -Cache_Control => 'no-store',
    );
    print encode_json({ error => $error, error_description => $desc });
    $dbh->disconnect();
    exit;
}
