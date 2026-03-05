package FCC::View::Mypage::ActdtlfrmView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Mypage::_SuperView);
use CGI::Utils;
use FCC::Class::String::Conv;

sub dispatch {
	my($self, $context) = @_;
	#システムエラーの評価
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
		exit;
	}
	#テンプレートのロード
	my $t = $self->load_template();
	#プリセット
	while( my($k, $v) = each %{$context->{mbract}} ) {
		if( ! defined $v ) { $v = ""; }
		if($k eq "mbract_cdate") {
			my %fmt = FCC::Class::Date::Utils->new(time=>$v, tz=>$self->{conf}->{tz})->get_formated();
			while( my($fn, $fv) = each %fmt ) {
				$hash{"${k}_${fn}"} = $fv;
			}
		} elsif($k =~ /^mbract_(type|reason)$/) {
			$hash{"${k}_${v}"} = 1;
		} elsif($k eq "mbract_price") {
			$t->param("${k}_with_comma" => FCC::Class::String::Conv->new($v)->comma_format());
		} else {
			$v = CGI::Utils->new()->escapeHtml($v);
			$v =~ s/\n/<br \/>/g;
			$t->param($k => $v);
		}
	}
	#
	$self->print_html($t);
}

1;
