package FCC::Class::Course;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::_Super);
use Carp;
use Image::Magick;
use Unicode::Japanese;
use Date::Pcalc qw(check_date);
use Clone;
use Encode;
use FCC::Class::Log;
use FCC::Class::String::Checker;
use FCC::Class::Date::Utils;
use FCC::Class::Image::Thumbnail;

sub init {
    my ( $self, %args ) = @_;
    unless ( $args{conf} && $args{db} ) {
        croak "parameters are lacking.";
    }
    $self->{conf} = $args{conf};
    $self->{db}   = $args{db};
    $self->{q}    = $args{q};
    $self->{pkey} = $args{pkey};

    #画像格納ディレクトリの作成
    my $logo_dir = $self->{conf}->{course_logo_dir};
    unless ( -d $logo_dir ) {
        if ( !mkdir $logo_dir, 0777 ) {
            my $msg = "failed to make a directory for course logo images.";
            FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "${msg} : ${logo_dir} : $!" );
            croak $msg;
        }
        if ( !chmod 0777, $logo_dir ) {
            my $msg = "failed to chmod a directory for course logo images.";
            FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "${msg} : ${logo_dir} : $!" );
            croak $msg;
        }
    }
    $self->{logo_dir} = $logo_dir;

    #テンポラリー画像格納ディレクトリの作成
    my $logo_tmp_dir = "${logo_dir}/tmp";
    unless ( -d $logo_tmp_dir ) {
        if ( !mkdir $logo_tmp_dir, 0777 ) {
            my $msg = "failed to make a temporary directory for course logo images.";
            FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "${msg} : ${logo_tmp_dir} : $!" );
            croak $msg;
        }
        if ( !chmod 0777, $logo_tmp_dir ) {
            my $msg = "failed to chmod a temporary directory for course logo images.";
            FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "${msg} : ${logo_tmp_dir} : $!" );
            croak $msg;
        }
    }
    $self->{logo_tmp_dir}     = $logo_tmp_dir;
    $self->{logo_tmp_dir_url} = "$self->{conf}->{course_logo_dir_url}/tmp";

    #coursesテーブルの全カラム名のリスト
    $self->{table_cols} = {
        course_id           => "授業識別ID",
        prof_id             => "講師識別ID",
        course_cdate        => "登録日時",
        course_mdate        => "最終更新日時",
        course_status       => "ステータス",
        course_name         => "授業名",
        course_copy         => "キャチコピー",
        course_fee          => "必要ポイント",
        course_score        => "人気スコア",
        course_order_weight => "順位係数",
        course_reco         => "オススメ・フラグ",
        course_step         => "トークタイムの単位時間（分）",
        course_ccate_id_1   => "大カテゴリー",
        course_ccate_id_2   => "小カテゴリー",
        course_logo         => "アイキャッチ写真",
        course_youtube_id   => "教材1",
        course_youtube_id2  => "教材2",
        course_intro        => "内容詳細",
        course_memo         => "運営側メモ",
        course_syllabus_member   => "シラバス（会員）",
        course_syllabus_prof     => "シラバス（講師）"
    };

    #CSVの各カラム名と名称とepoch秒フラグ（course_idは必ず0番目にセットすること）
    my $prof_caption        = $self->{conf}->{prof_caption};
    my $prof_handle_caption = $self->{conf}->{prof_handle_caption};

    $self->{csv_cols} = [
        [ "courses.course_id", "授業識別ID" ],
        [ "courses.prof_id",   "${prof_caption}識別ID" ],
        [ "profs.prof_status", "${prof_caption}ステータス" ],
        [ "profs.prof_handle", "${prof_caption}${prof_handle_caption}" ],
        [ "courses.course_cdate",        "登録日時",       1 ],
        [ "courses.course_mdate",        "最終更新日時", 1 ],
        [ "courses.course_status",       "ステータス" ],
        [ "courses.course_name",         "授業名" ],
        [ "courses.course_copy",         "キャチコピー" ],
        [ "courses.course_fee",          "必要ポイント" ],
        [ "courses.course_score",        "人気スコア" ],
        [ "courses.course_order_weight", "順位係数" ],
        [ "courses.course_reco",         "オススメ・フラグ" ],
        [ "courses.course_step",         "トークタイムの単位時間（分）" ],
        [ "courses.course_ccate_id_1",   "大カテゴリー" ],
        [ "courses.course_ccate_id_2",   "小カテゴリー" ],
        [ "courses.course_logo",         "アイキャッチ写真" ],
        [ "courses.course_youtube_id",   "教材1" ],
        [ "courses.course_youtube_id2",   "教材2" ],
        [ "courses.course_intro",        "内容詳細" ],
        [ "courses.course_memo",         "運営側メモ" ]
    ];
}

