package FCC::View::Mypage::DmgaddsetView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Mypage::_SuperView);

sub dispatch {
	my($self, $context) = @_;
	#システムエラーの評価
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
		return;
	}
	#
	my $prof_id = $context->{prof_id};
	my $rurl = $self->{conf}->{CGI_URL} . "?m=prfdtlfrm&prof_id=${prof_id}";

	my $lsn_id = $context->{lsn_id};
	if($lsn_id) {
		$rurl = $self->{conf}->{CGI_URL} . "?m=lsndtlfrm&lsn_id=${lsn_id}";
	}
	
	print "Location: ${rurl}\n\n";
}

1;
