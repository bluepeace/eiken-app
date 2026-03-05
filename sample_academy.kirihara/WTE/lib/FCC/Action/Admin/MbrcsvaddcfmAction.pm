package FCC::Action::Admin::MbrcsvaddcfmAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Admin::_SuperAction);
use FCC::Class::Member;
use Text::CSV_XS;
use Encode;
use Unicode::Japanese;

sub dispatch {
	my($self) = @_;
	my $context = {};

	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "mbrcsvadd");
	if( ! $proc) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}

	# CSV データを取得
	my $fh = $self->{q}->upload("csv");
	unless($fh) {
		$context->{fatalerrs} = ["CSV ファイルを指定してください。"];
		return $context;
	}

	# ファイル名の拡張子をチェック
	my $fname = $self->{q}->param("csv");
	unless($fname =~ /\.csv$/) {
		$context->{fatalerrs} = ["CSV ファイルの拡張子は .csv としてください。"];
		return $context;
	}

	# Content-Type をチェック
	my $ctype = $self->{q}->uploadInfo($fh)->{"Content-Type"};
	unless($ctype eq "text/csv") {
		$context->{fatalerrs} = ["アップロードされたファイルは CSV ではありません: ${ctype}"];
		return $context;
	}

	# CSV ファイルを一時保存
	binmode($fh);
	my $tmp_file = $self->{conf}->{BASE_DIR} . "/data/member_upload_tmp.csv";
	unlink $tmp_file;
	my $tmpfh;
	unless( open $tmpfh, ">", $tmp_file ) {
		$context->{fatalerrs} = ["アップロードされた CSV ファイルの保存に失敗しました: " . $!];
		return $context;
	}
	binmode($tmpfh);
	while (<$fh>) {
		my $chunk = Unicode::Japanese->new($_,'sjis')->get;
		print $tmpfh $chunk;
	}
	close($tmpfh);
	close($fh);

	# CSV をパース
	my $tmpfh2;
	#unless(open $tmpfh2, "<:encoding(utf8)", $tmp_file) {
	unless(open $tmpfh2, "<", $tmp_file) {
		$context->{fatalerrs} = ["保存された CSV ファイルの読み込みに失敗しました: " . $!];
		return $context;
	}
	binmode($tmpfh2);

	my $dummy_pkey = "12345678901234567890123456789012";
	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd}, pkey=>$dummy_pkey);
	my $in_names = [
		"seller_id",
		"member_lastname",
		"member_firstname",
		"member_email",
		"member_pass",
		"member_company",
		"member_dept",
		"member_title",
		"member_comment",
		"member_memo2"
	];

	my @list;
	my $email_map = {};
	my $err = "";
	my $seller_id = $proc->{in}->{seller_id};
	my $line_no = 0;

	my $csv = Text::CSV_XS->new ({binary => 1});

	while (my $row = $csv->getline($tmpfh2)) {
		$line_no ++;

		# 空の行は無視
		my $line = join("", @{$row});
		unless($line) {
			next;
		}

		# 会員データ
		my $data = {
			seller_id => $seller_id,
			member_lastname => Encode::encode("UTF-8", $row->[0]),
			member_firstname => Encode::encode("UTF-8", $row->[1]),
			member_email => Encode::encode("UTF-8", $row->[2]),
			member_pass => Encode::encode("UTF-8", $row->[3]),
			member_company => Encode::encode("UTF-8", $row->[4]),
			member_dept => Encode::encode("UTF-8", $row->[5]),
			member_title => Encode::encode("UTF-8", $row->[6]),
			member_comment => Encode::encode("UTF-8", $row->[7]),
			member_memo2 => Encode::encode("UTF-8", $row->[8]),
			member_point_expire => '2099-12-31'
		};

		# 入力値をチェック
		my @errs = $omember->input_check($in_names, $data);
		if(@errs) {
			$err = "${line_no} 行目：" . $errs[0]->[1];
			last;
		}

		# メールアドレスのCSV 内での重複チェック
		my $email = $data->{member_email};
		if($email_map->{$email}) {
			my $dup_line_no = $email_map->{$email};
			$err = "${line_no} 行目：メールアドレスが ${dup_line_no} 行目と重複しています: ${email}";
			last;
		}

	    push(@list, $data);
		$email_map->{$email} = $line_no;
    }
	close($tmpfh2);
	unlink $tmp_file;

	if($err) {
		$context->{fatalerrs} = [$err];
		return $context;
	}

	$proc->{in}->{member_list} = \@list;
	$self->set_proc_session_data($proc);
	$context->{proc} = $proc;
	return $context;
}

1;
