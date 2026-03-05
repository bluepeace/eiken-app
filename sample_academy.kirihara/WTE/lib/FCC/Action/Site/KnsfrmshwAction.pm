package FCC::Action::Site::KnsfrmshwAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Site::_SuperAction);

sub dispatch {
	my($self) = @_;
	my $context = {};
	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "kns");
	#
	unless($proc) {
		$self->{session}->create();
		$proc = $self->create_proc_session_data("kns");
		$self->set_proc_session_data($proc);
	}
	#
	$context->{proc} = $proc;
	return $context;
}

1;
