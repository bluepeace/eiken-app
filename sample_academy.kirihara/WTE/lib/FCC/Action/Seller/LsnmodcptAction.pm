package FCC::Action::Seller::LsnmodcptAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Seller::_SuperAction);

sub dispatch {
	my($self) = @_;
	my $context = {};
	#�v���Z�X�Z�b�V�����f�[�^���R�s�[
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "lsnmod");
	my $in = {};
	while( my($k, $v) = each %{$proc->{in}} ) {
		$in->{$k} = $v;
	}
	#�v���Z�X�Z�b�V�������폜
	$self->del_proc_session_data();
	#
	$context->{in} = $in;
	return $context;
}

1;
