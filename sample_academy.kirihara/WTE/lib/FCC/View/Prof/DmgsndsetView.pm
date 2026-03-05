package FCC::View::Prof::DmgsndsetView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Prof::_SuperView);

sub dispatch {
	my($self, $context) = @_;
	#システムエラーの評価
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
		return;
	}
	#プロセスキー
	my $pkey = $context->{proc}->{pkey};
	#
	if(@{$context->{proc}->{errs}}) {
		$self->error([$context->{proc}->{errs}->[0]->[1]]);
		return;
	} else {
		my $rurl = $self->{conf}->{CGI_URL} . "?m=dmgsndcpt&pkey=${pkey}";
		print "Location: ${rurl}\n\n";
	}
}

1;
