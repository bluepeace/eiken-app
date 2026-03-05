package FCC::Action::Mypage::LsnrsvcptAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Mypage::_SuperAction);
use CGI::Cookie;
use LWP::UserAgent;
use HTTP::Request;
use FCC::Class::Log;

sub dispatch {
    my ($self)  = @_;
    my $context = {};
    my $pkey    = $self->{q}->param("pkey");
    my $proc    = $self->get_proc_session_data( $pkey, "lsnrsv" );
    my $in      = {};
    while ( my ( $k, $v ) = each %{ $proc->{in} } ) {
        $in->{$k} = $v;
    }
    $self->del_proc_session_data();

    # A8トラッキングシステム
    my $a8_cookie = "";
    my %cookies   = CGI::Cookie->fetch;
    if ( $cookies{"wte-a8"} ) {
        $a8_cookie = $cookies{"wte-a8"}->value;
        if ( $self->is_first_reservation() ) {
            $self->request_a8_earnings( $a8_cookie, $in );
        }
    }

    $context->{in}        = $in;
    $context->{a8_cookie} = $a8_cookie;
    return $context;
}

sub is_first_reservation {
    my ($self)    = @_;
    my $member_id = $self->{session}->{data}->{member}->{member_id};
    my $dbh       = $self->{db}->connect_db();
    my $sql = "SELECT COUNT(lsn_id) FROM lessons WHERE member_id=${member_id}";
    my ($hit) = $dbh->selectrow_array($sql);
    $hit += 0;
    my $res = ( $hit > 1 ) ? 0 : 1;
    return $res;
}

sub request_a8_earnings {
    my ( $self, $a8_cookie, $in ) = @_;
    my $member_id = $in->{member_id};
    my $lsn_id    = $in->{lsn_id};

    my $url = "https://px.a8.net/a8fly/earnings?a8=${a8_cookie}";
    $url .= "&pid=s00000023817002";
    $url .= "&so=${member_id}-${lsn_id}";
    $url .= "&SI=1-1-1-a8";
    $url .= "&currency=JPY";

    $ENV{'PERL_LWP_SSL_VERIFY_HOSTNAME'} = 0;
    my $req = HTTP::Request->new( GET => $url );
    my $ua  = LWP::UserAgent->new;
    $ua->ssl_opts( verify_hostname => 0 );
    my $res = $ua->request($req);

    my @msg_cols = (
        "HTTP_REQUEST_URL: ${url}",
        "HTTP_RESPONSE_CODE: " . $res->code . " " . $res->message,
        "HTTP_RESPONSE_BODY: " . $res->content
    );
    my $msg = join( ", ", @msg_cols );

    FCC::Class::Log->new( conf => $self->{conf} )->loging( "a8net", $msg );
}

1;
