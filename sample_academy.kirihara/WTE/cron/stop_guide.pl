#!/usr/bin/perl
#############################################################
#レッスンを2ヶ月やっていない講師を非表示にする
#daily or hourly
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
	use FCC::Class::Lesson;
	use FCC::Class::Cpnact;
	use FCC::Class::Prof;
}

#############################################################

&main();

sub main {

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

	#有効な講師を取得
	my $valid_prof_list = &get_valid_prof_list($c, $dbh);
	for my $prof (@{$valid_prof_list}) {

		#直近のレッスンを取得
		my $prof_id = $prof->{prof_id};
		my $valid_term_lesson_list = &get_valid_term_lesson_list($c, $dbh, $prof_id);

		#直近にレッスンがあれば対象外
		if(@{$valid_term_lesson_list} > 0) {
			#print "Skip prof because having lessons before 2 weeks. prof_id:${prof_id}\n";
			next;
		}

		#講師・ステータスをアップデート
		my $oprf = new FCC::Class::Prof(conf=>$c, db=>$db);
		my $rec = {
			prof_id           => $prof_id,
			prof_status       => 0
		};
		my $uprof = $oprf->mod($rec);
		&loging("notice", "prof_status is updated. prof_id:${prof_id}");

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

#-----------------------------------------------------------
# 有効な講師のリスト
#-----------------------------------------------------------
sub get_valid_prof_list {
	my($c, $dbh) = @_;
	my $etime_limit_epoch = time - (60 * 60 * 24 * 60);	# 2months (この期間に登録した講師は対象外)
	my $sql = "SELECT prof_id FROM profs WHERE prof_status<>0 AND prof_cdate<${etime_limit_epoch}";
	my $sth = $dbh->prepare($sql);
	$sth->execute();
	my @list;
	while( my $h  = $sth->fetchrow_hashref ) {
		push(@list, $h);
	}
	$sth->finish();
	return \@list;
}

sub get_valid_term_lesson_list {
	my($c, $dbh, $prof_id) = @_;
	#リミット日時
	my $etime_limit_epoch = time - (60 * 60 * 24 * 60);	# 2months
	my @etm = FCC::Class::Date::Utils->new(time=>$etime_limit_epoch, tz=>$c->{tz})->get(1);
	my $etime_limit = "$etm[0]-$etm[1]-$etm[2] 00:00:00";
	#print $etime_limit."\n";
	#リミット日以降のレッスンが対象
	my $sql = "SELECT * FROM lessons WHERE lsn_etime>='${etime_limit}' AND prof_id=${prof_id}";
	my $sth = $dbh->prepare($sql);
	$sth->execute();
	my @list;
	while( my $h  = $sth->fetchrow_hashref ) {
		push(@list, $h);
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