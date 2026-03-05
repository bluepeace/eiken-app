package FCC::Action::Admin::MbrcsvaddsetAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Admin::_SuperAction);
use FCC::Class::Member;

sub dispatch {
	my($self) = @_;
	my $context = {};

	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "mbrcsvadd");
	if( ! $proc) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}

	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	my $rec_list;
	eval {
		$rec_list = $omember->add_multi($proc->{in}->{member_list});
	};
	if($@) {
		$context->{fatalerrs} = [$@];
		return $context;
	}

	$proc->{in}->{member_list} = $rec_list;
	$self->set_proc_session_data($proc);
	$context->{proc} = $proc;
	return $context;
}

1;
