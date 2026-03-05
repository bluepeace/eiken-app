package FCC::Action::Mypage::CrdcptshwAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Mypage::_SuperAction);
use FCC::Class::Member;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $member_id = $self->{session}->{data}->{member}->{member_id};
	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "crd");
	if( ! $proc) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	if($proc->{in}->{confirm_ok} != 1) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	#プロセスセッションデータをコピー
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "crd");
	my $in = {};
	while( my($k, $v) = each %{$proc->{in}} ) {
		$in->{$k} = $v;
	}
	#プロセスセッションを削除
	$self->del_proc_session_data();
	#
	#最新の会員情報
	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	my $member = $omember->get_from_db($member_id);
	#
	$context->{in} = $in;
	$context->{member} = $member;
	return $context;
}

1;
