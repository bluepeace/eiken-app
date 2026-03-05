package FCC::Action::Prof::DmgsndsetAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Prof::_SuperAction);
use FCC::Class::Dmsg;
use FCC::Class::Mail::Sendmail;
use FCC::Class::String::Conv;
use FCC::Class::Tmpl;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $prof_id = $self->{session}->{data}->{prof}->{prof_id};

	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "dmgdtl");
	if( ! $proc) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}

	#入力値のname属性値のリスト
	my $in_names = [
		'dmsg_content',
		'dmsg_file'
	];
	#入力値を取得
	my $in = $self->get_input_data($in_names);
	while( my($k, $v) = each %{$in} ) {
		$proc->{in}->{$k} = $v;
	}

	#ファイル添付の場合は値がBlobになってセッションが保存できないので、
	#ファイル名を取得して、セッションにはファイル名を保存する
	my $fname = $self->{q}->param("dmsg_file");
	if($fname) {
		$proc->{in}->{dmsg_file} = "${fname}";
	}

	# FCC:Class::Dmsgインスタンス
	my $odmsg = new FCC::Class::Dmsg(conf=>$self->{conf}, db=>$self->{db}, q=>$self->{q});
	#入力値チェック
	my @errs = $odmsg->input_check($in_names, $proc->{in});
	#エラーハンドリング
	if(@errs) {
		$proc->{errs} = \@errs;
	} else {
		$proc->{errs} = [];
		my $dmsg = $odmsg->add($proc->{in});
		$proc->{dmsg} = $dmsg;

		#通知メール送信
		my $ml_data = {};
		while( my($k, $v) = each %{$dmsg} ) {
			unless(ref($v)) {
				$ml_data->{$k} = $v;
			}
		}
		$self->send_mail($ml_data);
	}
	#
	$self->set_proc_session_data($proc);
	$context->{proc} = $proc;
	return $context;
}

sub send_mail {
	my($self, $in) = @_;
	unless($in->{member_email}) { return; }
	my $ot = new FCC::Class::Tmpl(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	for my $tmpl_id ("dmg9011", "dmg9012") {
		my $t = $ot->get_template_object($tmpl_id);
		#置換
		while( my($k, $v) = each %{$in} ) {
			$t->param($k => $v);
		}
		$t->param("ssl_host_url" => $self->{conf}->{ssl_host_url});
		$t->param("sys_host_url" => $self->{conf}->{sys_host_url});
		$t->param("pub_sender" => $self->{conf}->{pub_sender});
		$t->param("pub_from" => $self->{conf}->{pub_from});

		#ヘッダーとボディー
		my $eml = $t->output();
		unless($eml) { next; }
		my $mail = new FCC::Class::Mail::Sendmail(
			sendmail => $self->{conf}->{sendmail_path},
			smtp_host => $self->{conf}->{smtp_host},
			smtp_port => $self->{conf}->{smtp_port},
			smtp_auth_user => $self->{conf}->{smtp_auth_user},
			smtp_auth_pass => $self->{conf}->{smtp_auth_pass},
			smtp_timeout => $self->{conf}->{smtp_timeout},
			eml => $eml,
			tz => $self->{conf}->{tz}
		);
		$mail->mailsend();
	 	if( my $error = $mail->error() ) {
	 		die $error;
	 	}
	}
}

1;