#---------------------------------------------------------------------
#■登録・編集の入力チェック
#---------------------------------------------------------------------
#[引数]
#	1.入力データのキーのarrayref（必須）
#	2.入力データのhashref（必須）
#	3.モード（add or mod）指定がない場合は add として処理される
#[戻り値]
#	エラー情報を格納した配列を返す。
#---------------------------------------------------------------------
sub input_check {
    my ( $self, $names, $in, $mode ) = @_;

    #プロセスキーのチェック
    if ( !defined $self->{pkey} ) {
        croak "pkey attribute is required.";
    }
    elsif ( $self->{pkey} eq "" || $self->{pkey} !~ /^[a-fA-F0-9]{32}$/ ) {
        croak "pkey attribute is invalid.";
    }
    my @tm = FCC::Class::Date::Utils->new( time => time, tz => $self->{conf}->{tz} )->get();

    #入力値のチェック
    my @errs;
    for my $k ( @{$names} ) {
        my $v = $in->{$k};
        if ( !defined $v ) { $v = ""; }
        my $len     = FCC::Class::String::Checker->new( $v, "utf8" )->get_char_num();
        my $caption = $self->{conf}->{"${k}_caption"};
        unless ($caption) {
            $caption = $self->{table_cols}->{$k};
        }

        #ステータス
        if ( $k eq "course_status" ) {
            if ( $v eq "" ) {
                push( @errs, [ $k, "\"${caption}\" は必須です。" ] );
            }
            elsif ( $v !~ /^(0|1|2)$/ ) {
                push( @errs, [ $k, "\"${caption}\" に不正な値が送信されました。" ] );
            }
        }

        #授業名
        elsif ( $k eq "course_name" ) {
            if ( $v eq "" ) {
                push( @errs, [ $k, "\"${caption}\" は必須です。" ] );
            }
            elsif ( $len > 100 ) {
                push( @errs, [ $k, "\"${caption}\" は100文字以内で入力してください。" ] );
            }
        }

        #キャッチコピー
        elsif ( $k eq "course_copy" ) {
            if ( $v eq "" ) {

            }
            elsif ( $len > 255 ) {
                push( @errs, [ $k, "\"${caption}\" は255文字以内で入力してください。" ] );
            }
        }

        #必要ポイント
        elsif ( $k eq "course_fee" ) {
            if ( $v eq "" ) {
                push( @errs, [ $k, "\"${caption}\" は必須です。" ] );
            }
            elsif ( $v =~ /[^\d]/ ) {
                push( @errs, [ $k, "\"${caption}\" は半角数字で入力してください。" ] );
            }
            elsif ( $v < 0 || $v > 999999 ) {
                push( @errs, [ $k, "\"${caption}\" は 0 ～ 999,999 の金額を入力してください。" ] );
            }
        }

        #大カテゴリー
        elsif ( $k eq "course_ccate_id_1" ) {
            if ( $v eq "" ) {
                push( @errs, [ $k, "\"${caption}\" は必須です。" ] );
            }
            elsif ( $v =~ /[^\d]/ || $v < 0 ) {
                push( @errs, [ $k, "\"${caption}\" に不正な値が送信されました。" ] );
            }
        }

        #小カテゴリー
        elsif ( $k eq "course_ccate_id_2" ) {
            if ( $v eq "" ) {

            }
            elsif ( $v =~ /[^\d]/ || $v < 0 ) {
                push( @errs, [ $k, "\"${caption}\" に不正な値が送信されました。" ] );
            }
        }

        #順位係数
        elsif ( $k eq "course_order_weight" ) {
            if ( $v eq "" ) {
                push( @errs, [ $k, "\"${caption}\" は必須です。" ] );
            }
            elsif ( $v =~ /[^\d]/ ) {
                push( @errs, [ $k, "\"${caption}\" は半角数字で指定してください。" ] );
            }
            elsif ( $v < 0 || $v > 255 ) {
                push( @errs, [ $k, "\"${caption}\" は0～255の数字で指定してください。" ] );
            }
        }

        #オススメ・フラグ
        elsif ( $k eq "course_reco" ) {
            unless ($v) { $v = 0; }
            if ( $v !~ /^(0|1)$/ ) {
                push( @errs, [ $k, "\"${caption}\" に不正な値が送信されました。" ] );
            }
            else {
                $in->{$k} = $v;
            }
        }

        #トークタイムの単位時間（分）
        elsif ( $k eq "course_step" ) {
            if ( $v eq "" ) {
                push( @errs, [ $k, "\"${caption}\" は必須です。" ] );
            }
            elsif ( $v !~ /^(30|60|90|120)$/ ) {
                push( @errs, [ $k, "\"${caption}\" に不正な値が送信されました。" ] );
            }
        }

        #Youtube ID
        elsif ( $k eq "course_youtube_id" ) {
            if ( $v eq "" ) {

            }
            elsif ( $len > 255 ) {
                push( @errs, [ $k, "\"${caption}\" は255文字以内で入力してください。" ] );
            }
            #elsif ( $v =~ /[^\x21-\x7e]/ ) {
            #    push( @errs, [ $k, "\"${caption}\" に不適切な文字が含まれています。" ] );
            #}
        }

        #Youtube ID
        elsif ( $k eq "course_youtube_id2" ) {
            if ( $v eq "" ) {

            }
            elsif ( $len > 255 ) {
                push( @errs, [ $k, "\"${caption}\" は255文字以内で入力してください。" ] );
            }
            #elsif ( $v =~ /[^\x21-\x7e]/ ) {
            #    push( @errs, [ $k, "\"${caption}\" に不適切な文字が含まれています。" ] );
            #}
        }

        #シラバス（会員）
        elsif ( $k eq "course_syllabus_member" ) {
            if ( $v eq "" ) {

            }
            elsif ( $len > 255 ) {
                push( @errs, [ $k, "\"${caption}\" は255文字以内で入力してください。" ] );
            }
            #elsif ( $v =~ /[^\x21-\x7e]/ ) {
            #    push( @errs, [ $k, "\"${caption}\" に不適切な文字が含まれています。" ] );
            #}
        }

        #シラバス（講師）
        elsif ( $k eq "course_syllabus_prof" ) {
            if ( $v eq "" ) {

            }
            elsif ( $len > 255 ) {
                push( @errs, [ $k, "\"${caption}\" は255文字以内で入力してください。" ] );
            }
            #elsif ( $v =~ /[^\x21-\x7e]/ ) {
            #    push( @errs, [ $k, "\"${caption}\" に不適切な文字が含まれています。" ] );
            #}
        }

        #内容詳細
        elsif ( $k eq "course_intro" ) {
            if ( $v eq "" ) {
                push( @errs, [ $k, "\"${caption}\" は必須です。" ] );
            }
            elsif ( $len > 3000 ) {
                push( @errs, [ $k, "\"${caption}\" は3000文字以内で入力してください。" ] );
            }
        }

        #運営側メモ
        elsif ( $k eq "course_memo" ) {
            if ( $v ne "" ) {
                if ( $len > 1000 ) {
                    push( @errs, [ $k, "\"${caption}\" は1000文字以内で入力してください。" ] );
                }
            }
        }

        #アイキャッチ写真
        elsif ( $k eq "course_logo_up" ) {
            my $caption = $self->{conf}->{"course_logo_caption"};
            if ( !defined $v || !$v ) {
                next;
            }

            #画像ファイルをテンポラリファイルとして保存
            my $fh = $self->{q}->upload($k);
            unless ($fh) { next; }
            binmode($fh);
            my $tmp_file = "$self->{logo_tmp_dir}/$self->{pkey}";
            my $tmpfh;
            unless ( open $tmpfh, ">", $tmp_file ) {
                my $msg = "failed to copy the uploaded file on disk. $!";
                FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "${msg} : ${tmp_file} : $!" );
                croak $msg;
            }
            binmode($tmpfh);
            while (<$fh>) {
                print $tmpfh $_;
            }
            close($tmpfh);
            chmod 0666, $tmp_file;

            #アップロードファイルの画像情報を取得
            my $im = Image::Magick->new;
            my ( $width, $height, $size, $format ) = $im->Ping($tmp_file);

            #画像ファイルサイズのチェック
            if ( $size > $self->{conf}->{course_logo_max_size} * 1024 * 1024 ) {
                push( @errs, [ $k, "\"${caption}\" のファイルサイズは $self->{conf}->{course_logo_max_size}MB 以内としてください。" ] );
                next;
            }

            #画像フォーマットのチェック
            if ( $format !~ /^(jpeg|jpg|png|gif)$/i ) {
                push( @errs, [ $k, "\"${caption}\" の画像形式はJPEG/PNG/GIFのいずれかとしてください。: ${format}" ] );
                next;
            }

            #サムネイル化
            eval {
                for ( my $s = 1 ; $s <= 3 ; $s++ ) {
                    my $out_path = "$self->{logo_tmp_dir}/$self->{pkey}.${s}.$self->{conf}->{course_logo_ext}";
                    my $thumb    = new FCC::Class::Image::Thumbnail(
                        in_file      => $tmp_file,
                        out_file     => $out_path,
                        frame_width  => $self->{conf}->{"course_logo_${s}_w"},
                        frame_height => $self->{conf}->{"course_logo_${s}_h"},
                        quality      => 100,
                        bgcolor      => ""
                    );
                    $thumb->make();
                }
            };
            if ($@) {
                push( @errs, [ $k, "\"${caption}\" のサムネイル化に失敗しました。" ] );
                FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "failed to make thumbnails of the uploaded file. : $@" );
                next;
            }

            #オリジナル画像を削除
            unlink $tmp_file;

            #サムネイル情報を $in にセット
            for ( my $s = 1 ; $s <= 3 ; $s++ ) {
                $in->{"course_logo_${s}_tmp"}     = "$self->{logo_tmp_dir}/$self->{pkey}.${s}.$self->{conf}->{course_logo_ext}";
                $in->{"course_logo_${s}_tmp_url"} = "$self->{logo_tmp_dir_url}/$self->{pkey}.${s}.$self->{conf}->{course_logo_ext}";
            }
            #
            $in->{$k} = 1;
        }

        #アイキャッチ写真の取り消しフラグ
        elsif ( $k eq "course_logo_del" ) {
            if ( $v eq "1" ) {
                $in->{course_logo} = 0;
                for ( my $s = 1 ; $s <= 3 ; $s++ ) {
                    delete $in->{"course_logo_${s}_tmp"};
                    delete $in->{"course_logo_${s}_tmp_url"};
                    unlink "$self->{logo_tmp_dir}/$self->{pkey}.${s}.$self->{conf}->{course_logo_ext}";
                }
            }
        }
    }

    if ( -e "$self->{logo_tmp_dir}/$self->{pkey}.1.$self->{conf}->{course_logo_ext}" ) {
        $in->{course_logo_up} = 1;
    }
    else {
        $in->{course_logo_up} = 0;
    }

    return @errs;
}

