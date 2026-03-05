package FCC::View::Mypage::LogoffView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Mypage::_SuperView);

sub dispatch {
	my($self, $context) = @_;
	#
	if($context->{redirect}) {
		my $rurl = $self->{conf}->{www_host_url} . $context->{redirect};
		print "Location: http://${rurl}\n\n";
	} else {
		my $t = $self->load_template();
		#
		my $cookie_string_list = $self->{session}->logoff_cookie_strings();
		my $hdrs = {
			"Set-Cookie" => $cookie_string_list
		};
		$self->print_html($t, $hdrs);
	}
}

1;
