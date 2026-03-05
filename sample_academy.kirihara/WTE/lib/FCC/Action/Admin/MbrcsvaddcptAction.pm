package FCC::Action::Admin::MbrcsvaddcptAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Admin::_SuperAction);

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

	#入力値情報
	my $data = {};
	while( my($k, $v) = each %{$proc->{in}} ) {
		$data->{$k} = $v;
	}

	#セッション削除
	$self->del_proc_session_data();

	$context->{data} = $data;
	return $context;
}

1;
