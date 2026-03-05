package FCC::View::Site::CoudtlfrmView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Site::_SuperView);
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

    #会員ログイン済みなら会員メニューへリダイレクト
    if ( $context->{redirect} ) {
        my $url = $context->{redirect};
        print "Location: ${url}\n\n";
        return;
    }

    #テンプレートのロード
    my $t = $self->load_template();

    #授業情報
    my $course = $context->{course};
    while ( my ( $k, $v ) = each %{$course} ) {
        if ( !defined $v ) { $v = ""; }
        $t->param( $k => CGI::Utils->new()->escapeHtml($v) );
        if ( $k =~ /^course_(reco)$/ ) {
            $t->param( "${k}_${v}" => 1 );
        }
        elsif ( $k =~ /^course_(intro|memo)$/ ) {
            my $tmp = CGI::Utils->new()->escapeHtml($v);
            $tmp =~ s/\n/<br>/g;
            $t->param( $k => $tmp );
        }
        elsif ( $k =~ /^course_(fee)$/ ) {
            $t->param( "${k}_with_comma" => FCC::Class::String::Conv->new($v)->comma_format() );
        }
    }

    #検索対象のカテゴリー
    my $ccate_id_1 = $course->{course_ccate_id_1};
    if ($ccate_id_1) {
        my $ccate1 = $context->{ccates}->{$ccate_id_1};
        if ($ccate1) {
            $t->param( "ccate_name_1" => CGI::Utils->new()->escapeHtml( $ccate1->{ccate_name} ) );
        }
    }

    my $ccate_id_2 = $course->{course_ccate_id_2};
    if ($ccate_id_2) {
        my $ccate2 = $context->{ccates}->{$ccate_id_2};
        if ($ccate2) {
            $t->param( "ccate_name_2" => CGI::Utils->new()->escapeHtml( $ccate2->{ccate_name} ) );
        }
    }

    #授業一覧
    my $course_intro_chars = $self->{tmpl_loop_params}->{course_loop}->{COURSE_INTRO_CHARS} + 0;
    unless ($course_intro_chars) { $course_intro_chars = 100; }
    my $course_num = scalar @{ $context->{course_list} };
    $t->param( "course_num" => $course_num );
    my @course_loop;
    my $epoch = time;
    for my $ref ( @{ $context->{course_list} } ) {
        my %hash;
        while ( my ( $k, $v ) = each %{$ref} ) {
            $hash{$k} = CGI::Utils->new()->escapeHtml($v);
            if ( $k =~ /^(course_fee)$/ ) {
                $hash{"${k}_with_comma"} = FCC::Class::String::Conv->new($v)->comma_format();
            }
            elsif ( $k eq "course_intro" ) {
                my $s = $v;
                $s =~ s/\x0D\x0A|\x0D|\x0A//g;
                $s =~ s/\s+/ /g;
                $s =~ s/^\s+//;
                $s =~ s/\s+$//;
                my $s2 = FCC::Class::String::Conv->new($s)->truncate_chars( 0, $course_intro_chars );
                if ( $s ne $s2 ) { $s2 .= "…"; }
                $hash{$k} = CGI::Utils->new()->escapeHtml($s2);
            }
        }

        my $ccate_id_1 = $ref->{course_ccate_id_1};
        if ($ccate_id_1) {
            my $ccate_1 = $context->{ccates}->{$ccate_id_1};
            if ($ccate_1) {
                $hash{ccate_name_1} = CGI::Utils->new()->escapeHtml( $ccate_1->{ccate_name} );
            }
        }

        my $ccate_id_2 = $ref->{course_ccate_id_2};
        if ($ccate_id_2) {
            my $ccate_2 = $context->{ccates}->{$ccate_id_2};
            if ($ccate_2) {
                $hash{ccate_name_2} = CGI::Utils->new()->escapeHtml( $ccate_2->{ccate_name} );
            }
        }

        $hash{CGI_URL}    = $self->{conf}->{CGI_URL};
        $hash{static_url} = $self->{conf}->{static_url};
        $hash{epoch}      = $epoch;

        push( @course_loop, \%hash );
    }
    $t->param( "course_loop" => \@course_loop );

    #
    $self->print_html($t);
}

1;
