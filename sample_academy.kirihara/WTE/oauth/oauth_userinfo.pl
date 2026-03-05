#!/usr/bin/perl
######################################################################
# OpenID Connect UserInfo エンドポイント
# GET: Authorization: Bearer <access_token> でユーザー情報を返す
######################################################################
use strict;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/../lib";
use CGI;
use OAuth::Common;
use JSON qw(encode_json decode_json);

binmode(STDOUT, ':utf8');

my $q = CGI->new;
my $c = OAuth::Common::load_config();
my $dbh = OAuth::Common::connect_db($c);

my $auth_header = $q->http('Authorization') || $q->http('HTTP_AUTHORIZATION') || '';
if ($auth_header !~ /^Bearer\s+(.+)$/i) {
    json_error(401, 'invalid_request', 'Authorization: Bearer <token> が必要です');
}

my $token = $1;
my $payload = verify_jwt($c, $token);
if (!$payload) {
    json_error(401, 'invalid_token', 'トークンが無効です');
}

my $member_id = $payload->{sub};
my $member = OAuth::Common::get_member_by_id($dbh, $member_id);
if (!$member) {
    json_error(401, 'invalid_token', 'ユーザーが見つかりません');
}

my $name = $member->{member_handle};
if (!$name || $name eq '') {
    $name = ($member->{member_lastname} || '') . ($member->{member_firstname} || '');
}

my $userinfo = {
    sub            => $member->{member_id},
    email          => $member->{member_email},
    email_verified => 1,
};
$userinfo->{name} = $name if $name;
$userinfo->{preferred_username} = $name if $name;

$dbh->disconnect();

print $q->header(
    -type         => 'application/json; charset=utf-8',
    -Cache_Control => 'no-store',
);
print encode_json($userinfo);

#----------------------------------------------------------------------
sub verify_jwt {
    my ($c, $token) = @_;
    return undef unless $token;
    my @parts = split(/\./, $token);
    return undef unless @parts == 3;

    my $payload_b64 = $parts[1];
    $payload_b64 =~ tr/-_/+/;
    my $padding = 4 - (length($payload_b64) % 4);
    $payload_b64 .= '=' x $padding if $padding < 4;
    require MIME::Base64;
    my $payload_json = MIME::Base64::decode_base64($payload_b64);
    return undef unless $payload_json;

    my $payload = decode_json($payload_json);
    return undef unless $payload && $payload->{exp};

    if ($payload->{exp} < time) {
        return undef;
    }

    # HS256 の場合は署名検証（簡易）
    my $key = $c->{oauth_jwt_secret} || $c->{pwdrst_secret_key} || 'change-me-in-production';
    my $header_b64 = $parts[0];
    $header_b64 =~ tr/-_/+/;
    my $p2 = 4 - (length($header_b64) % 4);
    $header_b64 .= '=' x $p2 if $p2 < 4;
    my $sig_input = $parts[0] . '.' . $parts[1];
    require Digest::SHA;
    my $sig = Digest::SHA::hmac_sha256($sig_input, $key);
    my $sig_b64 = OAuth::Common::base64url_encode($sig);
    return undef unless $sig_b64 eq $parts[2];

    return $payload;
}

sub json_error {
    my ($status, $error, $desc) = @_;
    my $q = CGI->new;
    print $q->header(
        -type          => 'application/json; charset=utf-8',
        -status        => $status,
        -Cache_Control => 'no-store',
        -WWW_Authenticate => "Bearer error=\"$error\"",
    );
    print encode_json({ error => $error, error_description => $desc });
    $dbh->disconnect();
    exit;
}
