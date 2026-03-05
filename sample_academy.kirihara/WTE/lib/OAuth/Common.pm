package OAuth::Common;
use strict;
use warnings;
use FindBin;
use Config::Tiny;
use DBI;
use Digest::SHA qw(sha256 sha256_hex);
use MIME::Base64 qw(encode_base64);
use JSON qw(encode_json decode_json);

our $VERSION = 1.00;

#----------------------------------------------------------------------
# 設定読み込み
#----------------------------------------------------------------------
sub load_config {
    my $base_dir = $FindBin::Bin;
    $base_dir =~ s/\/oauth$//;
    my $ct = Config::Tiny->read("$base_dir/default/default.ini.cgi")
        or die "failed to read config: $!";
    my $c = { %{ $ct->{default} } };
    if ($ct->{oauth}) {
        while (my ($k, $v) = each %{ $ct->{oauth} }) {
            $c->{"oauth_$k"} = $v;
        }
    }
    $c->{BASE_DIR} = $base_dir;
    $c->{oauth_issuer} ||= $c->{ssl_host_url} || $c->{www_host_url} || 'https://academy.kirihara.co.jp';
    $c->{oauth_issuer} =~ s/\/$//;
    $c->{oauth_base_path} ||= $c->{oauth_issuer} . '/WTE/oauth';
    return $c;
}

#----------------------------------------------------------------------
# DB接続
#----------------------------------------------------------------------
sub connect_db {
    my ($c) = @_;
    my $dsn = "dbi:mysql:database=$c->{db_name};host=$c->{db_host}";
    $dsn .= ";port=$c->{db_port}" if $c->{db_port};
    my $dbh = DBI->connect($dsn, $c->{db_user}, $c->{db_pass},
        { RaiseError => 1, AutoCommit => 1 })
        or die "DB connect failed: $DBI::errstr";
    return $dbh;
}

#----------------------------------------------------------------------
# クライアント取得
#----------------------------------------------------------------------
sub get_client {
    my ($dbh, $client_id) = @_;
    my $sth = $dbh->prepare("SELECT client_id, client_secret, redirect_uris, client_name FROM oauth_clients WHERE client_id = ?");
    $sth->execute($client_id);
    my $row = $sth->fetchrow_hashref;
    $sth->finish;
    return $row;
}

#----------------------------------------------------------------------
# redirect_uri 検証
#----------------------------------------------------------------------
sub validate_redirect_uri {
    my ($client, $redirect_uri) = @_;
    return 0 unless $client && $redirect_uri;
    my @uris = split(/\r?\n/, $client->{redirect_uris} || '');
    for my $uri (@uris) {
        $uri =~ s/^\s+|\s+$//g;
        return 1 if $uri eq $redirect_uri;
        return 1 if $redirect_uri =~ /^\Q$uri\E\?/;
    }
    return 0;
}

#----------------------------------------------------------------------
# 認可コード保存
#----------------------------------------------------------------------
sub save_auth_code {
    my ($dbh, $code, $client_id, $redirect_uri, $member_id, $scope, $code_challenge, $code_challenge_method) = @_;
    my $now = time;
    my $expires = $now + 600;  # 10分
    my $sth = $dbh->prepare("INSERT INTO oauth_auth_codes (code, client_id, redirect_uri, member_id, scope, code_challenge, code_challenge_method, expires_at, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $sth->execute($code, $client_id, $redirect_uri, $member_id, $scope || 'openid email profile', $code_challenge, $code_challenge_method, $expires, $now);
    $sth->finish;
}

#----------------------------------------------------------------------
# 認可コード取得・消費
#----------------------------------------------------------------------
sub consume_auth_code {
    my ($dbh, $code) = @_;
    my $sth = $dbh->prepare("SELECT code, client_id, redirect_uri, member_id, scope, code_challenge, code_challenge_method FROM oauth_auth_codes WHERE code = ? AND expires_at > UNIX_TIMESTAMP()");
    $sth->execute($code);
    my $row = $sth->fetchrow_hashref;
    $sth->finish;
    return undef unless $row;
    $sth = $dbh->prepare("DELETE FROM oauth_auth_codes WHERE code = ?");
    $sth->execute($code);
    $sth->finish;
    return $row;
}

#----------------------------------------------------------------------
# 会員取得（メール）
#----------------------------------------------------------------------
sub get_member_by_email {
    my ($dbh, $email) = @_;
    my $sth = $dbh->prepare("SELECT member_id, member_email, member_pass, member_lastname, member_firstname, member_handle, member_status FROM members WHERE member_email = ?");
    $sth->execute($email);
    my $row = $sth->fetchrow_hashref;
    $sth->finish;
    return $row;
}

#----------------------------------------------------------------------
# 会員取得（ID）
#----------------------------------------------------------------------
sub get_member_by_id {
    my ($dbh, $member_id) = @_;
    my $sth = $dbh->prepare("SELECT member_id, member_email, member_lastname, member_firstname, member_handle FROM members WHERE member_id = ? AND member_status = 1");
    $sth->execute($member_id);
    my $row = $sth->fetchrow_hashref;
    $sth->finish;
    return $row;
}

#----------------------------------------------------------------------
# パスワード検証（FCC::Class::PasswdHash 互換）
#----------------------------------------------------------------------
sub validate_password {
    my ($plain, $hash) = @_;
    return 0 unless $plain && $hash;
    require FCC::Class::PasswdHash;
    return FCC::Class::PasswdHash->new()->validate($plain, $hash);
}

#----------------------------------------------------------------------
# ランダムコード生成
#----------------------------------------------------------------------
sub generate_code {
    my $bytes = '';
    for (1..32) {
        $bytes .= chr(int(rand(256)));
    }
    my $b64 = encode_base64($bytes, '');
    $b64 =~ tr/+\//-_/;
    $b64 =~ s/=+$//;
    return $b64;
}

#----------------------------------------------------------------------
# base64url エンコード
#----------------------------------------------------------------------
sub base64url_encode {
    my ($data) = @_;
    my $b64 = encode_base64($data, '');
    $b64 =~ tr/+\//-_/;
    $b64 =~ s/=+$//;
    return $b64;
}

#----------------------------------------------------------------------
# PKCE 検証
#----------------------------------------------------------------------
sub verify_pkce {
    my ($code_verifier, $code_challenge, $method) = @_;
    return 1 unless $code_challenge;
    return 0 unless $code_verifier;
    my $expected;
    if (($method || '') eq 'S256') {
        my $digest = sha256($code_verifier);
        $expected = base64url_encode($digest);
    } else {
        $expected = $code_verifier;
    }
    return $code_challenge eq $expected;
}

#----------------------------------------------------------------------
# HTML エスケープ
#----------------------------------------------------------------------
sub h {
    my ($s) = @_;
    return '' unless defined $s;
    $s =~ s/&/&amp;/g;
    $s =~ s/</&lt;/g;
    $s =~ s/>/&gt;/g;
    $s =~ s/"/&quot;/g;
    return $s;
}

1;
