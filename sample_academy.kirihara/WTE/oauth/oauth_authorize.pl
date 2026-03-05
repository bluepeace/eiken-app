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

    print $q->header(-type => 'text/html; charset=utf-8');
    print <<"HTML";
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Kirihara Academy でログイン</title>
  <style>
    * { box-sizing: border-box; }
    body {
      font-family: "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif;
      background: #f5f7fa;
      margin: 0;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 1.5rem;
    }
    .oauth-card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 4px 24px rgba(0,0,0,0.08);
      max-width: 400px;
      width: 100%;
      padding: 2.5rem 2rem;
    }
    .oauth-logo {
      display: block;
      height: 48px;
      width: auto;
      margin: 0 auto 1.5rem;
    }
    .oauth-title {
      font-size: 1.25rem;
      font-weight: 600;
      color: #231916;
      margin: 0 0 0.5rem;
      text-align: center;
    }
    .oauth-subtitle {
      font-size: 0.875rem;
      color: #6b7280;
      margin: 0 0 1.75rem;
      text-align: center;
      line-height: 1.5;
    }
    .oauth-form label {
      display: block;
      font-size: 0.875rem;
      font-weight: 500;
      color: #374151;
      margin-bottom: 0.375rem;
    }
    .oauth-form input {
      width: 100%;
      padding: 0.75rem 1rem;
      font-size: 1rem;
      border: 1px solid #d1d5db;
      border-radius: 8px;
      margin-bottom: 1.25rem;
      transition: border-color 0.2s;
    }
    .oauth-form input:focus {
      outline: none;
      border-color: #00ada9;
      box-shadow: 0 0 0 3px rgba(0,173,169,0.15);
    }
    .oauth-form button {
      width: 100%;
      padding: 0.875rem 1.5rem;
      font-size: 1rem;
      font-weight: 600;
      color: #fff;
      background: #00ada9;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.2s;
    }
    .oauth-form button:hover {
      background: #009a96;
    }
    .oauth-form button:active {
      background: #008785;
    }
  </style>
</head>
<body>
  <div class="oauth-card">
    <img src="/assets/img/common/logo.svg" alt="KIRIHARA Online Academy" class="oauth-logo">
    <h1 class="oauth-title">英検アプリにログインします。</h1>
    <p class="oauth-subtitle">KIRIHARA Online Academyのアカウントを入力ください</p>
    <form method="post" action="" class="oauth-form">
    <input type="hidden" name="client_id" value="@{[ OAuth::Common::h($client_id) ]}" />
    <input type="hidden" name="redirect_uri" value="@{[ OAuth::Common::h($redirect_uri) ]}" />
    <input type="hidden" name="scope" value="@{[ OAuth::Common::h($scope) ]}" />
    <input type="hidden" name="state" value="@{[ OAuth::Common::h($state) ]}" />
    <input type="hidden" name="code_challenge" value="@{[ OAuth::Common::h($code_challenge) ]}" />
    <input type="hidden" name="code_challenge_method" value="@{[ OAuth::Common::h($code_challenge_method) ]}" />
    <label for="email">メールアドレス</label>
    <input type="email" id="email" name="email" required placeholder="example\@example.com" />
    <label for="password">パスワード</label>
    <input type="password" id="password" name="password" required placeholder="パスワード" />
    <button type="submit">ログイン</button>
    </form>
  </div>
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
    $msg = OAuth::Common::h($msg);
    return <<"HTML";
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>認可エラー</title>
  <style>
    * { box-sizing: border-box; }
    body { font-family: "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif; background: #f5f7fa; margin: 0; min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 1.5rem; }
    .oauth-card { background: #fff; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); max-width: 400px; width: 100%; padding: 2.5rem 2rem; text-align: center; }
    .oauth-logo { display: block; height: 48px; width: auto; margin: 0 auto 1.5rem; }
    .oauth-title { font-size: 1.25rem; font-weight: 600; color: #dc2626; margin: 0 0 0.5rem; }
    .oauth-msg { font-size: 0.9375rem; color: #6b7280; margin: 0; line-height: 1.6; }
  </style>
</head>
<body>
  <div class="oauth-card">
    <img src="/assets/img/common/logo.svg" alt="KIRIHARA Online Academy" class="oauth-logo">
    <h1 class="oauth-title">認可エラー</h1>
    <p class="oauth-msg">$msg</p>
  </div>
</body>
</html>
HTML
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
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ログイン失敗</title>
  <style>
    * { box-sizing: border-box; }
    body { font-family: "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif; background: #f5f7fa; margin: 0; min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 1.5rem; }
    .oauth-card { background: #fff; border-radius: 12px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); max-width: 400px; width: 100%; padding: 2.5rem 2rem; text-align: center; }
    .oauth-logo { display: block; height: 48px; width: auto; margin: 0 auto 1.5rem; }
    .oauth-title { font-size: 1.25rem; font-weight: 600; color: #231916; margin: 0 0 0.5rem; }
    .oauth-msg { font-size: 0.9375rem; color: #6b7280; margin: 0 0 1.5rem; line-height: 1.6; }
    .oauth-btn { display: inline-block; padding: 0.75rem 1.5rem; font-size: 0.9375rem; font-weight: 600; color: #fff; background: #00ada9; border-radius: 8px; text-decoration: none; transition: background 0.2s; }
    .oauth-btn:hover { background: #009a96; }
  </style>
</head>
<body>
  <div class="oauth-card">
    <img src="/assets/img/common/logo.svg" alt="KIRIHARA Online Academy" class="oauth-logo">
    <h1 class="oauth-title">ログイン失敗</h1>
    <p class="oauth-msg">メールアドレスまたはパスワードが正しくありません。</p>
    <a href="$retry" class="oauth-btn">戻る</a>
  </div>
</body>
</html>
HTML
}
