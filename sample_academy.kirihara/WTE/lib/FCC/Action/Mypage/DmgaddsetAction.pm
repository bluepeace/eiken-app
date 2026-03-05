package FCC::Action::Mypage::DmgaddsetAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Mypage::_SuperAction);
use FCC::Class::Prof;
use FCC::Class::Dmsg;
use FCC::Class::Mail::Sendmail;
use FCC::Class::String::Conv;
use FCC::Class::Tmpl;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $member_id = $self->{session}->{data}->{member}->{member_id};

	#レッスン識別IDを取得
	my $lsn_id = $self->{q}->param("lsn_id");

	#講師識別IDを取得
	my $prof_id = $self->{q}->param("prof_id");
	if( ! defined $prof_id || $prof_id eq "" || $prof_id =~ /[^\d]/ ) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	#講師情報を取得
	my $oprof = new FCC::Class::Prof(conf=>$self->{conf}, db=>$self->{db});
	my $prof = $oprof->get_from_db($prof_id);
	if( ! $prof || $prof->{prof_status} != 1) {
		$context->{fatalerrs} = ["講師が見つからない、または、無効な講師です。"];
		return $context;
	}
	#入力値のname属性値のリスト
	my $in_names = [
		'dmsg_content',
		'dmsg_file'
	];
	#入力値を取得
	my $in = $self->get_input_data($in_names);
	#入力値チェック
	my $odmsg = new FCC::Class::Dmsg(conf=>$self->{conf}, db=>$self->{db}, q=>$self->{q});
	my @errs = $odmsg->input_check($in_names, $in);
	#エラーハンドリング
	if(@errs) {
		$context->{fatalerrs} = [$errs[0]->[1]];
		return $context;
	}
	my $dmsg = $odmsg->add({
		member_id     => $member_id,
		prof_id       => $prof_id,
		dmsg_direction => 1,
		dmsg_content   => $in->{dmsg_content},
		dmsg_file	  => $in->{dmsg_file}
	});

	#通知メール送信
	my $ml_data = {};
	while( my($k, $v) = each %{$dmsg} ) {
		$ml_data->{$k} = $v;
	}
	$self->send_mail($ml_data);
	#
	$context->{prof_id} = $prof_id;
	$context->{lsn_id} = $lsn_id;
	return $context;
}

sub send_mail {
	my($self, $in) = @_;
	unless($in->{member_email}) { return; }
	my $ot = new FCC::Class::Tmpl(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	for my $tmpl_id ("dmg9001", "dmg9002") {
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
	 		#die $error;
	 	}
	}
}

1;
