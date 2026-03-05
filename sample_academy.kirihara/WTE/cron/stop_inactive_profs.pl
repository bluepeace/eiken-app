#!/usr/bin/perl
#############################################################
# 講師ステータスの自動メンテナンス（非稼働停止＆活動再開復帰）
# daily
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
    use FCC::Class::Prof;
}

#############################################################

&main();

sub main {
    my $start = time;
    &loging("notice", "started.");

    # 本スクリプトが現在起動中かどうかをチェック
    &double_execute_check();

    # デフォルト設定をロード
    my $c = &load_conf();

    # memcachedに接続
    my @memcached_servers;
    push(@memcached_servers, $c->{memcached_servers1}) if $c->{memcached_servers1};
    push(@memcached_servers, $c->{memcached_servers2}) if $c->{memcached_servers2};
    my $memd = new Cache::Memcached::Fast({ servers => \@memcached_servers, ketama_points => 150 });

    # DB初期化
    my $db = new FCC::Class::DB(conf => $c);
    my $dbh = $db->connect_db();

    # システム設定情報を取得
    my $sc = FCC::Class::Syscnf->new(conf=>$c, db=>$db, memd=>$memd)->get();
    while( my($k, $v) = each %{$sc} ) { $c->{$k} = $v; }

    # 全講師（有効および停止中）をチェック対象として取得
    my $prof_list = &get_target_prof_list($c, $dbh);

    for my $prof (@{$prof_list}) {
        my $prof_id       = $prof->{prof_id};
        my $current_status = $prof->{prof_status};

        # 1. 【最優先：未来チェック】未来2ヶ月間に1つでも「枠(schedules)」があるか
        my $future_schedule_exists = &check_schedule_exists($c, $dbh, $prof_id, 'future');

        if ($future_schedule_exists > 0) {
            # 枠があるのに停止中(0)なら、有効(1)に復帰させる
            if ($current_status == 0) {
                &update_status($c, $db, $prof_id, 1);
                &loging("notice", "Auto-Restored: prof_id:${prof_id} is now active due to future schedules.");
            }
            next; # 稼働意欲がある講師はここで終了
        }

        # --- 以下、未来に枠がない講師の判定 ---

        # 2. 直近2ヶ月のレッスン実績チェック
        my $valid_term_lesson_list = &get_valid_term_lesson_list($c, $dbh, $prof_id);
        if (@{$valid_term_lesson_list} > 0) {
            # 実績があるなら、現状維持（再開を待つ）
            next;
        }

        # 3. 過去2ヶ月に枠を出していたかチェック
        my $past_schedule_exists = &check_schedule_exists($c, $dbh, $prof_id, 'past');
        if ($past_schedule_exists > 0) {
            # 予約は入らなかったが、枠を出していたなら現状維持
            next;
        }

        # 全ての条件（未来の枠、過去の実績、過去の枠出し）に該当しない場合
        # 現在「有効」であれば「非表示(0)」に停止する
        if ($current_status != 0) {
            &update_status($c, $db, $prof_id, 0);
            &loging("notice", "Auto-Stopped: prof_id:${prof_id} is now inactive due to 2 months of no activity.");
        }
    }

    $db->disconnect_db();
    &loging("notice", "completed.");
    exit;
}

#############################################################
# サブルーチン
#############################################################

# 講師リスト取得（登録から2ヶ月以上経過した全講師）
sub get_target_prof_list {
    my($c, $dbh) = @_;
    my $two_months_ago = time - (60 * 60 * 24 * 60);
    # 新人保護のため、登録から60日以上経過した講師のみ抽出
    my $sql = "SELECT prof_id, prof_status FROM profs WHERE prof_cdate < ${two_months_ago}";
    my $sth = $dbh->prepare($sql);
    $sth->execute();
    my @list;
    while( my $h = $sth->fetchrow_hashref ) { push(@list, $h); }
    return \@list;
}

