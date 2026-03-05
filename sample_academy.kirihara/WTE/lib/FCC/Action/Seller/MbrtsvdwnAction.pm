package FCC::Action::Seller::MbrtsvdwnAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Seller::_SuperAction);
use CGI::Utils;
use FCC::Class::Member;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $seller_id = $self->{session}->{data}->{seller}->{seller_id};
	#入力値のname属性値のリスト
	my $in_names = [
		's_member_id',
		's_member_handle',
		's_member_lastname',#20
		's_member_firstname',#20
		's_member_email',
		's_member_status',
		's_member_hdate_s',#30
		's_member_hdate_e',#30
		's_member_skypedate_s',#7
		's_member_skypedate_e',#7
		's_member_title',
		's_member_company'
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
	$params->{sort} = [ ['member_id', 'DESC'] ];
	$params->{charcode} = "sjis";
	$params->{returncode} = "\x0a";
	#CSVを生成
	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db});
	my $res = $omember->get_csv($params);
	#
	$context->{res} = $res;
	return $context;
}


1;
