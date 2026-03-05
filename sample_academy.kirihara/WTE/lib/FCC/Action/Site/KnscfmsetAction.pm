package FCC::Action::Site::KnscfmsetAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Site::_SuperAction);
use FCC::Class::String::Checker;
use Data::Dumper;

sub dispatch {
	my($self) = @_;
	my $context = {};
	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "kns");
	if( ! $proc) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	#入力値のname属性値のリスト
	my $in_names = [
		'kns_company',
		'kns_name',
		'kns_email',
		'kns_tel',
		'kns_mtype',
		'kns_cont'
	];
	#入力値を取得
	my $in = $self->get_input_data($in_names);
	while( my($k, $v) = each %{$in} ) {
		$proc->{in}->{$k} = $v;
	}
	#ラジオボタンとセレクトメニューの値のリスト
	my @names = $self->{q}->param();
	my $captions = {};
	for my $name (@names) {
		if($name =~ /_caption_\d+$/) {
			$captions->{$name} = $self->{q}->param($name);
		}
	}
	$proc->{captions} = $captions;
	#入力値チェック
	my @errs = $self->input_check($in_names, $proc->{in}, $captions);
	#エラーハンドリング
	if(@errs) {
		$proc->{errs} = \@errs;
	} else {
		$proc->{errs} = [];
		$proc->{in}->{confirm_ok} = 1;
	}
	#
	$self->set_proc_session_data($proc);
	$context->{proc} = $proc;
	return $context;
}

sub input_check {
	my($self, $names, $in, $captions) = @_;
	my %cap = (
		kns_company  => "御社名",
		kns_name  => "ご担当者様ご氏名",
		kns_email => "メールアドレス",
		kns_tel => "お電話番号",
		kns_mtype => "ご希望",
		kns_cont  => "その他質問"
	);
	#入力値のチェック
	my @errs;
	for my $k (@{$names}) {
		my $v = $in->{$k};
		if( ! defined $v ) { $v = ""; }
		my $len = FCC::Class::String::Checker->new($v, "utf8")->get_char_num();
		#お名前
		if($k eq "kns_company") {
			if($v eq "") {
				push(@errs, [$k, "\"$cap{$k}\" は必須です。"]);
			} elsif($len > 100) {
				push(@errs, [$k, "\"$cap{$k}\" は100文字以内で入力してください。"]);
			}
		} elsif($k eq "kns_name") {
			if($v eq "") {
				push(@errs, [$k, "\"$cap{$k}\" は必須です。"]);
			} elsif($len > 100) {
				push(@errs, [$k, "\"$cap{$k}\" は100文字以内で入力してください。"]);
			}
		#メールアドレス
		} elsif($k eq "kns_email") {
			if($v eq "") {
				push(@errs, [$k, "\"$cap{$k}\" は必須です。"]);
			} elsif($len > 255) {
				push(@errs, [$k, "\"$cap{$k}\" は255文字以内で入力してください。"]);
			} elsif( ! FCC::Class::String::Checker->new($v)->is_mailaddress() ) {
				push(@errs, [$k, "\"$cap{$k}\" はメールアドレスとして不適切です。"]);
			}
		#電話番号
		} elsif($k eq "kns_tel") {
			if($v eq "") {
				push(@errs, [$k, "\"$cap{$k}\" は必須です。"]);
			} elsif($len > 255) {
				push(@errs, [$k, "\"$cap{$k}\" は255文字以内で入力してください。"]);
			}
		#登録状況
		} elsif($k eq "kns_mtype") {
			if($v eq "") {
				push(@errs, [$k, "\"$cap{$k}\" は必須です。"]);
			} elsif($v =~ /[^\d]/ || !$captions->{"${k}_caption_${v}"}) {
				push(@errs, [$k, "\"$cap{$k}\" に不正な値が送信されました。"]);
			}
		#お問い合わせ内容
		} elsif($k eq "kns_cont") {
			if($v eq "") {
				#push(@errs, [$k, "\"$cap{$k}\" は必須です。"]);
			} elsif($len > 3000) {
				push(@errs, [$k, "\"$cap{$k}\" は3000文字以内で入力してください。"]);
			}
		}
	}
	#
	return @errs;
}

1;