# スケジュール枠の存在確認
sub check_schedule_exists {
    my ($c, $dbh, $prof_id, $mode) = @_;
    my $now_epoch = time;
    my $two_months_sec = (60 * 60 * 24 * 60);
    
    my $sql;
    my @params = ($prof_id);

    if ($mode eq 'future') {
        # 現在から未来2ヶ月の間に開始時間がある枠（lsn_id関係なく枠があればOK）
        my @etm = FCC::Class::Date::Utils->new(time => $now_epoch + $two_months_sec, tz => $c->{tz})->get(1);
        my $limit_time = "$etm[0]-$etm[1]-$etm[2] 23:59:59";
        my @ntm = FCC::Class::Date::Utils->new(time => $now_epoch, tz => $c->{tz})->get(1);
        my $now_time   = "$ntm[0]-$ntm[1]-$ntm[2] $ntm[3]:$ntm[4]:$ntm[5]";
        
        $sql = "SELECT COUNT(*) FROM schedules WHERE prof_id=? AND sch_stime BETWEEN ? AND ?";
        push(@params, $now_time, $limit_time);
    } else {
        # 過去2ヶ月の間に開始時間があった枠
        my @stm = FCC::Class::Date::Utils->new(time => $now_epoch - $two_months_sec, tz => $c->{tz})->get(1);
        my $start_time = "$stm[0]-$stm[1]-$stm[2] 00:00:00";
        
        $sql = "SELECT COUNT(*) FROM schedules WHERE prof_id=? AND sch_stime >= ?";
        push(@params, $start_time);
    }

    my $sth = $dbh->prepare($sql);
    $sth->execute(@params);
    my ($count) = $sth->fetchrow_array();
    return $count || 0;
}

# ステータス更新実行
sub update_status {
    my ($c, $db, $prof_id, $status) = @_;
    my $oprf = new FCC::Class::Prof(conf => $c, db => $db);
    
    # 警告をこのブロック内だけ抑制する
    {
        no warnings 'uninitialized'; 
        $oprf->mod({ prof_id => $prof_id, prof_status => $status });
    }
}

# 直近2ヶ月のレッスン実績取得（既存ロジックを流用）
sub get_valid_term_lesson_list {
    my($c, $dbh, $prof_id) = @_;
    my $limit_epoch = time - (60 * 60 * 24 * 60);
    my @etm = FCC::Class::Date::Utils->new(time => $limit_epoch, tz => $c->{tz})->get(1);
    my $limit_time = "$etm[0]-$etm[1]-$etm[2] 00:00:00";

    my $sql = "SELECT lsn_id FROM lessons WHERE lsn_etime >= ? AND prof_id = ?";
    my $sth = $dbh->prepare($sql);
    $sth->execute($limit_time, $prof_id);
    my @list;
    while( my $h = $sth->fetchrow_hashref ) { push(@list, $h); }
    return \@list;
}

# --- 以下、共通サブルーチン（変更なし） ---

sub double_execute_check {
    my $script_name = (split(/\//, $0))[-1];
    my @lines = split(/\n/, `/bin/ps ux`);
    my $num = grep { /\Q$script_name\E$/ } @lines;
    if ($num > 1) {
        &loging("error", "already running.");
        die "already running.\n";
    }
}

sub load_conf {
    my $c = {};
    my $ct = Config::Tiny->read("../default/default.ini.cgi") or die "config error";
    while( my($k, $v) = each %{$ct->{default}} ) { $c->{$k} = $v; }
    return $c;
}

sub get_jst {
    my($epoch, $pad) = @_;
    $epoch ||= time;
    my($s,$m,$h,$D,$M,$Y,$w) = gmtime($epoch + 32400);
    $Y += 1900; $M++;
    if($pad) { $_ = sprintf("%02d", $_) for ($M,$D,$h,$m,$s); }
    return $Y,$M,$D,$h,$m,$s,$w;
}

sub loging {
    my($lvl, $msg) = @_;
    my ($script) = $0 =~ /([^\/]+)$/;
    my @tm = &get_jst(time, 1);
    my $now = "$tm[0]-$tm[1]-$tm[2] $tm[3]:$tm[4]:$tm[5]";
    open my $fh, ">>", "./logs/$tm[0]$tm[1]$tm[2].log";
    print $fh "${now} \[${lvl}\]\[${script}\] ${msg}\n";
    close($fh);
}