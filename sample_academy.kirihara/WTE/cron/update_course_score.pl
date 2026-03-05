#!/usr/bin/perl
#############################################################
# 授業のスコアをアップデート (空き枠ボーナス版)
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
    use FCC::Class::Course;
    use FCC::Class::Lesson;
    use FCC::Class::Date::Utils;
}

#############################################################

&main();

#############################################################
# サブルーチン
#############################################################

# 1. コース取得時に prof_id も取得
sub get_courses {
    my ($dbh) = @_;
    my $sth = $dbh->prepare("SELECT course_id, prof_id, course_status FROM courses");
    $sth->execute();
    my $h = {};
    while ( my ( $id, $p_id, $status ) = $sth->fetchrow_array ) {
        $h->{$id} = {
            n => 0,        # スコア用カウント (実績 + 空き枠ボーナス)
            r => 0,        # 評価平均
            s => $status,
            prof_id => $p_id
        };
    }
    $sth->finish();
    return $h;
}

# 2. メイン処理
sub main {
    &loging( "notice", "started." );
    my $start = time;

    &double_execute_check();
    my $c = &load_conf();

    # memcached
    my @memcached_servers;
    if ( $c->{memcached_servers1} ) { push( @memcached_servers, $c->{memcached_servers1} ); }
    if ( $c->{memcached_servers2} ) { push( @memcached_servers, $c->{memcached_servers2} ); }
    my $memd = new Cache::Memcached::Fast( { servers => \@memcached_servers, ketama_points => 150 } );

    # DB
    my $db  = new FCC::Class::DB( conf => $c );
    my $dbh = $db->connect_db();

    # システム設定
    my $sc = FCC::Class::Syscnf->new( conf => $c, db => $db, memd => $memd )->get();
    while ( my ( $k, $v ) = each %{$sc} ) { $c->{$k} = $v; }

    # 期間設定 (過去30日)
    my $limit_days = 30;
    my @stm = FCC::Class::Date::Utils->new( time => time - ( 86400 * $limit_days ), tz => $c->{tz} )->get(1);
    my $s_date = "$stm[0]-$stm[1]-$stm[2]";
    my @etm = FCC::Class::Date::Utils->new( time => time - ( 86400 * 1 ), tz => $c->{tz} )->get(1);
    my $e_date = "$etm[0]-$etm[1]-$etm[2]";

    # 期間設定 (未来30日)
    my @ftm = FCC::Class::Date::Utils->new( time => time + ( 86400 * 30 ), tz => $c->{tz} )->get(1);
    my $f_date = "$ftm[0]-$ftm[1]-$ftm[2]";

    # 今日の日付 (未来集計の開始点)
    my @today_tm = FCC::Class::Date::Utils->new( time => time, tz => $c->{tz} )->get(1);
    my $t_date = sprintf("%04d-%02d-%02d", $today_tm[0], $today_tm[1], $today_tm[2]);

    my $courses = &get_courses($dbh);

    # スコア算出 (引数に $t_date と $f_date を追加)
    &calc_rating( $dbh, $courses, $s_date, $e_date, $t_date, $f_date );

    # 更新
    &set_score( $dbh, $courses );

    $db->disconnect_db();
    &loging( "notice", "completed." );
    exit;
}

