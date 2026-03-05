#!/usr/bin/perl
######################################################################
# OAuth 2.0 認可エンドポイント
# GET: ログイン画面表示 / POST: 認可承認
######################################################################
use strict;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/../lib";
use CGI;
use OAuth::Common;

binmode(STDOUT, ':utf8');

my $q = CGI->new;
my $c = OAuth::Common::load_config();
my $dbh = OAuth::Common::connect_db($c);

if ($q->request_method eq 'GET') {
    # 認可画面表示
    my $client_id     = $q->param('client_id')     || '';
    my $redirect_uri   = $q->param('redirect_uri') || '';
    my $scope         = $q->param('scope')         || 'openid email profile';
    my $state         = $q->param('state')         || '';
    my $response_type = $q->param('response_type') || '';
    my $code_challenge = $q->param('code_challenge') || '';
    my $code_challenge_method = $q->param('code_challenge_method') || '';

    if (!$client_id || !$redirect_uri || $response_type ne 'code') {
        print $q->header(-type => 'text/html; charset=utf-8');
        print error_html('client_id, redirect_uri, response_type=code は必須です。');
        exit;
    }

    my $client = OAuth::Common::get_client($dbh, $client_id);
    if (!$client || !OAuth::Common::validate_redirect_uri($client, $redirect_uri)) {
        print $q->header(-type => 'text/html; charset=utf-8');
        print error_html('無効なクライアントまたは redirect_uri です。');
        exit;
    }

    my $client_name = OAuth::Common::h($client->{client_name} || $client_id);

    print $q->header(-type => 'text/html; charset=utf-8');
    print <<"HTML";
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Kirihara Academy でログイン</title></head>
<body style="font-family: sans-serif; max-width: 400px; margin: 2rem auto; padding: 1rem;">
  <h1>Kirihara Academy でログイン</h1>
  <p>${client_name} にログインします。</p>
  <form method="post" action="">
    <input type="hidden" name="client_id" value="@{[ OAuth::Common::h($client_id) ]}" />
    <input type="hidden" name="redirect_uri" value="@{[ OAuth::Common::h($redirect_uri) ]}" />
    <input type="hidden" name="scope" value="@{[ OAuth::Common::h($scope) ]}" />
    <input type="hidden" name="state" value="@{[ OAuth::Common::h($state) ]}" />
    <input type="hidden" name="code_challenge" value="@{[ OAuth::Common::h($code_challenge) ]}" />
    <input type="hidden" name="code_challenge_method" value="@{[ OAuth::Common::h($code_challenge_method) ]}" />
    <div style="margin-bottom: 1rem;">
      <label>メールアドレス</label><br>
      <input type="email" name="email" required style="width: 100%; padding: 0.5rem;" />
    </div>
    <div style="margin-bottom: 1rem;">
      <label>パスワード</label><br>
      <input type="password" name="password" required style="width: 100%; padding: 0.5rem;" />
    </div>
    <button type="submit" style="padding: 0.5rem 1rem; background: #009DC9; color: white; border: none; border-radius: 4px;">
      ログイン
    </button>
  </form>
</body>
</html>
HTML

} else {
    # 認可承認（POST）
    my $client_id   = $q->param('client_id')   || '';
    my $redirect_uri = $q->param('redirect_uri') || '';
    my $scope       = $q->param('scope')       || 'openid email profile';
    my $state       = $q->param('state')       || '';
    my $email       = $q->param('email')       || '';
    my $password    = $q->param('password')    || '';
    my $code_challenge = $q->param('code_challenge') || '';
    my $code_challenge_method = $q->param('code_challenge_method') || '';

    if (!$client_id || !$redirect_uri || !$email || !$password) {
        redirect_error($redirect_uri, $state, 'invalid_request', 'missing_params');
        exit;
    }

    my $client = OAuth::Common::get_client($dbh, $client_id);
    if (!$client || !OAuth::Common::validate_redirect_uri($client, $redirect_uri)) {
        redirect_error($redirect_uri, $state, 'invalid_client', '');
        exit;
    }

    my $member = OAuth::Common::get_member_by_email($dbh, $email);
    if (!$member || $member->{member_status} != 1) {
        print $q->header(-type => 'text/html; charset=utf-8');
        print login_failed_html($client_id, $redirect_uri, $scope, $state);
        exit;
    }

    unless (OAuth::Common::validate_password($password, $member->{member_pass})) {
        print $q->header(-type => 'text/html; charset=utf-8');
        print login_failed_html($client_id, $redirect_uri, $scope, $state);
        exit;
    }

    my $code = OAuth::Common::generate_code();
    OAuth::Common::save_auth_code($dbh, $code, $client_id, $redirect_uri,
        $member->{member_id}, $scope, $code_challenge, $code_challenge_method);

    my $sep = $redirect_uri =~ /\?/ ? '&' : '?';
    my $loc = $redirect_uri . $sep . 'code=' . $q->escape($code) . '&state=' . $q->escape($state);
    print $q->redirect(-uri => $loc, -status => 302);
}

$dbh->disconnect();

#----------------------------------------------------------------------
sub error_html {
    my ($msg) = @_;
    return "<!DOCTYPE html><html><body><h1>認可エラー</h1><p>$msg</p></body></html>";
}

sub redirect_error {
    my ($redirect_uri, $state, $error, $desc) = @_;
    my $q = CGI->new;
    my $sep = $redirect_uri =~ /\?/ ? '&' : '?';
    my $loc = $redirect_uri . $sep . 'error=' . $error;
    $loc .= '&error_description=' . $q->escape($desc) if $desc;
    $loc .= '&state=' . $q->escape($state) if $state;
    print $q->redirect(-uri => $loc, -status => 302);
}

sub login_failed_html {
    my ($client_id, $redirect_uri, $scope, $state) = @_;
    my $q = CGI->new;
    my $c = OAuth::Common::load_config();
    my $retry = $c->{oauth_base_path} . '/oauth_authorize.pl?client_id=' . $q->escape($client_id)
        . '&redirect_uri=' . $q->escape($redirect_uri)
        . '&scope=' . $q->escape($scope)
        . '&state=' . $q->escape($state)
        . '&response_type=code';
    return <<"HTML";
<!DOCTYPE html>
<html><body>
  <h1>ログイン失敗</h1>
  <p>メールアドレスまたはパスワードが正しくありません。</p>
  <a href="$retry">戻る</a>
</body></html>
HTML
}
