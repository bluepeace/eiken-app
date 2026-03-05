package FCC::View::Mypage::StripesView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Mypage::_SuperView);

no warnings 'redefine';

sub dispatch {
	my($self, $context) = @_;
	#システムエラーの評価
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
		return;
	}
	#プロセスキー
	my $pkey = $context->{proc}->{pkey};
	my $member_id = $self->{session}->{data}->{member}->{member_id};
	my $crd_id = $self->{q}->param("invoice");

	my $error = $context->{fatalerrs};
	#
	if($error) {
		my $rurl = $self->{conf}->{CGI_URL} . "?m=crdcptset&pkey=${pkey}&crd_id=${crd_id}&member_id=${member_id}";
		print "Location: ${rurl}\n\n";
	} else {
		my $rurl = $self->{conf}->{CGI_URL} . "?m=crdcptset&pkey=${pkey}&crd_id=${crd_id}&member_id=${member_id}";
		print "Location: ${rurl}\n\n";
	}
}

1;
