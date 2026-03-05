package FCC::View::Mypage::CrdcptshwView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Mypage::_SuperView);
use CGI::Utils;
use FCC::Class::String::Conv;

sub dispatch {
	my($self, $context) = @_;
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
		return;
	}
	my $t = $self->load_template();
	#
	while( my($k, $v) = each %{$context->{in}} ) {
		if( ! defined $v ) { $v = ""; }
		$t->param($k => CGI::Utils->new()->escapeHtml($v));
		if($k =~ /^pln_(point|price|price_excluding_tax)$/) {
			$t->param("${k}_with_comma" => FCC::Class::String::Conv->new($v)->comma_format());
		} elsif($k eq "pln_subscription") {
			$t->param("${k}_${v}" => 1);
		}
	}
	#最新の会員情報
	while( my($k, $v) = each %{$context->{member}} ) {
		if( ! defined $v ) { $v = ""; }
		$t->param($k => CGI::Utils->new()->escapeHtml($v));
		if($k =~ /^member_(point|coupon)$/) {
			$t->param("${k}_with_comma" => FCC::Class::String::Conv->new($v)->comma_format());
		}
	}
	#現在の保持ポイントと有効期限
	while( my($k, $v) = each %{$context->{member}} ) {
		if($k =~ /^member_(point|coupon)$/) {
			$t->param($k => $v);
			$t->param("${k}_with_comma" => FCC::Class::String::Conv->new($v)->comma_format());
		} elsif($k =~ /^member_(point|coupon)_expire$/) {
			my($y, $m, $d) = split(/\-/, $v);
			$m += 0;
			$d += 0;
			$t->param("${k}_y" => $y);
			$t->param("${k}_m" => $m);
			$t->param("${k}_d" => $d);
		}
	}
	$self->print_html($t);
}

1;
