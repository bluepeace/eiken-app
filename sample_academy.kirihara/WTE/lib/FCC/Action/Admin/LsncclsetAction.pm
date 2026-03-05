package FCC::Action::Admin::LsncclsetAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Admin::_SuperAction);
use FCC::Class::Lesson;
use FCC::Class::Member;
use FCC::Class::Mail::Sendmail;
use FCC::Class::String::Conv;
use FCC::Class::Tmpl;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $member_id = $self->{q}->param("member_id");
	my $prof_id = $self->{q}->param("prof_id");
	my $lsn_cancel_person = $self->{q}->param("lsn_cancel_person");
	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "lsnmod");
	if( ! $proc) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	#レッスン識別IDを取得
	my $lsn_id = $self->{q}->param("lsn_id");
	if( ! defined $lsn_id || $lsn_id eq "" || $lsn_id =~ /[^\d]/ ) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	#レッスン情報を取得
	my $olsn = new FCC::Class::Lesson(conf=>$self->{conf}, db=>$self->{db});
	my $lsn = $olsn->get($lsn_id);
	if( ! $lsn ) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	if($lsn->{member_id} != $member_id) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	if($lsn->{lsn_cancel} > 0) {
		$context->{fatalerrs} = ["すでにキャンセル済みです。"];
		return $context;
	}
	if($lsn->{lsn_cancelable} !~ /^(1|2)$/) {
		$context->{fatalerrs} = ["キャンセルすることができません。"];
		return $context;
	}
	#入力値のname属性値のリスト
	my $in_names = [
		'lsn_cancel_reason'
	];
	#入力値を取得
	my $in = $self->get_input_data($in_names);
	#入力値チェック
	my @errs = $olsn->cancel_input_check($in_names, $in);
	#エラーハンドリング
	if(@errs) {
		$context->{fatalerrs} = [$errs[0]->[1]];
		return $context;
	}
	$proc->{errs} = [];
	#キャンセル処理
	if($lsn_cancel_person eq 1) {
		$lsn = $olsn->member_cancel_set($lsn_id, $in->{lsn_cancel_reason}, $lsn);
	} elsif($lsn_cancel_person eq 2) {
		$lsn = $olsn->prof_cancel_set($lsn_id, $in->{lsn_cancel_reason}, $lsn);
	}
	#会員情報を取得
	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	my $member = $omember->get($lsn->{member_id});
	#通知メール送信
	my $ml_data = {};
	while( my($k, $v) = each %{$lsn} ) {
		$ml_data->{$k} = $v;
	}
	while( my($k, $v) = each %{$member} ) {
		$ml_data->{$k} = $v;
	}
	if($lsn_cancel_person eq 1) {
		$self->send_mail_member($ml_data);
	} elsif($lsn_cancel_person eq 2) {
		$self->send_mail_prof($ml_data);
	}
	#
	$self->del_proc_session_data();
	$context->{lsn_id} = $lsn_id;
	return $context;
}

sub send_mail_member {
	my($self, $in) = @_;
	my $ot = new FCC::Class::Tmpl(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	for my $tmpl_id ("rsv9011", "rsv9012") {
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
#	 	if( my $error = $mail->error() ) {
#	 		die $error;
#	 	}
	}
}

sub send_mail_prof {
	my($self, $in) = @_;
	my $ot = new FCC::Class::Tmpl(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	for my $tmpl_id ("rsv9021", "rsv9022") {
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
#	 	if( my $error = $mail->error() ) {
#	 		die $error;
#	 	}
	}
}

1;