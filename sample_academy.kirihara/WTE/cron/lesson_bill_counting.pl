#!/usr/bin/perl
#############################################################
#レッスンの請求申請自動化
#毎月1日0:00実行
#############################################################
use strict;
use warnings;
BEGIN {
	use DBI;
	use FindBin;
	use lib "$FindBin::Bin/../lib";
	chdir $FindBin::Bin;
	use Config::Tiny;
	use Cache::Memcached::Fast;
	use FCC::Class::DB;
	use FCC::Class::Syscnf;
	use FCC::Class::Date::Utils;
	use FCC::Class::Pdm;
	use FCC::Class::Lesson;
}

#############################################################

&main();

sub main {
	&loging("notice", "started.");
	my $start = time;
	#本スクリプトが現在起動中かどうかをチェック
	&double_execute_check();
	#デフォルト設定をロード
	my $c = &load_conf();
	#memcachedに接続
	my @memcached_servers;
	if( $c->{memcached_servers1} ) {
		push(@memcached_servers, $c->{memcached_servers1});
	}
	if( $c->{memcached_servers2} ) {
		push(@memcached_servers, $c->{memcached_servers2});
	}
	my $memd = new Cache::Memcached::Fast({
		servers => \@memcached_servers,
		ketama_points => 150
	});
	#DB初期化
	my $db = new FCC::Class::DB(conf => $c);
	my $dbh = $db->connect_db();
	#システム設定情報を取得
	my $sc = FCC::Class::Syscnf->new(conf=>$c, db=>$db, memd=>$memd)->get();
	while( my($k, $v) = each %{$sc} ) {
		$c->{$k} = $v;
	}

	my $opdm = new FCC::Class::Pdm(conf=>$c, db=>$db);
	my $olsn = new FCC::Class::Lesson(conf=>$c, db=>$db);
	#講師識別IDのリストを取得
	my $prof_id_list = &get_prof_id_list($c, $dbh);
	#講師ごとに請求申請
	for my $prof_id (@{$prof_id_list}) {
		#請求可能なレッスン情報を検索
		my $in = $opdm->get_demand_target($prof_id);
		unless(@{$in->{lsn_id_list}}) {
			next;
		}
		my $first_lsn_id = $in->{lsn_id_list}->[0];
		my $first_lsn = $olsn->get($first_lsn_id);
		if( ! $first_lsn ) {
			next;
		} elsif( $first_lsn->{pdm_id} ) {
			next;
		}
		#請求申請をセット
		my $pdm = $opdm->add($prof_id, $in);
	}
	#DB切断
	$db->disconnect_db();
	#ロギング
	my $trans_sec = time - $start;
	&loging("notice", "completed.");
	exit;
}

#############################################################
# サブルーチン
#############################################################

sub get_prof_id_list {
	my($c, $dbh) = @_;

	my $sql = "SELECT prof_id FROM profs";
	my $sth = $dbh->prepare($sql);
	$sth->execute();
	my @list;
	while( my $h  = $sth->fetchrow_hashref ) {
		push(@list, $h->{prof_id});
	}
	$sth->finish();
	return \@list;
}

sub double_execute_check {
	my @script_pathes = split(/\//, $0);
	my $script_name = pop @script_pathes;
	my $ps_result_str = `/bin/ps ux`;
	my @lines = split(/\n/, $ps_result_str);
	my $script_num = 0;
	for my $line (@lines) {
		if($line =~ /\Q${script_name}\E$/) {
			$script_num ++;
			if($script_num > 1) {
				my $msg = "this script has already been running.";
				&loging("error", $msg);
				die "$msg\n";
			}
		}
	}
}

sub load_conf {
	my $c = {};
	#デフォルト設定値を取得
	my $ct = Config::Tiny->read("../default/default.ini.cgi") or &error("failed to read deafult configurations file '../default/default.ini.cgi'. : $!");
	while( my($k, $v) = each %{$ct->{default}} ) {
		$c->{$k} = $v;
	}
	#
	return $c;
}

sub get_jst {
	my($epoch, $zero_pad) = @_;
	unless($epoch) {
		$epoch = time;
	}
	my($s, $m, $h, $D, $M, $Y, $w) = gmtime($epoch + 32400);
	$Y += 1900;
	$M ++;
	if($zero_pad) {
		$M = sprintf("%02d", $M);
		$D = sprintf("%02d", $D);
		$h = sprintf("%02d", $h);
		$m = sprintf("%02d", $m);
		$s = sprintf("%02d", $s);
	}
	return $Y, $M, $D, $h, $m, $s, $w;
}

sub loging {
	my($lebel, $msg) = @_;
	$msg =~ s/\n//g;
	#ログ格納ディレクトリ
	my $d = "./logs";
	#スクリプト名
	my($script) = $0 =~ /([^\/]+)$/;
	#現在日時
	my @tm = &get_jst(time, 1);
	my $now = "$tm[0]-$tm[1]-$tm[2] $tm[3]:$tm[4]:$tm[5]";
	#ログファイル
	my $f = "${d}/$tm[0]$tm[1]$tm[2].log";
	open my $fh, ">>", $f or die "faield to open a log file. '${f}' : $@\n";
	print $fh "${now} \[${lebel}\]\[${script}\] ${msg}\n";
	close($fh);
}

sub error {
	my($msg) = @_;
	&loging("error", $msg);
	die "${msg}\n";
}


