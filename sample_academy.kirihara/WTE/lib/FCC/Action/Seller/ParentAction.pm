package FCC::Action::Seller::ParentAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Seller::_SuperAction);
use FCC::Class::Passwd;
use FCC::Class::Seller;
use FCC::Class::Ann;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $seller_id = $self->{session}->{data}->{seller}->{seller_id};
	#
	my $oseller = new FCC::Class::Seller(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	my $seller = $oseller->get_from_db($seller_id);
	#お知らせ
	my $oann = new FCC::Class::Ann(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	my $ann_list = $oann->get_list_for_dashboard(1);
	#メモ
	$context->{note} = $self->get_note();
	#ログオンアカウント情報を取得
	my $pw = new FCC::Class::Passwd(conf=>$self->{conf});
	unless($pw) {
		$context->{fatalerrs} = [$!];
		return $context;
	}
	$context->{acnt} = $pw->get($self->{session}->{data}->{id});
#
	$context->{seller} = $seller;
	$context->{ann_list} = $ann_list;
	return $context;
}

sub get_note {
	my($self) = @_;
	my $base_dir = $self->{conf}->{BASE_DIR};
	my $fcc_selector = $self->{conf}->{FCC_SELECTOR};
	my $notef = "${base_dir}/data/${fcc_selector}.note.cgi";
	unless( -e $notef ) { return ""; }
	my $note = "";
	open my $fh, "<", $notef;
	my @lines = <$fh>;
	close($fh);
	return join("", @lines);
}

1;
