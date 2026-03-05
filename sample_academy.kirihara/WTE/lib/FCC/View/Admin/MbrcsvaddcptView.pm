package FCC::View::Admin::MbrcsvaddcptView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Admin::_SuperView);
use FCC::Class::Date::Utils;

sub dispatch {
	my($self, $context) = @_;
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
	}
	my $t = $self->load_template();
	while( my($k, $v) = each %{$context->{data}} ) {
		if( ! defined $v ) { $v = ""; }
		$v = CGI::Utils->new()->escapeHtml($v);
		$t->param($k => $v);
	}
	$self->print_html($t);
}

1;