#---------------------------------------------------------------------
#■新規登録
#---------------------------------------------------------------------
#[引数]
#	1.入力データのhashref（必須）
#[戻り値]
#	成功すれば登録データのhashrefを返す。
#	失敗すればcroakする。
#---------------------------------------------------------------------
sub add {
    my ( $self, $ref ) = @_;

    #プロセスキーのチェック
    if ( !defined $self->{pkey} ) {
        croak "pkey attribute is required.";
    }
    elsif ( $self->{pkey} eq "" || $self->{pkey} !~ /^[a-fA-F0-9]{32}$/ ) {
        croak "pkey attribute is invalid.";
    }

    #DB接続
    my $dbh = $self->{db}->connect_db();

    my $rec = {};
    while ( my ( $k, $v ) = each %{$ref} ) {
        unless ( exists $self->{table_cols}->{$k} ) { next; }
        if ( defined $v ) {
            $rec->{$k} = $v;
        }
        else {
            $rec->{$k} = "";
        }
    }
    my $now = time;
    $rec->{course_cdate} = $now;
    $rec->{course_mdate} = $now;

    if ( $ref->{course_logo_up} ) {
        $rec->{course_logo} = 1;
    }
    else {
        $rec->{course_logo} = 0;
    }

    if(defined $rec->{course_ccate_id_1}) {
        unless($rec->{course_ccate_id_1}) {
            $rec->{course_ccate_id_1} = "0";
        }
    }
    if(defined $rec->{course_ccate_id_2}) {
        unless($rec->{course_ccate_id_2}) {
            $rec->{course_ccate_id_2} = "0";
        }
    }

    #SQL生成
    my $sql;
    my @klist;
    my @vlist;
    while ( my ( $k, $v ) = each %{$rec} ) {
        push( @klist, $k );
        my $q_v;
        if ( $v eq "" ) {
            $q_v = "NULL";
        }
        else {
            $q_v = $dbh->quote($v);
        }
        push( @vlist, $q_v );
    }
    $sql = "INSERT INTO courses (" . join( ",", @klist ) . ") VALUES (" . join( ",", @vlist ) . ")";

    #INSERT
    my $course_id;
    my $last_sql;
    eval {
        $last_sql = $sql;
        $dbh->do($last_sql);
        $course_id = $dbh->{mysql_insertid};
        $dbh->commit();
    };
    if ($@) {
        $dbh->rollback();
        my $msg = "failed to insert a record to courses table.";
        FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "${msg} : $@ : ${last_sql}" );
        croak $msg;
    }

    #サムネイル画像をテンポラリディレクトリから移動
    if ( defined $rec->{course_logo} && $rec->{course_logo} == 1 ) {
        for ( my $s = 1 ; $s <= 3 ; $s++ ) {
            my $org_file = "$self->{logo_tmp_dir}/$self->{pkey}.${s}.$self->{conf}->{course_logo_ext}";
            my $new_file = "$self->{logo_dir}/${course_id}.${s}.$self->{conf}->{course_logo_ext}";
            if ( !rename $org_file, $new_file ) {
                my $msg = "failed to move a logo image. : ${org_file} : ${new_file}";
                FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", $msg );
            }
        }
    }

    #情報を取得
    my $course = $self->get($course_id);
    #
    return $course;
}

