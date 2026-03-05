package FCC::Action::Admin::MbrschlstAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Admin::_SuperAction);
use Date::Pcalc;
use FCC::Class::Schedule;
use FCC::Class::Lesson;
use FCC::Class::Date::Utils;
use FCC::Class::Member;

sub dispatch {
	my($self) = @_;
	my $context = {};
	#会員IDを取得
	my $member_id = $self->{q}->param("member_id");
	my $member_caption = $self->{conf}->{member_caption};
	if(!$member_id || $member_id =~ /[^\d]/) {
		$context->{fatalerrs} = ["${member_caption}識別IDに不正な値が送信されました。"];
		return $context;
	}
	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd}, q=>$self->{q});
	my $member = $omember->get_from_db($member_id);
	unless($member) {
		$context->{fatalerrs} = ["指定の${member_caption}IDが見つかりませんでした。"];
		return $context;
	}
	if($member->{member_status} != 1) {
		$context->{fatalerrs} = ["ステータスが有効でない${member_caption}はレッスン予約をすることはできません。"];
		return $context;
	}
	#指定年月を取得
	my $ym = $self->{q}->param("ym");
	#指定年月の日付けリストを取得
	my $osch = new FCC::Class::Schedule(conf=>$self->{conf}, db=>$self->{db});
	my $this_month_date_list;
	my @tm = FCC::Class::Date::Utils->new(time=>time, tz=>$self->{conf}->{tz})->get(1);
	my $ym_s = "$tm[0]$tm[1]";
	my $available_datetime_e = $osch->get_available_datetime_e();
	my $ym_e = substr($available_datetime_e, 0, 6);
	if($ym) {
		if( $ym =~ /^(\d{4})(\d{2})$/ ) {
			my $y = $1;
			my $m = $2;
			if( Date::Pcalc::check_date($y, $m, 1) ) {
#				if( $ym lt $ym_s || $ym gt $ym_e ) {
#					$context->{fatalerrs} = ["不正なリクエストです。(1)"];
#					return $context;
#				}
				$this_month_date_list = $osch->get_month_date_list($y, $m);
			} else {
				$context->{fatalerrs} = ["不正なリクエストです。(2)"];
				return $context;
			}
		} else {
			$context->{fatalerrs} = ["不正なリクエストです。(3)"];
			return $context;
		}
	} else {
		$this_month_date_list = $osch->get_month_date_list_from_epoch(time);
	}
	my $dt = $this_month_date_list->[1]->[0];
	$ym = $dt->{Y} . $dt->{m};

	#登録済みのレッスンを取得
	my $sd = $this_month_date_list->[0]->[0];
	my $week_num = @{$this_month_date_list};
	my $ed = $this_month_date_list->[$week_num-1]->[6];
	my $params = {
		member_id   => $member->{member_id},
		lsn_stime_s => $sd->{Y} . $sd->{m} . $sd->{d},
		lsn_stime_e => $ed->{Y} . $ed->{m} . $ed->{d},
		lsn_cancel  => 0,
		offset      => 0,
		limit       => 9999,
		sort => [["lsn_stime", "ASC"]]
	};
	my $olsn = new FCC::Class::Lesson(conf=>$self->{conf}, db=>$self->{db});
	my $res = $olsn->get_list($params);
	my $lessons = {};
	for my $r (@{$res->{list}}) {
		my($Y, $M, $D, $h, $m) = $r->{lsn_stime} =~ /^(\d{4})\-(\d{2})\-(\d{2})/;
		my $date = "${Y}${M}${D}";
		unless($lessons->{$date}){ $lessons->{$date} = []; }
		push(@{$lessons->{$date}}, $r);
	}
	#先月の末日の日付情報
	my $last_month = $osch->get_last_month_last_day_info($dt->{Y}, $dt->{n});
	my $last_month_ym = $last_month->{Y} . $last_month->{m};
	my $last_month_disabled = "";
	if( $last_month_ym lt $ym_s || $last_month_ym gt $ym_e ) {
		$last_month_disabled = "disabled";
	}
	#来月の1日の日付情報
	my $next_month = $osch->get_next_month_first_day_info($dt->{Y}, $dt->{n});
	my $next_month_ym = $next_month->{Y} . $next_month->{m};
	my $next_month_disabled = "";
	if( $next_month_ym lt $ym_s || $next_month_ym gt $ym_e ) {
		$next_month_disabled = "disabled";
	}
	#今月のある日の情報（第二週目の日曜日）
	my $this_month = $this_month_date_list->[1]->[0];
	#会員のポイント有効期限を過ぎた日付けを無効にする
	for my $w (@{$this_month_date_list}) {
		for my $d (@{$w}) {
			if("$d->{Y}-$d->{m}-$d->{d}" gt $self->{session}->{data}->{member}->{member_point_expire} ) {
				$d->{disabled} = "disabled";
			}
		}
	}

	#日ごとに、レッスン枠が登録されている講師を取得
	my $sch_list_res = $osch->get_list({
		lsn_stime_s => $sd->{Y} . $sd->{m} . $sd->{d},
		lsn_stime_e => $ed->{Y} . $ed->{m} . $ed->{d},
		limit       => 1000
	});
	my $schedules = {};
	for my $r (@{$sch_list_res->{list}}) {
		my($Y, $M, $D, $h, $m) = $r->{sch_stime} =~ /^(\d{4})\-(\d{2})\-(\d{2})/;
		my $date = "${Y}${M}${D}";
		unless($schedules->{$date}){ $schedules->{$date} = []; }
		push(@{$schedules->{$date}}, $r);
	}
	my $profs = {};
	while(my($date, $sch_list) = each %{$schedules}) {
		my $h = {};
		for my $sch (@{$sch_list}) {
			my $prof_id = $sch->{prof_id};
			$h->{$prof_id} = $sch;
		}
		my $prof_list = [];
		for my $prof_id (sort {$a <=> $b} keys %{$h}) {
			push(@{$prof_list}, $h->{$prof_id});
		}
		$profs->{$date} = $prof_list;
	}
	#
	$context->{this_month_date_list} = $this_month_date_list;
	$context->{last_month} = $last_month;
	$context->{next_month} = $next_month;
	$context->{this_month} = $this_month;
	$context->{last_month_disabled} = $last_month_disabled;
	$context->{next_month_disabled} = $next_month_disabled;
	$context->{ym} = $ym;
	$context->{lessons} = $lessons;
	$context->{profs} = $profs;
	$context->{member} = $member;
	return $context;
}

1;