# 3. スコア算出ロジック
sub calc_rating {
    my ( $dbh, $courses, $s_date, $e_date, $t_date, $f_date ) = @_;
    
    # --- 過去の評価・完了数 ---
    my $sql = "SELECT course_id, lsn_member_repo_rating, lsn_status FROM lessons";
    $sql .= " WHERE (lsn_stime BETWEEN '${s_date} 00:00:00' AND '${e_date} 23:59:59')";
    my $sth = $dbh->prepare($sql);
    $sth->execute();
    
    my $ratings = {};
    while ( my ( $id, $rating, $status ) = $sth->fetchrow_array ) {
        unless ( $courses->{$id}->{s} ) { next; }
        $ratings->{$id} ||= [ 0, 0, 0 ];
        if ( $rating && $rating > 0 ) {
            $ratings->{$id}->[0] += $rating;
            $ratings->{$id}->[1]++;
        }
        if ( $status == 1 ) { $ratings->{$id}->[2]++; }
    }
    $sth->finish();

    # --- 未来の空き枠集計 ---
    my $v_sql = "SELECT prof_id, COUNT(*) FROM schedules";
    $v_sql .= " WHERE lsn_id = 0"; 
    $v_sql .= " AND (sch_stime BETWEEN '${t_date} 00:00:00' AND '${f_date} 23:59:59')";
    $v_sql .= " GROUP BY prof_id";
    
    my $v_sth = $dbh->prepare($v_sql);
    $v_sth->execute();
    my $vacancies = {};
    while ( my ( $p_id, $count ) = $v_sth->fetchrow_array ) {
        $vacancies->{$p_id} = $count;
    }
    $v_sth->finish();

    # --- 最終集計 ---
    while ( my ( $id, $course ) = each %{$courses} ) {
        my $r_data = $ratings->{$id} || [ 0, 0, 0 ];
        
        # 評価
        my $avg = ( $r_data->[1] > 0 ) ? int( $r_data->[0] / $r_data->[1] ) : 0;
        $course->{r} = $avg;

        # 空き枠ボーナス (係数 5)
        my $p_id = $course->{prof_id};
        my $v_bonus = ($vacancies->{$p_id} || 0) * 5;

        # 実績 + ボーナス
        $course->{n} = $r_data->[2] + $v_bonus;
    }
}

# 4. DB更新
sub set_score {
    my ( $dbh, $courses ) = @_;
    my $last_sql;
    eval {
        while ( my ( $course_id, $r ) = each %{$courses} ) {
            my $score = ( $r->{r} * 1000 ) + $r->{n};
            $last_sql = "UPDATE courses SET course_score=${score} WHERE course_id=${course_id}";
            $dbh->do($last_sql);
        }
        $dbh->commit();
    };
    if ($@) {
        $dbh->rollback();
        my $msg = "failed to execute a SQL statement. ${last_sql}";
        &loging( "error", $msg );
        die $msg;
    }
}

# --- ユーティリティ ---

sub double_execute_check {
    my @script_pathes = split( /\//, $0 );
    my $script_name   = pop @script_pathes;
    my $ps_result_str = `/bin/ps ux`;
    my @lines         = split( /\n/, $ps_result_str );
    my $script_num    = 0;
    for my $line (@lines) {
        if ( $line =~ /\Q${script_name}\E$/ ) {
            $script_num++;
            if ( $script_num > 1 ) {
                my $msg = "this script has already been running.";
                &loging( "error", $msg );
                die "$msg\n";
            }
        }
    }
}

sub load_conf {
    my $c = {};
    my $ct = Config::Tiny->read("../default/default.ini.cgi") or die "failed to read config: $!";
    while ( my ( $k, $v ) = each %{ $ct->{default} } ) { $c->{$k} = $v; }
    return $c;
}

sub get_jst {
    my ( $epoch, $zero_pad ) = @_;
    $epoch ||= time;
    my ( $s, $m, $h, $D, $M, $Y, $w ) = gmtime( $epoch + 32400 );
    $Y += 1900; $M++;
    if ($zero_pad) {
        $M = sprintf( "%02d", $M ); $D = sprintf( "%02d", $D );
        $h = sprintf( "%02d", $h ); $m = sprintf( "%02d", $m ); $s = sprintf( "%02d", $s );
    }
    return $Y, $M, $D, $h, $m, $s, $w;
}

sub loging {
    my ( $lebel, $msg ) = @_;
    $msg =~ s/\n//g;
    my $d = "./logs";
    my ($script) = $0 =~ /([^\/]+)$/;
    my @tm = &get_jst( time, 1 );
    my $now = "$tm[0]-$tm[1]-$tm[2] $tm[3]:$tm[4]:$tm[5]";
    my $f = "${d}/$tm[0]$tm[1]$tm[2].log";
    open my $fh, ">>", $f or die "failed log open: $!";
    print $fh "${now} \[${lebel}\]\[${script}\] ${msg}\n";
    close($fh);
}

sub error {
    my ($msg) = @_;
    &loging( "error", $msg );
    die "${msg}\n";
}