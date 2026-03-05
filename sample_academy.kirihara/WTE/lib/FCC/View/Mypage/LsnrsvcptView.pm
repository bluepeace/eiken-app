package FCC::View::Mypage::LsnrsvcptView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Mypage::_SuperView);
use CGI::Utils;
use CGI::Cookie;

sub dispatch {
    my ( $self, $context ) = @_;
    if ( $context->{fatalerrs} ) {
        $self->error( $context->{fatalerrs} );
        return;
    }
    my $t = $self->load_template();
    while ( my ( $k, $v ) = each %{ $context->{in} } ) {
        if ( !defined $v ) { $v = ""; }
        $t->param( $k => CGI::Utils->new()->escapeHtml($v) );
        if ( $k =~ /_(fee|coupon|point)$/ ) {
            $t->param( "${k}_with_comma" =>
                  FCC::Class::String::Conv->new($v)->comma_format() );
        }
        elsif ( $k eq "lsn_pay_type" ) {
            $t->param( "${k}_${v}" => 1 );
        }
    }

    if ( $context->{a8_cookie} ) {
        my $cookie = CGI::Cookie->new(
            -name    => "wte-a8",
            -value   => "dummy",
            -path    => "/",
            -expires => "-12M",
            -secure  => 1
        );
        my $cval = $cookie->as_string();
        my $hdrs = { "Set-Cookie" => $cval };
        $self->print_html( $t, $hdrs );
    }
    else {
        $self->print_html($t);
    }

}

1;
