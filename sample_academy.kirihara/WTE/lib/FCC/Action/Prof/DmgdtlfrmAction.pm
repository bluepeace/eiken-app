package FCC::Action::Prof::DmgdtlfrmAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Prof::_SuperAction);
use FCC::Class::Dmsg;
use FCC::Class::Member;
use FCC::Class::Date::Utils;
use CGI::Utils;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "dmgdtl");
	my $prof_id = $self->{session}->{data}->{prof}->{prof_id};


	#入力値のname属性値のリスト
	my $in_names = [
		's_member_id',
		'limit',
		'offset'
	];
	#入力値を取得
	my $in = $self->get_input_data($in_names);
	my $params = {};
	while( my($k, $v) = each %{$in} ) {
		if( ! defined $v || $v eq "" ) { next; }
		$k =~ s/^s_//;
		$params->{$k} = $v;
	}

	#会員識別IDを取得
	my $member_id = $params->{member_id};
	if( ! defined $member_id || $member_id eq "" || $member_id =~ /[^\d]/ ) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	#会員情報を取得
	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db});
	my $member = $omember->get_from_db($member_id);
	if( ! $member || $member->{member_status} != 1 ) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}

	if( ! $params->{limit} || $params->{limit} =~ /[^\d]/ ) {
		$params->{limit} = 20;
	} elsif( $params->{limit} > 100 ) {
		$params->{limit} = 100;
	}
	if( ! $params->{offset} || $params->{offset} =~ /[^\d]/ ) {
		$params->{offset} = 0;
	}

	$params->{prof_id} = $prof_id;
	$params->{member_id} = $member_id;

	#メッセージを検索
	my $odmsg = new FCC::Class::Dmsg(conf=>$self->{conf}, db=>$self->{db});
	my $res = $odmsg->get_list($params);

	#ページナビゲーション用リンクの共通パラメータ
	my @url_params = ("m=dmgdtlfrm");
	while( my($k, $v) = each %{$res->{params}} ) {
		if( ! defined $v ) { next; }
		if($k =~ /^(offset|sort|prof_status)$/) { next; }
		if($k !~ /^(limit|offset|sort_key)$/) {
			$k = "s_${k}";
		}
		if( ref($v) eq "ARRAY" ) {
			for my $e (@{$v}) {
				my $e_urlenc = CGI::Utils->new()->urlEncode($e);
				push(@url_params, "${k}=${e_urlenc}");
			}
		} else {
			my $v_urlenc = CGI::Utils->new()->urlEncode($v);
			push(@url_params, "${k}=${v_urlenc}");
		}
	}
	#ページナビゲーション（次へ、前へ）
	my $next_url = "";
	my $prev_url = "";
	my $next_num = 0;
	my $prev_num = 0;
	if($res->{params}->{offset} > 0) {
		$prev_url = "$self->{conf}->{CGI_URL}?" . join("&amp;", @url_params);
		my $prev_offset = $res->{params}->{offset} - $res->{params}->{limit};
		if($prev_offset < 0) {
			$prev_offset = 0;
		}
		$prev_url .= "&amp;offset=${prev_offset}";
		$prev_num = $res->{params}->{limit};
	}
	if($res->{hit} > $res->{params}->{offset} + $res->{fetch}) {
		$next_url = "$self->{conf}->{CGI_URL}?" . join("&amp;", @url_params);
		my $next_offset = $res->{params}->{offset} + $res->{params}->{limit};
		if($next_offset > $res->{hit}) {
			$next_offset = $res->{hit};
		}
		$next_url .= "&amp;offset=${next_offset}";
		$next_num = $res->{params}->{limit};
		if($res->{params}->{offset} + $res->{params}->{fetch} + $res->{params}->{limit} > $res->{hit}) {
			$next_num = $res->{hit} - ($res->{params}->{offset} + $res->{params}->{fetch});
		}
	}
	$res->{next_url} = $next_url;
	$res->{prev_url} = $prev_url;
	$res->{next_num} = $next_num;
	$res->{prev_num} = $prev_num;
	#ページナビゲーション（ページ番号リスト）
	my $page_list = [];
	if($res->{hit} <= $res->{params}->{limit}) {
		$page_list->[0] = {
			page => 1,
			current => 1
		};
	} else {
		my $show_page_num = 9;
		my $this_page = int($res->{params}->{offset} / $res->{params}->{limit}) + 1;
		#
		my $min_page = $this_page - int($show_page_num / 2);
		if($min_page < 1) { $min_page = 1; }
		#
		my $max_page = int($res->{hit} / $res->{params}->{limit});
		if( $res->{hit} % $res->{params}->{limit} ) {
			$max_page ++;
		}
		if($max_page > $this_page + int($show_page_num / 2)) {
			$max_page = $this_page + int($show_page_num / 2);
		}
		for( my $p=$min_page; $p<=$max_page; $p++ ) {
			my %hash;
			$hash{page} = $p;
			if($p == $this_page) {
				$hash{current} = 1;
			} else {
				$hash{current} = 0;
			}
			$hash{url} = "$self->{conf}->{CGI_URL}?" . join("&amp;", @url_params);
			my $offset = $res->{params}->{offset} + $res->{params}->{limit} * ($p - $this_page);
			$hash{url} .= "&amp;offset=${offset}";
			push(@{$page_list}, \%hash);
		}
	}
	$res->{page_list} = $page_list;


	#メッセージ投稿関連の処理
	unless($proc) {
		if( ! defined $member_id || $member_id eq "" || $member_id =~ /[^\d]/ ) {
			$context->{fatalerrs} = ["不正なリクエストです。"];
			return $context;
		}
		$proc = $self->create_proc_session_data("dmgdtl");

		$proc->{in} = {
			member_id => $member_id,
			prof_id => $prof_id,
			dmsg_direction => 2 # 講師 -> 会員
		};
		#
		$self->set_proc_session_data($proc);
	}


	$context->{member} = $member;
	$context->{res} = $res;
	$context->{proc} = $proc;
	return $context;
}


1;
