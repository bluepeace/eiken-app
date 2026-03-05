package FCC::View::Mypage::DmgfledwnView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Mypage::_SuperView);
use CGI::Utils;
use FCC::Class::Date::Utils;
use FCC::Class::String::Conv;

sub dispatch {
    my ( $self, $context ) = @_;

    #システムエラーの評価
    if ( $context->{fatalerrs} ) {
        $self->error( $context->{fatalerrs} );
        exit;
    }

    my $fsize = $context->{fsize};
    my $fpath = $context->{fpath};

    my $fname = $context->{fname};
    $fname =~ s/([^0-9A-Za-z_ ])/'%'.unpack('H2',$1)/ge;
    $fname =~ s/\s/+/g;

    open my $fh, "<", $fpath;
    binmode($fh);
    print "Content-Type: application/octet-stream\n";
	print "Content-Disposition: attachment; filename*=utf-8''${fname}\n";
    print "Content-Length: ${fsize}\n";
    print "\n";
    my $buff;

    while ( my $len = sysread( $fh, $buff, 1048576 ) ) {
        print $buff;
    }
    close($fh);

}

1;