#---------------------------------------------------------------------
#■修正
#---------------------------------------------------------------------
#[引数]
#	1.入力データのhashref（必須）
#[戻り値]
#	成功すれば登録データのhashrefを返す。
#	もし存在しないad_idが指定されたら、未定義値を返す
#	失敗すればcroakする。
#---------------------------------------------------------------------
sub mod {
    my ( $self, $ref ) = @_;

    #識別IDのチェック
    my $course_id = $ref->{course_id};
    if ( !defined $course_id || $course_id =~ /[^\d]/ ) {
        croak "the value of course_id in parameters is invalid.";
    }

    #DB接続
    my $dbh = $self->{db}->connect_db();

    #更新情報をhashrefに格納
    my $rec = {};
    while ( my ( $k, $v ) = each %{$ref} ) {
        unless ( exists $self->{table_cols}->{$k} ) { next; }
        if     ( $k eq "course_id" )                { next; }
        if     ( defined $v ) {
            $rec->{$k} = $v;
        }
        else {
            $rec->{$k} = "";
        }
    }

    my $now = time;
    $rec->{course_mdate} = $now;

    if ( $ref->{course_logo_up} ) {
        $rec->{course_logo} = 1;
    }
    elsif ( $ref->{course_logo_del} ) {
        $rec->{course_logo} = 0;
    }
    else {
        delete $rec->{course_logo};
    }

    if(defined $rec->{course_ccate_id_1}) {
        unless($rec->{course_ccate_id_1}) {
            $rec->{course_ccate_id_1} = "0";
        }
    }
    if(defined $rec->{course_ccate_id_2}) {
        unless($rec->{course_ccate_id_2}) {
            $rec->{course_ccate_id_2} = "0";
        }
    }

    #SQL生成
    my @sets;
    while ( my ( $k, $v ) = each %{$rec} ) {
        my $q_v;
        if ( $v eq "" ) {
            $q_v = "NULL";
        }
        else {
            $q_v = $dbh->quote($v);
        }
        push( @sets, "${k}=${q_v}" );
    }
    my $sql = "UPDATE courses SET " . join( ",", @sets ) . " WHERE course_id=${course_id}";

    #UPDATE
    my $updated;
    my $last_sql;
    eval {
        $last_sql = $sql;
        $updated  = $dbh->do($last_sql);
        $dbh->commit();
    };
    if ($@) {
        $dbh->rollback();
        my $msg = "failed to update a course record in courses table.";
        FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "${msg} : $@ : ${last_sql}" );
        croak $msg;
    }

    #対象のレコードがなければundefを返す
    if ( $updated == 0 ) {
        return undef;
    }

    #サムネイル画像をテンポラリディレクトリから移動
    if ( $ref->{course_logo_up} ) {
        for ( my $s = 1 ; $s <= 3 ; $s++ ) {
            my $org_file = "$self->{logo_tmp_dir}/$self->{pkey}.${s}.$self->{conf}->{course_logo_ext}";
            my $new_file = "$self->{logo_dir}/${course_id}.${s}.$self->{conf}->{course_logo_ext}";
            if ( !rename $org_file, $new_file ) {
                my $msg = "failed to move a logo image. : ${org_file} : ${new_file}";
                FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", $msg );
            }
        }
    }
    elsif ( $ref->{course_logo_del} ) {
        for ( my $s = 1 ; $s <= 3 ; $s++ ) {
            unlink "$self->{logo_dir}/${course_id}.${s}.$self->{conf}->{course_logo_ext}";
        }
    }

    #情報を取得
    my $course_new = $self->get($course_id);
    #
    return $course_new;
}

