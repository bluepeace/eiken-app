package FCC::Class::Dmsg;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::_Super);
use Carp;

use FCC::Class::Log;
use FCC::Class::String::Checker;
use FCC::Class::Date::Utils;

sub init {
    my ( $self, %args ) = @_;
    unless ( $args{conf} && $args{db} ) {
        croak "parameters are lacking.";
    }
    $self->{conf} = $args{conf};
    $self->{db}   = $args{db};
    $self->{q}    = $args{q};

    #dmsgsテーブルの全カラム名のリスト
    $self->{table_cols} = {
        dmsg_id           => "識別ID",
        member_id         => "会員識別ID",
        prof_id           => "講師識別ID",
        dmsg_cdate        => "投稿日時",
        dmsg_direction    => "メッセージ方向",
        dmsg_content      => "メッセージ本文",
        dmsg_file         => "ファイル名",
        dmsg_file_etime   => "ファイル有効期限",
        dmsg_file_deleted => "ファイル削除済みフラグ"
    };

    #ファイル格納ディレクトリの作成
    my $file_dir = $self->{conf}->{dmsg_file_dir};
    unless ( -d $file_dir ) {
        if ( !mkdir $file_dir, 0777 ) {
            my $msg = "failed to make a directory for dmsg files.";
            FCC::Class::Log->new( conf => $self->{conf} )
              ->loging( "error", "${msg} : ${file_dir} : $!" );
            croak $msg;
        }
        if ( !chmod 0777, $file_dir ) {
            my $msg = "failed to chmod a directory for dmsg files.";
            FCC::Class::Log->new( conf => $self->{conf} )
              ->loging( "error", "${msg} : ${file_dir} : $!" );
            croak $msg;
        }
    }
    $self->{file_dir} = $file_dir;

}

