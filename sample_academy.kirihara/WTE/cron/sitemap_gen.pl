#!/usr/bin/perl
#############################################################
# XMLサイトマップ自動作成
# ドメイン内のリンクを辿り、ページURLのみを収集してsitemap.xmlを出力する。
# 正規URL・ホストは default.ini.cgi の ssl_host_url から取得（他社環境でも流用可）。
# /WTE/site.cgi?m=XXX は /wte/XXX に正規化（パラメータ1つのみのとき）。
# パラメータは ? 1個 & 1個まで（2パラメータまで）。それ以上は除外。
#############################################################
use strict;
use warnings;
use utf8;
binmode(STDERR, ':utf8');

use FindBin;
use LWP::UserAgent;
use URI;
use URI::QueryParam;

# default.ini.cgi の ssl_host_url からホスト・ベースURLを取得
# パス優先順: SITEMAP_CONFIG(ファイル直接) > WTE_ROOT/default/default.ini.cgi > スクリプト相対(../default/default.ini.cgi)
my ($BASE_HOST, $BASE_URL);
{
	my $conf_path;
	if ($ENV{SITEMAP_CONFIG} && -r $ENV{SITEMAP_CONFIG}) {
		$conf_path = $ENV{SITEMAP_CONFIG};
	} elsif ($ENV{WTE_ROOT} && -r "$ENV{WTE_ROOT}/default/default.ini.cgi") {
		$conf_path = "$ENV{WTE_ROOT}/default/default.ini.cgi";
	} elsif (-r "$FindBin::Bin/../default/default.ini.cgi") {
		$conf_path = "$FindBin::Bin/../default/default.ini.cgi";
	}
	if ($conf_path) {
		eval { require Config::Tiny; };
		if (!$@) {
			my $ct = Config::Tiny->read($conf_path);
			if ($ct && $ct->{default} && $ct->{default}->{ssl_host_url}) {
				my $ssl = $ct->{default}->{ssl_host_url};
				$ssl =~ s{/\s*$}{};  # 末尾スラッシュ除去
				if ($ssl =~ m{^https?://([^/]+)}i) {
					$BASE_HOST = lc($1);
					$BASE_URL  = $ssl . '/';
				}
			}
		}
	}
	if (!defined $BASE_HOST) {
		warn "[sitemap_gen] default.ini.cgi を読み込めません。ssl_host_url の代わりに https://academy.kirihara.co.jp を使用します。\n";
		warn "[sitemap_gen] 別ドメインの場合は環境変数で指定してください:\n";
		warn "[sitemap_gen]   SITEMAP_CONFIG=/絶対パス/default.ini.cgi\n";
		warn "[sitemap_gen]   または WTE_ROOT=/絶対パス/WTE （例: WTE_ROOT=/var/www/html/WTE）\n";
		$BASE_HOST = 'academy.kirihara.co.jp';
		$BASE_URL  = "https://$BASE_HOST/";
	}
}

# HTTPS で取得するために必要（未導入の場合は HTTP で取得し、出力URLは https のまま）
my $HTTPS_AVAILABLE = 0;
eval { require LWP::Protocol::https; $HTTPS_AVAILABLE = 1; };

my $FETCH_URL = $HTTPS_AVAILABLE ? $BASE_URL : $BASE_URL =~ s/^https:/http:/r;  # 取得用（HTTPS 不可時は HTTP）
# 出力先: 引数がなければ ../../html/sitemap.xml（標準構成で /var/www/WTE/cron から実行時は /var/www/html/sitemap.xml）
my $OUTPUT_FILE = (defined $ARGV[0]) ? $ARGV[0] : "$FindBin::Bin/../../html/sitemap.xml";
my $VERBOSE = ($ENV{SITEMAP_VERBOSE} || 0) =~ /^[1y]/i;
my $INSECURE_SSL = ($ENV{SITEMAP_INSECURE} || 0) =~ /^[1y]/i;

# 同一ドメイン判定用（www あり/なしの両方を許容）
my $BASE_HOST_ALT = $BASE_HOST =~ /^www\.(.+)$/ ? $1 : "www.$BASE_HOST";

# サイトマップに含めない拡張子・スキーム
my $SKIP_EXT_RE = qr/\.(?:jpe?g|png|gif|svg|webp|ico|css|js|woff2?|ttf|eot|otf|pdf|mp4|webm|mp3|wav|zip|xml|json)(?:\?|$)/i;
my $SKIP_SCHEME_RE = qr/^(?:javascript|mailto|data|tel|#)/;

# 同一ドメインか（設定ホストと www あり/なしの両方を許容）
sub is_same_domain {
	my ($uri) = @_;
	return 0 unless $uri->scheme =~ /^https?$/;
	my $host = lc($uri->host // '');
	return 1 if $host eq $BASE_HOST || $host eq $BASE_HOST_ALT;
	return 0;
}

# 正規URLに変換（https://www.rocky.wte.jp ベース、site.cgi を /wte/XXX 形式に）
sub canonical_url {
	my ($uri) = @_;
	$uri = URI->new($uri) unless ref $uri;

	my $path = $uri->path || '/';
	$path = '/' . $path if $path !~ m{^/};
	$path =~ s{/+}{/}g;  # 連続スラッシュを1つに
	# ? なしで &utm_* がパスに入っているリンク（例: /wte/toeic&utm_source=...）は & 以降を除去
	$path =~ s/&.*$//;
	my $query = $uri->query;

	# /WTE/mypage.cgi は ?m=XXX のみに正規化（athlinfrm 等、他パラメータはすべて捨てる）
	if ($path =~ m{^/WTE/mypage\.cgi$}i) {
		my $m = $uri->query_param('m');
		return undef unless defined $m && $m =~ /^[a-z0-9]+$/i;
		return "https://$BASE_HOST/WTE/mypage.cgi?m=" . lc($m);
	}

	# /WTE/site.cgi?m=XXX の正規化（utm_* パラメータは除去してから判定）
	if ($path =~ m{^/WTE/site\.cgi$}i) {
		my $m = $uri->query_param('m');
		return undef unless defined $m && $m =~ /^[a-z0-9]+$/i;

		my @q = $uri->query_form;
		my @rest;
		for (my $i = 0; $i < @q; $i += 2) {
			next if $i + 1 >= @q;
			next if $q[$i] eq 'm';
			next if $q[$i] =~ /^utm_/i;
			push @rest, $q[$i], $q[$i+1];
		}
		if (@rest > 2) {
			# m と utm_ 以外のパラメータが2つ以上 → 除外
			return undef;
		}

		if (@rest == 0) {
			return "https://$BASE_HOST/wte/" . lc($m);
		}

		# パラメータ1つ: /wte/XXX?key=val（m 以外の1つのみ残す）
		my $qstr = '';
		if (@rest) {
			my $u = URI->new('http://' . $BASE_HOST . '/');
			$u->query_form(@rest);
			$qstr = defined $u->query ? $u->query : '';
		}
		return "https://$BASE_HOST/wte/" . lc($m) . ($qstr ? "?$qstr" : '');
	}

	# 通常パス: 正規ホスト・スキームに。utm_source, utm_medium, utm_campaign 等の utm_* は除去
	my $norm = "https://$BASE_HOST" . $path;
	if (defined $query && $query ne '') {
		my $u = URI->new('http://' . $BASE_HOST . '/?' . $query);
		my @form = $u->query_form;
		my @keep;
		for (my $i = 0; $i < @form; $i += 2) {
			next if $i + 1 >= @form;
			next if $form[$i] =~ /^utm_/i;
			push @keep, $form[$i], $form[$i+1];
		}
		my $new_q = '';
		if (@keep) {
			my $u2 = URI->new('http://' . $BASE_HOST . '/');
			$u2->query_form(@keep);
			$new_q = $u2->query // '';
		}
		$norm .= '?' . $new_q if $new_q ne '';
	}
	return $norm;
}

# 除外対象か
sub should_skip {
	my ($uri) = @_;
	$uri = URI->new($uri) unless ref $uri;

	my $str = $uri->as_string;
	return 1 if $str =~ $SKIP_SCHEME_RE;
	return 1 if $str =~ /#/ && $str =~ /^[^#]*#(?:[^?]*)$/ && $uri->path eq ''; # 同一ページアンカーのみ
	return 1 if ($uri->path // '') =~ $SKIP_EXT_RE;
	return 1 if ($uri->path // '') =~ m{/blog};  # /blog はプラグインで管理するため除外
	return 0;
}

# inqfrmshw のみシステム都合で /WTE/site.cgi?m=inqfrmshw 形式で出力する
sub sitemap_output_url {
	my ($canonical) = @_;
	my $host_esc = quotemeta($BASE_HOST);
	if ($canonical =~ m{^https://${host_esc}/wte/inqfrmshw(?:\?(.*))?$}i) {
		my $q = (defined $1 && $1 ne '') ? "&$1" : '';
		return "https://$BASE_HOST/WTE/site.cgi?m=inqfrmshw$q";
	}
	return $canonical;
}

# サイトマップ用 priority（0.0〜1.0）
sub priority_for_url {
	my ($url) = @_;
	$url = URI->new($url) unless ref $url;
	my $path = $url->path || '/';
	$path = '/' . $path if $path !~ m{^/};
	$path =~ s{/+}{/}g;

	return '1.0'   if $path eq '/';
	return '0.9'   if $path =~ m{^/wte/(?:about|plan|lesson)(?:/|$)}i;
	return '0.8'   if $path =~ m{^/WTE/[^/]*\.cgi}i;
	return '0.6';
}

# HTML から href を抽出（<a> タグ内の href を複数パターンで取得）
sub extract_links {
	my ($html, $base_uri) = @_;
	my @links;
	# パターン1: <a ... href="..." ...>
	while ($html =~ m/<a\s[^>]*\bhref\s*=\s*["']([^"']+)["']/gi) {
		push @links, _decode_href($1);
	}
	# パターン2: 属性の順序が href が先など（上で拾えない場合の補助）
	while ($html =~ m/\bhref\s*=\s*["']([^"']+)["']/gi) {
		push @links, _decode_href($1);
	}
	# 重複除去
	my %seen;
	@links = grep { !$seen{$_}++ } @links;
	# 相対パスを絶対URLに
	my @abs;
	for my $href (@links) {
		next if $href =~ $SKIP_SCHEME_RE;
		eval {
			my $u = URI->new_abs($href, $base_uri);
			push @abs, $u if $u->scheme && $u->host;
		};
	}
	return @abs;
}

sub _decode_href {
	my ($s) = @_;
	$s =~ s/&#x27;/'/g;
	$s =~ s/&#39;/'/g;
	$s =~ s/&amp;/&/g;
	return $s;
}

sub main {
	my $ua = LWP::UserAgent->new(
		agent => 'Mozilla/5.0 (compatible; WTE-SitemapGen/1.0)',
		timeout => 15,
		ssl_opts => $INSECURE_SSL ? { verify_hostname => 0 } : { verify_hostname => 1 },
	);
	$ua->env_proxy;

	if (!$HTTPS_AVAILABLE) {
		warn "[sitemap_gen] LWP::Protocol::https not installed. Fetching via HTTP (sitemap URLs will still be https://).\n";
		warn "[sitemap_gen] To use HTTPS, run: cpan LWP::Protocol::https\n";
	}

	my %visited;
	my %canonical;  # 正規URLの集合（重複排除）
	my @queue = ($BASE_URL);   # キューは常に正規(https)URL
	my $fetch_count = 0;

	while (@queue) {
		my $url = shift @queue;
		$url = $url->as_string if ref $url;

		# 既に取得済み（正規URLで判定）
		next if $visited{$url}++;

		# 取得用URL（HTTPS 未対応時は http に差し替え）
		my $fetch_url = $url;
		$fetch_url =~ s/^https:/http:/ if !$HTTPS_AVAILABLE;

		$fetch_count++;
		my $res = $ua->get($fetch_url);

		unless ($res->is_success) {
			warn "[sitemap_gen] GET failed: $url => ", $res->code, " ", $res->message, "\n";
			next;
		}

		my $ct = $res->content_type || '';
		unless ($ct =~ m{text/html}i) {
			warn "[sitemap_gen] Skip (not HTML): $url Content-Type: $ct\n" if $VERBOSE;
			next;
		}

		# リダイレクト後の最終URLを基準にする
		my $base = $res->base;
		$base = $res->request->uri unless $base;
		if (ref($base)) { $base = $base->as_string }
		$base = URI->new($base);

		# このページの正規URLを追加
		my $canon = canonical_url($base);
		if (defined $canon && !should_skip(URI->new($canon))) {
			$canonical{$canon} = 1;
		}

		# リンクを抽出してキューに追加（正規URLで重複排除）
		# サイトマップには「実際に取得できた(200)URLのみ」追加するため、ここではキューに積むだけ
		my @links = extract_links($res->content, $base);
		my $same_domain = 0;
		for my $link (@links) {
			next unless is_same_domain($link);
			next if should_skip($link);

			my $c = canonical_url($link);
			if (defined $c) {
				$same_domain++;
				push @queue, $c unless $visited{$c};
			}
		}

		warn "[sitemap_gen] OK $url => ", scalar(@links), " links, $same_domain same-domain\n" if $VERBOSE;

		# ポリトネス: 少し待つ
		select undef, undef, undef, 0.3;
	}

	warn "[sitemap_gen] Fetched $fetch_count page(s), collected ", scalar keys %canonical, " URL(s)\n" if $VERBOSE || keys(%canonical) == 0;

	# 出力
	my $today = do {
		my ($sec, $min, $hour, $mday, $mon, $year) = localtime;
		sprintf("%04d-%02d-%02d", $year + 1900, $mon + 1, $mday);
	};

	my $out_dir = $OUTPUT_FILE;
	$out_dir =~ s{[^/\\]+$}{};
	if ($out_dir ne '' && !-d $out_dir) {
		require File::Path;
		File::Path::make_path($out_dir, { verbose => 0, mode => 0755 }) or die "Cannot create directory $out_dir: $!";
	}
	open my $fh, '>:utf8', $OUTPUT_FILE or die "Cannot write $OUTPUT_FILE: $!";
	print $fh '<?xml version="1.0" encoding="UTF-8"?>', "\n";
	print $fh '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">', "\n";

	for my $loc (sort keys %canonical) {
		my $out_loc = sitemap_output_url($loc);
		my $loc_escaped = $out_loc;
		$loc_escaped =~ s/&/&amp;/g;
		my $pri = priority_for_url($out_loc);
		print $fh "  <url>\n";
		print $fh "    <loc>$loc_escaped</loc>\n";
		print $fh "    <lastmod>$today</lastmod>\n";
		print $fh "    <priority>$pri</priority>\n";
		print $fh "  </url>\n";
	}

	print $fh '</urlset>', "\n";
	close $fh;

	print STDERR "Sitemap written: $OUTPUT_FILE (", scalar keys %canonical, " URLs)\n";
}

main();
