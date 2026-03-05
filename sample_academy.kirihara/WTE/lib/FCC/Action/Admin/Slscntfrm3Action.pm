package FCC::Action::Admin::Slscntfrm3Action;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Admin::_SuperAction);
use Date::Pcalc;
use FCC::Class::Salescount;

sub dispatch {
    my ($self) = @_;
    my $context = {};

    my $sdate = $self->{q}->param("s_sdate");
    my $edate = $self->{q}->param("s_edate");
    my $stdate = $self->{q}->param("s_stdate");
    my $etdate = $self->{q}->param("s_etdate");

    unless ($sdate) {
        my ( $Y, $M, $D ) = Date::Pcalc::Today();
        my $D = 1;
        $sdate = $Y . "-" . sprintf( "%02d", $M ) . "-" . sprintf( "%02d", $D );
    }
    unless ($edate) {
        my ( $Y, $M ) = Date::Pcalc::Today();
        my $D = Date::Pcalc::Days_in_Month( $Y, $M );
        $edate = $Y . "-" . sprintf( "%02d", $M ) . "-" . sprintf( "%02d", $D );
    }
    unless ($stdate) {
        my ( $Y, $M, $D ) = Date::Pcalc::Today();
        my ( $Y, $M ) = $M < 2 ? ($Y-1,12): ($Y,$M-3);
        my $D = 1;
        $stdate = $Y . "-" . sprintf( "%02d", $M ) . "-" . sprintf( "%02d", $D );
    }
    unless ($etdate) {
        my ( $Y, $M ) = Date::Pcalc::Today();
        my ( $Y, $M ) = $M < 2 ? ($Y-1,12): ($Y,$M-3);
        my $D = Date::Pcalc::Days_in_Month( $Y, $M );
        $etdate = $Y . "-" . sprintf( "%02d", $M ) . "-" . sprintf( "%02d", $D );
    }

    my $oslscnt =
      new FCC::Class::Salescount( conf => $self->{conf}, db => $self->{db} );
    eval {
        my ( $sepoch, $eepoch ) = $oslscnt->check_date_range( $sdate, $edate );
        my ( $stepoch, $etepoch ) = $oslscnt->check_date_range( $stdate, $etdate );
    };
    if ($@) {
        $context->{fatalerrs} = ["開始日と終了日を正しく入力してください。"];
        return $context;
    }

    my $counts = {

        # クーポン管理 cpnact の「入金（会員登録）」の各レコード合算金額
        "sum_1" => $oslscnt->count1( $sdate, $edate ),

        # ポイント管理 mbract の「出金（有効期限切れ）」の各レコード合算金額
        "sum_2" => $oslscnt->count2( $sdate, $edate ),

        # ポイント管理 mbract の「入金（管理者より付与）」の各レコード合算金額
        "sum_3" => $oslscnt->count3( $sdate, $edate ),

        # クーポン管理 cpnact の「出金（有効期限切れ）」の各レコード合算金額
        "sum_4" => $oslscnt->count4( $sdate, $edate ),

        # レッスン管理 lesson の「完了」「会員緊急キャンセル」「会員放置キャンセル」の各レコード合算金額
        "sum_5" => $oslscnt->count5( $sdate, $edate ),

        # クーポン管理 cpnact の「入金（管理者より付与）」の各レコード合算金額
        "sum_6" => $oslscnt->count6( $sdate, $edate ),

        # ポイント管理 mbract の「出金（動画コースの購入）」の各レコード合算金額
        "sum_7" => $oslscnt->count7( $sdate, $edate ),

        # ポイント管理 mbract の「入金（銀行振込単発チケット購入）」の各レコード合算金額
        "sum_8" => $oslscnt->count8( $sdate, $edate ),

        # カード決済管理 card の各レコード合算金額
        "sum_9" => $oslscnt->count9( $sdate, $edate ),

        # レッスン管理 lesson の「完了」「会員緊急キャンセル」「会員放置キャンセル」の講師配分金額の各レコード合算金額
        "sum_10" => $oslscnt->count10( $sdate, $edate ),

        # レッスン管理 lesson の「入金（モニターチケット付与）」の各レコード合算金額
        "sum_11" => $oslscnt->count11( $sdate, $edate ),

        # クーポン管理 cpnact の「入金（会員登録）」の合算数
        "sum_12" => $oslscnt->count12( $sdate, $edate ),

        # イント管理 mbract の「入金（モニターチケット付与）」の各レコード合算数
        "sum_13" => $oslscnt->count13( $sdate, $edate ),

        # レッスン管理 lesson の「完了」「会員緊急キャンセル」「会員放置キャンセル」の講師配分金額の合算数
        "sum_14" => $oslscnt->count14( $sdate, $edate ),

        # レッスン管理 lesson の「完了」「会員緊急キャンセル」「会員放置キャンセル」の講師配分金額の合算数（クーポンのみ）
        "sum_15" => $oslscnt->count15( $sdate, $edate ),

        # カード決済管理 card の各レコード合算数
        "sum_16" => $oslscnt->count16( $sdate, $edate ),

        # ポイント管理 mbract の「入金（銀行振込単発チケット購入）」の各レコード合算数
        "sum_17" => $oslscnt->count17( $sdate, $edate ),

        # 講師管理 prof の各レコード合算数
        "sum_18" => $oslscnt->count18( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_19" => $oslscnt->count19( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_20" => $oslscnt->count20( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_21" => $oslscnt->count21( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_22" => $oslscnt->count22( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_23" => $oslscnt->count23( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_24" => $oslscnt->count24( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_25" => $oslscnt->count25( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_26" => $oslscnt->count26( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_27" => $oslscnt->count27( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_28" => $oslscnt->count28( $stdate, $etdate ),

        # 会員管理 member の各レコード合算数
        "sum_29" => $oslscnt->count29( $stdate, $etdate ),

        # 会員管理 member の各レコード合算数
        "sum_30" => $oslscnt->count30( $stdate, $etdate ),

        # 会員管理 member の各レコード合算数
        "sum_31" => $oslscnt->count31( $stdate, $etdate ),

        # 会員管理 member の各レコード合算数
        "sum_32" => $oslscnt->count32( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_33" => $oslscnt->count33( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_34" => $oslscnt->count34( $sdate, $edate ),

        # 会員管理 member の各レコード合算数
        "sum_35" => $oslscnt->count35( $sdate, $edate )
    };

    $context->{counts} = $counts;
    $context->{sdate}  = $sdate;
    $context->{edate}  = $edate;
    $context->{stdate}  = $stdate;
    $context->{etdate}  = $etdate;
    return $context;
}

1;
