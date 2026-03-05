package FCC::Action::Admin::CouaddsetAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Admin::_SuperAction);
use FCC::Class::Course;

sub dispatch {
    my ($self) = @_;
    my $context = {};

    #プロセスセッション
    my $pkey = $self->{q}->param("pkey");
    my $proc = $self->get_proc_session_data( $pkey, "couadd" );
    if ( !$proc ) {
        $context->{fatalerrs} = ["不正なリクエストです。"];
        return $context;
    }

    #入力値のname属性値のリスト
    my $in_names = [
        "course_status",     "course_name", "course_copy",       "course_fee",   "course_order_weight", "course_reco",    "course_step", "course_ccate_id_1",
        "course_ccate_id_2", "course_logo", "course_youtube_id","course_youtube_id2","course_syllabus_member","course_syllabus_prof", "course_intro", "course_memo",         "course_logo_up", "course_logo_del"
    ];

    #入力値を取得
    my $in = $self->get_input_data($in_names);
    while ( my ( $k, $v ) = each %{$in} ) {
        $proc->{in}->{$k} = $v;
    }

    # FCC:Class::Courseインスタンス
    my $ocourse = new FCC::Class::Course(
        conf => $self->{conf},
        db   => $self->{db},
        pkey => $pkey,
        q    => $self->{q}
    );

    #入力値チェック
    my @errs = $ocourse->input_check( $in_names, $proc->{in} );

    #エラーハンドリング
    if (@errs) {
        $proc->{errs} = \@errs;
    }
    else {
        $proc->{errs} = [];
        my $course = $ocourse->add( $proc->{in} );
        $proc->{course} = $course;
    }
    #
    $self->set_proc_session_data($proc);
    $context->{proc} = $proc;
    return $context;
}

1;
