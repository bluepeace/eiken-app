package FCC::Action::Admin::MbrcsvaddfrmAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Admin::_SuperAction);
use FCC::Class::Seller;

sub dispatch {
	my($self) = @_;
	my $context = {};
	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "mbrcsvadd");

	my $seller_id = $self->{q}->param("seller_id");
	my $oseller = new FCC::Class::Seller(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});

	if($seller_id) {
		my $seller = $oseller->get_from_db($seller_id);
		unless($seller) {
			$context->{fatalerrs} = ["指定の seller_id が見つかりませんでした。"];
			return $context;
		}
		if(!$proc) {
			$proc = $self->create_proc_session_data("mbrcsvadd");
		}
		$proc->{in} = $seller;
	} else {
		unless($proc) {
			$context->{fatalerrs} = ["seller_id が指定されませんでした。"];
			return $context;
		}
	}

	$self->set_proc_session_data($proc);
	$context->{proc} = $proc;
	return $context;
}


1;