#---------------------------------------------------------------------
#■新規登録・編集の入力チェック
#---------------------------------------------------------------------
#[引数]
#	1.入力データのキーのarrayref（必須）
#	2.入力データのhashref（必須）
#	3.モード（add or mod）指定がない場合は add として処理される
#[戻り値]
#	エラー情報を格納した配列を返す。
#---------------------------------------------------------------------
sub input_check {
    my ( $self, $names, $in ) = @_;
    my %cap = %{ $self->{table_cols} };
    my @errs;
    for my $k ( @{$names} ) {
        my $v = $in->{$k};
        if ( !defined $v ) { $v = ""; }
        my $len =
          FCC::Class::String::Checker->new( $v, "utf8" )->get_char_num();

        #メッセージ
        if ( $k eq "dmsg_content" ) {
            if ( $v eq "" ) {
                push( @errs, [ $k, "\"$cap{$k}\" は必須です。" ] );
            }
            elsif ( $len > 10000 ) {
                push( @errs, [ $k, "\"$cap{$k}\" は10000文字以内で入力してください。" ] );
            }
        }

        #添付ファイル
        elsif ( $k eq "dmsg_file" ) {
            if ( $v eq "" ) {
            }
            elsif ( $len > 64 ) {
                push( @errs, [ $k, "ファイル名は64文字以内にしてください。" ] );
            }
            elsif ( $v =~ /[\\\/\:\*\?\"\<\>\|]/ ) {
                push( @errs, [ $k, "ファイル名に使用できない文字が含まれています。" ] );
            }
            elsif($v !~ /\.(doc|docx|xls|xlsx|ppt|pptx|pdf|zip|jpg|jpeg|png|gif|mp3|mp4|mov|m4a|txt|heic)$/i) {
                push( @errs, [ $k, "サポートされていないファイル種別です。" ] );
            }
        }
    }
    #
    return @errs;
}

#---------------------------------------------------------------------
#■識別IDからメッセージ取得
#---------------------------------------------------------------------
#[引数]
#	1:識別ID
#[戻り値]
#	hashrefを返す
#---------------------------------------------------------------------
sub get {
    my ( $self, $dmsg_id ) = @_;
    if ( !$dmsg_id || $dmsg_id =~ /[^\d]/ ) {
        croak "a parameter is invalid.";
    }

    #DB接続
    my $dbh = $self->{db}->connect_db();

    #SELECT
    my $sql = "SELECT dmsgs.*, members.*, profs.* FROM dmsgs";
    $sql .= " LEFT JOIN members ON dmsgs.member_id=members.member_id";
    $sql .= " LEFT JOIN profs ON dmsgs.prof_id=profs.prof_id";
    $sql .= " WHERE dmsgs.dmsg_id=${dmsg_id}";
    my $ref = $dbh->selectrow_hashref($sql);
    if ($ref) {
        $self->add_datetime_info($ref);
    }
    return $ref;
}

#---------------------------------------------------------------------
#■メッセージ登録
#---------------------------------------------------------------------
#[引数]
#	1: hashref
#[戻り値]
#	登録したhashref
#---------------------------------------------------------------------
sub add {
    my ( $self, $ref ) = @_;
    my $dmsg_content = $ref->{dmsg_content};
    if ( !defined $dmsg_content || $dmsg_content eq "" ) {
        croak "the value of dmsg_content in parameters is invalid.";
    }
    #
    my $dmsg_direction = $ref->{dmsg_direction};
    if ( !defined $dmsg_direction || $dmsg_direction !~ /^(1|2)$/ ) {
        croak "the value of dmsg_direction in parameters is invalid.";
    }

    #添付ファイル
    my $tmp_file = "";
    if ( $ref->{dmsg_file} ) {

        #添付ファイルを一時ファイルとして保存
        my $fh = $self->{q}->upload("dmsg_file");
        unless ($fh) {
            croak "failed to get the uploaded file.";
        }
        binmode($fh);

        my $random = time . "-" . $self->create_random_hex(16);
        $tmp_file = $self->{file_dir} . "/tmp-" . $random . ".dat";
        unlink $tmp_file;
        my $tmpfh;
        unless ( open $tmpfh, ">", $tmp_file ) {
            croak "failed to copy the uploaded file on storage. $!";
        }
        binmode($tmpfh);
        while (<$fh>) {
            print $tmpfh $_;
        }
        close($tmpfh);

        #添付ファイルのサイズをチェック (10MB)
        my $size = -s $tmp_file;
        if ( $size > 1024 * 1024 * 10 ) {
            unlink $tmp_file;
            croak "the size of the uploaded file is too large.";
        }

    }

    #DB接続
    my $dbh = $self->{db}->connect_db();
    #
    my $rec = {};
    while ( my ( $k, $v ) = each %{$ref} ) {
        unless ( exists $self->{table_cols}->{$k} ) { next; }
        if     ( defined $v ) {
            $rec->{$k} = $v;
        }
        else {
            $rec->{$k} = "";
        }
    }
    my $now = time;
    $rec->{dmsg_cdate} = $now;

    if ( $ref->{dmsg_file} ) {
        $rec->{dmsg_file_etime} = $now + 86400 * $self->{conf}->{dmsg_file_expire_days};
    }

    #SQL生成
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

    #INSERT
    my $dmsg_id;
    eval {
        my $sql =
            "INSERT INTO dmsgs ("
          . join( ",", @klist )
          . ") VALUES ("
          . join( ",", @vlist ) . ")";
        $dbh->do($sql);
        $dmsg_id = $dbh->{mysql_insertid};
        $self->{db}->{dbh}->commit();

        #添付ファイルの移動
        if ( $tmp_file && -e $tmp_file ) {
            my $file_path = $self->{file_dir} . "/${dmsg_id}.dat";
            rename $tmp_file, $file_path;
        }
    };
    if ($@) {
        $self->{db}->{dbh}->rollback();
        if ($tmp_file) {
            unlink $tmp_file;
        }
        my $msg = "failed to insert a record to dmsgs table.";
        FCC::Class::Log->new( conf => $self->{conf} )
          ->loging( "error", "${msg} : $@" );
        croak $msg;
    }

    #メッセージ情報を取得
    my $dmsg = $self->get($dmsg_id);
    #
    return $dmsg;
}

sub create_random_hex {
    my($self, $bytes) = @_;

    my $random_bytes = '';
    for(my $i=0; $i<$bytes; $i++) {
        $random_bytes .= chr(int(rand(256)));
    }

    my $hex_string = '';
    for my $byte (split //, $random_bytes) {
        $hex_string .= sprintf("%02x", ord($byte));
    }

    return $hex_string;
}

#---------------------------------------------------------------------
#■削除
#---------------------------------------------------------------------
#[引数]
#	1.識別ID（必須）
#[戻り値]
#	成功すれば削除データのhashrefを返す。
#	もし存在しないlsn_idが指定されたら、未定義値を返す
#	失敗すればcroakする。
#---------------------------------------------------------------------
sub del {
    my ( $self, $dmsg_id ) = @_;

    #識別IDのチェック
    if ( !defined $dmsg_id || $dmsg_id =~ /[^\d]/ ) {
        croak "the value of dmsg_id in parameters is invalid.";
    }

    #DB接続
    my $dbh = $self->{db}->connect_db();

    #データ情報を取得
    my $dmsg = $self->get($dmsg_id);

    #Delete
    my $deleted;
    eval {
        my $sql = "DELETE FROM dmsgs WHERE dmsg_id=${dmsg_id}";
        $deleted = $dbh->do($sql);
        $dbh->commit();
    };
    if ($@) {
        $dbh->rollback();
        my $msg = "failed to delete a record in dmsgs table.";
        FCC::Class::Log->new( conf => $self->{conf} )
          ->loging( "error", "${msg} : $@" );
        croak $msg;
    }

    #対象のレコードがなければundefを返す
    if ( $deleted == 0 ) {
        return undef;
    }
    #
    return $dmsg;
}

#---------------------------------------------------------------------
#■DBレコードを検索してリストで取得
#---------------------------------------------------------------------
#[引数]
#	1.検索パラメータを格納したhashref（必須ではない）
#		{
#			dmsg_id        => メッセージ識別ID,
#			member_id     => 会員識別ID,
#			prof_id       => 講師識別ID,
#			dmsg_direction => メッセージ方向（1 or 2）,
#			offset        => オフセット値（デフォルト値：0）,
#			limit         => リミット値（デフォルト値：20）,
#			sort          => ソート条件のarrayref [ [ソートカラム名, 順序(ASC|DESC)], ... ]
#		}
#		上記パラメータに指定がなかった場合のでフォルト値
#		{
#			offset => 0,
#			limit  => 20,
#			sort   =>[ ['dmsg_id', "DESC"] ]
#		}
#
#[戻り値]
#	検索結果を格納したhashref
#		{
#			list => 各レコードを格納したhashrefのarrayref,
#			hit => 検索ヒット数,
#			fetch => フェッチしたレコード数,
#			start => 取り出したレコードの開始番号（offset+1, ただしhit=0の場合はstartも0となる）,
#			end => 取り出したレコードの終了番号（offset+fetch, ただしhit=0の場合はendも0となる）,
#			params => 検索条件を格納したhashref
#		}
#	失敗すればcroakする。
#---------------------------------------------------------------------
sub get_list {
    my ( $self, $in_params ) = @_;
    if ( defined $in_params && ref($in_params) ne "HASH" ) {
        croak "the 1st argument is invaiid.";
    }

    #指定の検索条件を新たなhashrefに格納
    my $params         = {};
    my @param_key_list = (
        'dmsg_id', 'member_id', 'prof_id', 'dmsg_direction',
        'offset',  'limit',     'sort'
    );
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
        sort   => [ [ 'dmsg_id', "DESC" ] ]
    };
    while ( my ( $k, $v ) = each %{$defaults} ) {
        if ( !defined $params->{$k} && defined $v ) {
            $params->{$k} = $v;
        }
    }

    #検索条件のチェック
    while ( my ( $k, $v ) = each %{$params} ) {
        if ( $k =~ /^(dmsg|prof|member)_id$/ ) {
            if ( $v =~ /[^\d]/ ) {
                delete $params->{$k};
            }
            else {
                $params->{$k} = $v + 0;
            }
        }
        elsif ( $k eq "dmsg_direction" ) {
            if ( $v =~ /[^\d]/ ) {
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
                if ( $key !~ /^(dmsg_id|member_id|prof_id)$/ ) {
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
    if ( defined $params->{msg_id} ) {
        push( @wheres, "dmsgs.dmsg_id=$params->{dmsg_id}" );
    }
    if ( defined $params->{member_id} ) {
        push( @wheres, "dmsgs.member_id=$params->{member_id}" );
    }
    if ( defined $params->{prof_id} ) {
        push( @wheres, "dmsgs.prof_id=$params->{prof_id}" );
    }
    if ( defined $params->{dmsg_direction} ) {
        push( @wheres, "dmsgs.dmsg_direction=$params->{dmsg_direction}" );
    }

    #レコード数
    my $hit = 0;
    {
        my $sql = "SELECT COUNT(dmsg_id) FROM dmsgs";
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
        my $sql = "SELECT dmsgs.*, members.*, profs.* FROM dmsgs";
        $sql .= " LEFT JOIN members ON dmsgs.member_id=members.member_id";
        $sql .= " LEFT JOIN profs ON dmsgs.prof_id=profs.prof_id";
        if (@wheres) {
            my $where = join( " AND ", @wheres );
            $sql .= " WHERE ${where}";
        }
        if ( defined $params->{sort} && @{ $params->{sort} } > 0 ) {
            my @pairs;
            for my $ary ( @{ $params->{sort} } ) {
                push( @pairs, "dmsgs.$ary->[0] $ary->[1]" );
            }
            $sql .= " ORDER BY " . join( ",", @pairs );
        }
        $sql .= " LIMIT $params->{offset}, $params->{limit}";
        #
        my $sth = $dbh->prepare($sql);
        $sth->execute();
        while ( my $ref = $sth->fetchrow_hashref ) {
            $self->add_datetime_info($ref);
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

sub add_datetime_info {
    my ( $self, $ref ) = @_;
    my %dmsg_cdate_fmt = FCC::Class::Date::Utils->new(
        time => $ref->{dmsg_cdate},
        tz   => $self->{conf}->{tz}
    )->get_formated();
    while ( my ( $k, $v ) = each %dmsg_cdate_fmt ) {
        $ref->{"dmsg_cdate_${k}"} = $v;
    }

    my %dmsg_file_etime_fmt = FCC::Class::Date::Utils->new(
        time => $ref->{dmsg_file_etime},
        tz   => $self->{conf}->{tz}
    )->get_formated();
    while ( my ( $k, $v ) = each %dmsg_file_etime_fmt ) {
        $ref->{"dmsg_file_etime_${k}"} = $v;
    }
}

#---------------------------------------------------------------------
#■会員の一覧を取得 (講師メニューのメッセージ履歴表示に使う)
#---------------------------------------------------------------------
#[引数]
#	1.検索パラメータを格納したhashref（必須ではない）
#		{
#			prof_id       => 講師識別ID,
#			offset        => オフセット値（デフォルト値：0）,
#			limit         => リミット値（デフォルト値：20）,
#		}
#		上記パラメータに指定がなかった場合のでフォルト値
#		{
#			offset => 0,
#			limit  => 20,
#		}
#
#[戻り値]
#	検索結果を格納したhashref
#		{
#			list => 各レコードを格納したhashrefのarrayref,
#			hit => 検索ヒット数,
#			fetch => フェッチしたレコード数,
#			start => 取り出したレコードの開始番号（offset+1, ただしhit=0の場合はstartも0となる）,
#			end => 取り出したレコードの終了番号（offset+fetch, ただしhit=0の場合はendも0となる）,
#			params => 検索条件を格納したhashref
#		}
#	失敗すればcroakする。
#---------------------------------------------------------------------
sub get_member_list {
    my ( $self, $in_params ) = @_;
    if ( defined $in_params && ref($in_params) ne "HASH" ) {
        croak "the 1st argument is invaiid.";
    }

    #指定の検索条件を新たなhashrefに格納
    my $params         = {};
    my @param_key_list = ( 'prof_id', 'offset', 'limit' );
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
        limit  => 20
    };
    while ( my ( $k, $v ) = each %{$defaults} ) {
        if ( !defined $params->{$k} && defined $v ) {
            $params->{$k} = $v;
        }
    }

    #検索条件のチェック
    while ( my ( $k, $v ) = each %{$params} ) {
        if ( $k eq "prof_id" ) {
            if ( $v =~ /[^\d]/ ) {
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
    }

    #DB接続
    my $dbh = $self->{db}->connect_db();

    #SQLのWHERE句
    my @wheres;
    if ( defined $params->{prof_id} ) {
        push( @wheres, "dmsgs.prof_id=$params->{prof_id}" );
    }

    #レコード数
    my $hit = 0;
    {
        my $sql = "SELECT COUNT(DISTINCT member_id) FROM dmsgs";
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
        my $sql =
"SELECT member_id, COUNT(member_id) AS dmsg_num, MAX(dmsg_id) AS dmsg_latest_id FROM dmsgs";
        if (@wheres) {
            my $where = join( " AND ", @wheres );
            $sql .= " WHERE ${where}";
        }
        $sql .= " GROUP BY member_id";
        #$sql .= " ORDER BY dmsg_cdate DESC";
        $sql .= " ORDER BY dmsg_latest_id DESC";

        $sql .= " LIMIT $params->{offset}, $params->{limit}";
        #
        my $sth = $dbh->prepare($sql);
        $sth->execute();
        while ( my $ref = $sth->fetchrow_hashref ) {
            $self->add_datetime_info($ref);
            push( @list, $ref );
        }
        $sth->finish();
    }
    if (@list) {
        for my $ref (@list) {
            my $dmsg_latest_id = $ref->{dmsg_latest_id};
            my $dmsg           = $self->get($dmsg_latest_id);
            unless ($dmsg) {
                next;
            }
            while ( my ( $k, $v ) = each %{$dmsg} ) {
                $ref->{$k} = $v;
            }
        }
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

#---------------------------------------------------------------------
#■講師の一覧を取得 (会員メニューのメッセージ履歴表示に使う)
#---------------------------------------------------------------------
#[引数]
#	1.検索パラメータを格納したhashref（必須ではない）
#		{
#			member_id     => 会員識別ID,
#			offset        => オフセット値（デフォルト値：0）,
#			limit         => リミット値（デフォルト値：20）,
#		}
#		上記パラメータに指定がなかった場合のでフォルト値
#		{
#			offset => 0,
#			limit  => 20,
#		}
#
#[戻り値]
#	検索結果を格納したhashref
#		{
#			list => 各レコードを格納したhashrefのarrayref,
#			hit => 検索ヒット数,
#			fetch => フェッチしたレコード数,
#			start => 取り出したレコードの開始番号（offset+1, ただしhit=0の場合はstartも0となる）,
#			end => 取り出したレコードの終了番号（offset+fetch, ただしhit=0の場合はendも0となる）,
#			params => 検索条件を格納したhashref
#		}
#	失敗すればcroakする。
#---------------------------------------------------------------------
sub get_prof_list {
    my ( $self, $in_params ) = @_;
    if ( defined $in_params && ref($in_params) ne "HASH" ) {
        croak "the 1st argument is invaiid.";
    }

    #指定の検索条件を新たなhashrefに格納
    my $params         = {};
    my @param_key_list = ( 'member_id', 'offset', 'limit' );
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
        limit  => 20
    };
    while ( my ( $k, $v ) = each %{$defaults} ) {
        if ( !defined $params->{$k} && defined $v ) {
            $params->{$k} = $v;
        }
    }

    #検索条件のチェック
    while ( my ( $k, $v ) = each %{$params} ) {
        if ( $k eq "member_id" ) {
            if ( $v =~ /[^\d]/ ) {
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
    }

    #DB接続
    my $dbh = $self->{db}->connect_db();

    #SQLのWHERE句
    my @wheres;
    if ( defined $params->{member_id} ) {
        push( @wheres, "dmsgs.member_id=$params->{member_id}" );
    }

    #レコード数
    my $hit = 0;
    {
        my $sql = "SELECT COUNT(DISTINCT prof_id) FROM dmsgs";
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
        my $sql =
"SELECT prof_id, COUNT(prof_id) AS dmsg_num, MAX(dmsg_id) AS dmsg_latest_id FROM dmsgs";
        if (@wheres) {
            my $where = join( " AND ", @wheres );
            $sql .= " WHERE ${where}";
        }
        $sql .= " GROUP BY prof_id";
        #$sql .= " ORDER BY dmsg_cdate DESC";
        $sql .= " ORDER BY dmsg_latest_id DESC";

        $sql .= " LIMIT $params->{offset}, $params->{limit}";
        #
        my $sth = $dbh->prepare($sql);
        $sth->execute();
        while ( my $ref = $sth->fetchrow_hashref ) {
            $self->add_datetime_info($ref);
            push( @list, $ref );
        }
        $sth->finish();
    }
    if (@list) {
        for my $ref (@list) {
            my $dmsg_latest_id = $ref->{dmsg_latest_id};
            my $dmsg           = $self->get($dmsg_latest_id);
            unless ($dmsg) {
                next;
            }
            while ( my ( $k, $v ) = each %{$dmsg} ) {
                $ref->{$k} = $v;
            }
        }
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

1;