#---------------------------------------------------------------------
#■削除
#---------------------------------------------------------------------
#[引数]
#	1.識別ID（必須）
#[戻り値]
#	成功すれば削除データのhashrefを返す。
#	もし存在しないcourse_idが指定されたら、未定義値を返す
#	失敗すればcroakする。
#---------------------------------------------------------------------
sub del {
    my ( $self, $course_id ) = @_;

    #識別IDのチェック
    if ( !defined $course_id || $course_id =~ /[^\d]/ ) {
        croak "the value of course_id in parameters is invalid.";
    }

    #DB接続
    my $dbh = $self->{db}->connect_db();

    #情報を取得
    my $course = $self->get($course_id);

    #Delete
    my $deleted;
    my $last_sql;
    eval {
        my $sql = "DELETE FROM courses WHERE course_id=${course_id}";
        $last_sql = $sql;
        $deleted  = $dbh->do($sql);
        $dbh->commit();
    };
    if ($@) {
        $dbh->rollback();
        my $msg = "failed to delete a course record in courses table.";
        FCC::Class::Log->new( conf => $self->{conf} )->loging( "error", "${msg} : $@ : ${last_sql}" );
        croak $msg;
    }

    #対象のレコードがなければundefを返す
    if ( $deleted == 0 ) {
        return undef;
    }

    #画像を削除
    for ( my $s = 1 ; $s <= 3 ; $s++ ) {
        unlink "$self->{logo_dir}/${course_id}.${s}.$self->{conf}->{course_logo_ext}";
    }
    #
    return $course;
}

#---------------------------------------------------------------------
#■識別IDからDBレコードを取得
#---------------------------------------------------------------------
#[引数]
#	1.識別ID（必須）
#[戻り値]
#	全設定情報を格納したhashrefを返す。
#---------------------------------------------------------------------
sub get {
    my ( $self, $course_id ) = @_;
    if ( !defined $course_id || $course_id =~ /[^\d]/ ) {
        croak "the value of course_id is invalid.";
    }
    my $dbh = $self->{db}->connect_db();

    my $sql = "SELECT courses.*,";
    $sql .= " profs.prof_id, profs.prof_status, profs.prof_handle, profs.prof_logo, profs.prof_intro";
    $sql .= " FROM courses";
    $sql .= " LEFT JOIN profs ON courses.prof_id=profs.prof_id";
    $sql .= " WHERE course_id=${course_id}";

    my $ref = $dbh->selectrow_hashref($sql);
    if ($ref) {
        $self->add_info($ref);
    }
    return $ref;
}

