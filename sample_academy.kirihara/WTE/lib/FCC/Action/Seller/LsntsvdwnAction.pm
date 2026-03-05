package FCC::Action::Seller::LsntsvdwnAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Seller::_SuperAction);
use CGI::Utils;
use FCC::Class::Lesson;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $seller_id = $self->{session}->{data}->{seller}->{seller_id};
	#入力値のname属性値のリスト
	my $in_names = [
		's_lsn_id',
		's_member_id',
		's_former_school', #1
		's_prof_id',
		's_lsn_stime_s',
		's_lsn_stime_e',
		's_lsn_status'
	];
	#入力値を取得
	my $in = $self->get_input_data($in_names);
	my $params = {};
	while( my($k, $v) = each %{$in} ) {
		if( ! defined $v || $v eq "" ) { next; }
		$k =~ s/^s_//;
		$params->{$k} = $v;
	}
	$params->{seller_id} = $seller_id;
	$params->{sort} = [ ['lsn_stime', 'DESC'] ];
	$params->{charcode} = "sjis";
	$params->{returncode} = "\x0a";
#31 ▼
	#言語設定(0:en 1:jp)
	my $lang = $self->{session}->{data}->{seller_lang};
	if (! defined $lang || $lang eq "" || $lang !~ /^(0|1)$/) {
			$lang = 0;
	}
	#CSVを生成
	my $olsn = new FCC::Class::Lesson(conf=>$self->{conf}, db=>$self->{db});
#D	my $res = $olsn->get_csv($params);
	my $res = $olsn->get_csv($params,$lang);
#31 ▲
	#
	$context->{res} = $res;
	return $context;
}


1;