#---------------------------------------------------------------------
#■DBレコードを検索してCSV形式で返す
#---------------------------------------------------------------------
#[引数]
#  1.検索パラメータを格納したhashref（必須ではない）
#    {
#      course_id => 識別ID,
#      prof_id => 講師識別ID,
#      prof_status => 講師ステータス (0 or 1),
#      course_fee => 必要ポイント（xx以下という検索条件になる）,
#      course_intro => 詳細内容,
#      course_reco => オススメ・フラグ,
#      course_status => ステータス,
#      course_ccate_id_1 => 大カテゴリーID,
#      course_ccate_id_2 => 小カテゴリーID,
#      sort => ソート条件のarrayref [ [ソートカラム名, 順序(ASC|DESC)], ... ]
#      charcode => 文字コード（utf8, sjis, euc-jpのいずれか。デフォルトはsjis）,
#      returncode => 改行コード（指定がなければLF）
#    }
#
#  上記パラメータに指定がなかった場合のでフォルト値
#
#    {
#      sort =>[ ['course_id', "DESC"] ]
#    }
#
#[戻り値]
#  検索結果を格納したhashref
#    {
#      tsv => CSVデータ,
#      length => CSVデータのサイズ（バイト）
#    }
#  失敗すればcroakする。
#---------------------------------------------------------------------
sub get_csv {
    my ( $self, $in_params ) = @_;
    if ( defined $in_params && ref($in_params) ne "HASH" ) {
        croak "the 1st argument is invaiid.";
    }

    #指定の検索条件を新たなhashrefに格納
    my $params         = {};
    my @param_key_list = ( 'course_id', 'prof_id', 'prof_status', 'course_fee', 'course_intro', 'course_reco', 'course_status', 'course_ccate_id_1', 'course_ccate_id_2', 'sort', 'sort_key', 'charcode', 'returncode' );

    if ( defined $in_params ) {
        for my $k (@param_key_list) {
            if ( defined $in_params->{$k} && $in_params->{$k} ne "" ) {
                $params->{$k} = $in_params->{$k};
            }
        }
    }

    #検索条件にデフォルト値をセット
    my $defaults = {
        offset => 0,
        limit  => 20,
        sort   => [ [ 'course_id', "DESC" ] ]
    };
    while ( my ( $k, $v ) = each %{$defaults} ) {
        if ( !defined $params->{$k} && defined $v ) {
            $params->{$k} = $v;
        }
    }

    #検索条件のチェック
    while ( my ( $k, $v ) = each %{$params} ) {
        if ( $k eq "course_id" ) {
            if ( $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
        }
        elsif ( $k eq "prof_id" ) {
            if ( $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
        }
        elsif ( $k eq "prof_status" ) {
            if ( $v !~ /^(0|1)$/ ) {
                croak "the value of ${k} in parameters is invalid.";
            }
            $params->{$k} = $v + 0;
        }
        elsif ( $k eq "course_fee" ) {
            if ( $v eq "" || $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v + 0;
            }
        }
        elsif ( $k eq "course_intro" ) {
            if ( $v eq "" ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v;
            }
        }
        elsif ( $k eq "course_reco" ) {
            if ( $v eq "" || $v ne "1" ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v;
            }
        }
        elsif ( $k eq "course_status" ) {
            if ( $v !~ /^(0|1)$/ ) {
                croak "the value of ${k} in parameters is invalid.";
            }
            $params->{$k} = $v + 0;
        }
        elsif ( $k =~ /^course_ccate_id_\d$/ ) {
            if ( $v eq "" || $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v + 0;
            }
        }
        elsif ( $k eq "sort" ) {
            if ( ref($v) ne "ARRAY" ) {
                croak "the value of sort in parameters is invalid.";
            }
            for my $ary ( @{$v} ) {
                if ( ref($ary) ne "ARRAY" ) {
                    croak "the value of sort in parameters is invalid.";
                }
                my $key   = $ary->[0];
                my $order = $ary->[1];
                if ( $key !~ /^(course_id|course_score|course_order_weight|course_fee)$/ ) {
                    croak "the value of sort in parameters is invalid.";
                }
                if ( $order !~ /^(ASC|DESC)$/ ) {
                    croak "the value of sort in parameters is invalid.";
                }
            }
        }
    }
    #
    if ( defined $params->{charcode} ) {
        if ( $params->{charcode} !~ /^(utf8|sjis|euc\-jp)$/ ) {
            croak "the value of charcode is invalid.";
        }
    }
    else {
        $params->{charcode} = "sjis";
    }
    if ( defined $params->{returncode} ) {
        if ( $params->{returncode} !~ /^(\x0d\x0a|\x0d|\x0a)$/ ) {
            croak "the value of returncode is invalid.";
        }
    }
    else {
        $params->{returncode} = "\x0a";
    }

    #カラムの一覧
    my @col_list;
    my @col_name_list;
    my @col_epoch_index_list;
    for ( my $i = 0 ; $i < @{ $self->{csv_cols} } ; $i++ ) {
        my $r = $self->{csv_cols}->[$i];
        push( @col_list,      $r->[0] );
        push( @col_name_list, $r->[1] );
        if ( $r->[2] ) {
            push( @col_epoch_index_list, $i );
        }
    }

    #ヘッダー行
    my $head_line = $self->make_csv_line( \@col_name_list );
    if ( $params->{charcode} ne "utf8" ) {
        $head_line = Unicode::Japanese->new( $head_line, "utf8" )->conv( $params->{charcode} );
    }
    my $csv = $head_line . $params->{returncode};

    #DB接続
    my $dbh = $self->{db}->connect_db();

    #SQLのWHERE句
    my @wheres;
    if ( defined $params->{course_id} ) {
        my $v = $params->{course_id};
        push( @wheres, "courses.course_id=${v}" );
    }
    if ( defined $params->{prof_id} ) {
        my $v = $params->{prof_id};
        push( @wheres, "courses.prof_id=${v}" );
    }
    if ( defined $params->{prof_status} ) {
        my $v = $params->{course_status};
        push( @wheres, "profs.prof_status=${v}" );
    }
    if ( defined $params->{course_fee} ) {
        my $v = $params->{course_fee};
        push( @wheres, "courses.course_fee<=${v}" );
    }
    if ( defined $params->{course_intro} ) {
        my $v   = $params->{course_intro};
        my $q_v = $dbh->quote($v);
        $q_v =~ s/^\'//;
        $q_v =~ s/\'$//;
        push( @wheres, "courses.course_intro LIKE '\%${q_v}\%'" );
    }
    if ( defined $params->{course_reco} ) {
        my $v = $params->{course_reco};
        push( @wheres, "courses.course_reco=${v}" );
    }
    if ( defined $params->{course_status} ) {
        my $v = $params->{course_status};
        push( @wheres, "courses.course_status=${v}" );
    }
    if ( defined $params->{course_ccate_id_1} ) {
        my $v = $params->{course_ccate_id_1};
        push( @wheres, "courses.course_ccate_id_1=${v}" );
    }
    if ( defined $params->{course_ccate_id_2} ) {
        my $v = $params->{course_ccate_id_2};
        push( @wheres, "courses.course_ccate_id_2=${v}" );
    }

    #SELECT
    my @list;
    {
        my $sql = "SELECT " . join( ",", @col_list ) . " FROM courses";
        $sql .= " LEFT JOIN profs ON courses.prof_id=profs.prof_id";
        if (@wheres) {
            my $where = join( " AND ", @wheres );
            $sql .= " WHERE ${where}";
        }
        if ( defined $params->{sort} && @{ $params->{sort} } > 0 ) {
            my @pairs;
            for my $ary ( @{ $params->{sort} } ) {
                my $k = $ary->[0];
                my $v = $ary->[1];
                push( @pairs, "courses.${k} ${v}" );
            }
            $sql .= " ORDER BY " . join( ",", @pairs );
        }
        #
        my $sth = $dbh->prepare($sql);
        $sth->execute();
        while ( my $ref = $sth->fetchrow_arrayref ) {
            for my $idx (@col_epoch_index_list) {
                my @tm = FCC::Class::Date::Utils->new(
                    time => $ref->[$idx],
                    tz   => $self->{conf}->{tz}
                )->get(1);
                $ref->[$idx] = "$tm[0]-$tm[1]-$tm[2] $tm[3]:$tm[4]:$tm[5]";
            }
            for ( my $i = 0 ; $i < @{$ref} ; $i++ ) {
                my $v = $ref->[$i];
                if ( !defined $v ) {
                    $ref->[$i] = "";
                }
                elsif ( $v =~ /^\-(\d+)$/ ) {
                    $ref->[$i] = $1;
                }
            }
            my $line = $self->make_csv_line($ref);
            $line =~ s/(\x0d|\x0a)//g;
            if ( $params->{charcode} ne "utf8" ) {
                $line = Unicode::Japanese->new( $line, "utf8" )->conv( $params->{charcode} );
            }
            $csv .= "${line}$params->{returncode}";
        }
        $sth->finish();
    }
    #
    my $res = {};
    $res->{csv}    = $csv;
    $res->{length} = length $csv;
    #
    return $res;
}

sub make_csv_line {
    my ( $self, $ary ) = @_;
    my @cols;
    for my $elm ( @{$ary} ) {
        my $v = $elm;
        $v =~ s/\"/\"\"/g;
        $v = '"' . $v . '"';
        push( @cols, $v );
    }
    my $line = join( ",", @cols );
    return $line;
}

#---------------------------------------------------------------------
#■DBレコードを検索してリストで取得
#---------------------------------------------------------------------
#[引数]
#  1.検索パラメータを格納したhashref（必須ではない）
#    {
#      course_id => 識別ID,
#      prof_id => 講師識別ID,
#      prof_status => 講師ステータス (0 or 1),
#      course_fee => 必要ポイント（xx以下という検索条件になる）,
#      course_intro => 詳細内容,
#      course_reco => オススメ・フラグ,
#      course_status => ステータス,
#      course_ccate_id_1 => 大カテゴリーID,
#      course_ccate_id_2 => 小カテゴリーID,
#      sort => ソート条件のarrayref [ [ソートカラム名, 順序(ASC|DESC)], ... ]
#      charcode => 文字コード（utf8, sjis, euc-jpのいずれか。デフォルトはsjis）,
#      returncode => 改行コード（指定がなければLF）
#    }
#
#    上記パラメータに指定がなかった場合のでフォルト値
#      {
#        offset => 0,
#        limit => 20,
#        sort =>[ ['course_id', "DESC"] ]
#      }
#
#[戻り値]
#  検索結果を格納したhashref
#  {
#    list => 各レコードを格納したhashrefのarrayref,
#    hit => 検索ヒット数,
#    fetch => フェッチしたレコード数,
#    start => 取り出したレコードの開始番号（offset+1, ただしhit=0の場合はstartも0となる）,
#    end => 取り出したレコードの終了番号（offset+fetch, ただしhit=0の場合はendも0となる）,
#    params => 検索条件を格納したhashref
#  }
#  失敗すればcroakする。
#---------------------------------------------------------------------
sub get_list {
    my ( $self, $in_params ) = @_;
    if ( defined $in_params && ref($in_params) ne "HASH" ) {
        croak "the 1st argument is invaiid.";
    }

    #指定の検索条件を新たなhashrefに格納
    my $params         = {};
    my @param_key_list = ( 'course_id', 'prof_id', 'prof_status', 'course_fee', 'course_intro', 'course_reco', 'course_status', 'course_ccate_id_1', 'course_ccate_id_2', 'offset', 'limit', 'sort_key', 'sort', );
    if ( defined $in_params ) {
        for my $k (@param_key_list) {
            if ( defined $in_params->{$k} && $in_params->{$k} ne "" ) {
                $params->{$k} = $in_params->{$k};
            }
        }
    }

    #検索条件にデフォルト値をセット
    my $defaults = {
        offset => 0,
        limit  => 20,
        sort   => [ [ 'course_id', "DESC" ] ]
    };
    while ( my ( $k, $v ) = each %{$defaults} ) {
        if ( !defined $params->{$k} && defined $v ) {
            $params->{$k} = $v;
        }
    }

    #検索条件のチェック
    while ( my ( $k, $v ) = each %{$params} ) {
        if ( $k eq "course_id" ) {
            if ( $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
        }
        elsif ( $k eq "prof_id" ) {
            if ( $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
        }
        elsif ( $k eq "prof_status" ) {
            if ( $v !~ /^(0|1)$/ ) {
                croak "the value of ${k} in parameters is invalid.";
            }
            $params->{$k} = $v + 0;
        }
        elsif ( $k eq "course_fee" ) {
            if ( $v eq "" || $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v + 0;
            }
        }
        elsif ( $k eq "course_intro" ) {
            if ( $v eq "" ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v;
            }
        }
        elsif ( $k eq "course_reco" ) {
            if ( $v eq "" || $v ne "1" ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v;
            }
        }
        elsif ( $k eq "course_status" ) {
            if ( $v !~ /^(0|1)$/ ) {
                croak "the value of ${k} in parameters is invalid.";
            }
            $params->{$k} = $v + 0;
        }
        elsif ( $k =~ /^course_ccate_id_\d$/ ) {
            if ( $v eq "" || $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v + 0;
            }
        }
        elsif ( $k eq "offset" ) {
            if ( $v =~ /[^\d]/ ) {
                croak "the value of offset in parameters is invalid.";
            }
            $params->{$k} = $v + 0;
        }
        elsif ( $k eq "limit" ) {
            if ( $v =~ /[^\d]/ ) {
                croak "the value of limit in parameters is invalid.";
            }
            $params->{$k} = $v + 0;
        }
        elsif ( $k eq "sort" ) {
            if ( ref($v) ne "ARRAY" ) {
                croak "the value of sort in parameters is invalid.";
            }
            for my $ary ( @{$v} ) {
                if ( ref($ary) ne "ARRAY" ) {
                    croak "the value of sort in parameters is invalid.";
                }
                my $key   = $ary->[0];
                my $order = $ary->[1];
                if ( $key !~ /^(course_id|course_score|course_order_weight|course_fee)$/ ) {
                    croak "the value of sort in parameters is invalid.";
                }
                if ( $order !~ /^(ASC|DESC)$/ ) {
                    croak "the value of sort in parameters is invalid.";
                }
            }
        }
    }

    #DB接続
    my $dbh = $self->{db}->connect_db();

    #SQLのWHERE句
    my @wheres;
    if ( defined $params->{course_id} ) {
        my $v = $params->{course_id};
        push( @wheres, "courses.course_id=${v}" );
    }
    if ( defined $params->{prof_id} ) {
        my $v = $params->{prof_id};
        push( @wheres, "courses.prof_id=${v}" );
    }
    if ( defined $params->{prof_status} ) {
        my $v = $params->{prof_status};
        push( @wheres, "profs.prof_status=${v}" );
    }
    if ( defined $params->{course_fee} ) {
        my $v = $params->{course_fee};
        push( @wheres, "courses.course_fee<=${v}" );
    }
    if ( defined $params->{course_intro} ) {
        my $v   = $params->{course_intro};
        my $q_v = $dbh->quote($v);
        $q_v =~ s/^\'//;
        $q_v =~ s/\'$//;
        push( @wheres, "courses.course_intro LIKE '\%${q_v}\%'" );
    }
    if ( defined $params->{course_reco} ) {
        my $v = $params->{course_reco};
        push( @wheres, "courses.course_reco=${v}" );
    }
    if ( defined $params->{course_status} ) {
        my $v = $params->{course_status};
        push( @wheres, "courses.course_status=${v}" );
    }
    if ( defined $params->{course_ccate_id_1} ) {
        my $v = $params->{course_ccate_id_1};
        push( @wheres, "courses.course_ccate_id_1=${v}" );
    }
    if ( defined $params->{course_ccate_id_2} ) {
        my $v = $params->{course_ccate_id_2};
        push( @wheres, "courses.course_ccate_id_2=${v}" );
    }

    #レコード数
    my $hit = 0;
    {
        my $sql = "SELECT COUNT(courses.course_id) FROM courses";
        $sql .= " LEFT JOIN profs ON courses.prof_id=profs.prof_id";
        if (@wheres) {
            $sql .= " WHERE ";
            $sql .= join( " AND ", @wheres );
        }
        ($hit) = $dbh->selectrow_array($sql);
    }
    $hit += 0;

    #SELECT
    my @list;
    {
        my $sql = "SELECT courses.*,";
        $sql .= " profs.prof_id, profs.prof_status, profs.prof_handle, profs.prof_lastname,";
        $sql .= " profs.prof_firstname, profs.prof_logo, profs.prof_intro, profs.prof_character, profs.prof_interest, profs.prof_country, profs.prof_residence, profs.prof_gender, profs.prof_video_url";
        $sql .= " FROM courses";
        $sql .= " LEFT JOIN profs ON courses.prof_id=profs.prof_id";

        if (@wheres) {
            my $where = join( " AND ", @wheres );
            $sql .= " WHERE ${where}";
        }
        if ( defined $params->{sort} && @{ $params->{sort} } > 0 ) {
            my @pairs;
            for my $ary ( @{ $params->{sort} } ) {
                my $k = $ary->[0];
                my $v = $ary->[1];
                push( @pairs, "courses.${k} ${v}" );
            }
            $sql .= " ORDER BY " . join( ",", @pairs );
        }
        $sql .= " LIMIT $params->{offset}, $params->{limit}";
        #
        my $sth = $dbh->prepare($sql);
        $sth->execute();
        while ( my $ref = $sth->fetchrow_hashref ) {
            $self->add_info($ref);
            push( @list, $ref );
        }
        $sth->finish();
    }
    #
    my $res = {};
    $res->{list}  = \@list;
    $res->{hit}   = $hit;
    $res->{fetch} = scalar @list;
    $res->{start} = 0;
    if ( $res->{fetch} > 0 ) {
        $res->{start} = $params->{offset} + 1;
        $res->{end}   = $params->{offset} + $res->{fetch};
    }
    $res->{params} = $params;
    #
    return $res;
}

sub add_info {
    my ( $self, $ref ) = @_;

    my $course_id = $ref->{course_id};
    for ( my $s = 1 ; $s <= 3 ; $s++ ) {
        $ref->{"course_logo_${s}_url"} = "$self->{conf}->{course_logo_dir_url}/${course_id}.${s}.$self->{conf}->{course_logo_ext}";
        $ref->{"course_logo_${s}_w"}   = $self->{conf}->{"course_logo_${s}_w"};
        $ref->{"course_logo_${s}_h"}   = $self->{conf}->{"course_logo_${s}_h"};
    }

    my $prof_id = $ref->{prof_id};
    for ( my $s = 1 ; $s <= 3 ; $s++ ) {
        $ref->{"prof_logo_${s}_url"} = "$self->{conf}->{prof_logo_dir_url}/${prof_id}.${s}.$self->{conf}->{prof_logo_ext}";
        $ref->{"prof_logo_${s}_w"}   = $self->{conf}->{"prof_logo_${s}_w"};
        $ref->{"prof_logo_${s}_h"}   = $self->{conf}->{"prof_logo_${s}_h"};
    }
}

1;
