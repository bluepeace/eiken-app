package FCC::Action::Mypage::StripesAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Mypage::_SuperAction);
use FCC::Class::Card;
use FCC::Class::Plan;
use FCC::Class::Mbract;
use FCC::Class::Member;
use FCC::Class::Mail::Sendmail;
use FCC::Class::Tmpl;
use FCC::Class::Date::Utils;
use FCC::Class::String::Conv;
use JSON qw/encode_json decode_json/;
use Data::Dumper;

no warnings 'redefine';

sub dispatch {
	my($self) = @_;
	my $context = {};
	#プロセスセッション
	my $pkey = $self->{q}->param("pkey");
	my $proc = $self->get_proc_session_data($pkey, "crd");
	if( ! $proc) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}
	if($proc->{in}->{confirm_ok} != 1) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}

	my $msgs = {};
	my $subtotal = $self->{q}->param("subtotal");
	my $stripeToken = $self->{q}->param("stripeToken");
	my $item_name = $self->{q}->param("item_name");
	my $custom = $self->{q}->param("custom");

	my $member_email = $self->{session}->{data}->{member}->{member_email};
	my $member_handle = $self->{session}->{data}->{member}->{member_handle};
	my $member_id = $self->{session}->{data}->{member}->{member_id};


	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	#会員情報を取得
	my $me = $omember->get_from_db($member_id);

	my $stripe_cus_id = $me->{member_stripe_cus_id};

	my $stripe_secret_key = $self->{conf}->{stripe_secret_key};



	my $customer_id = "";
	my $secret = $stripe_secret_key;
	my $secret_pass = 'password';
	my $member_id = $member_id;
	my $token = $stripeToken;

	#顧客追加 既に顧客情報をもっている時は

		# stripe customer register
		my $command = 'curl -X POST https://api.stripe.com/v1/customers -u '.$secret.':'.$secret_pass.' -d description="Customer for '.$member_id.'" -d source='.$token.'';

		my $result = `$command`;



		my $items = decode_json('['.$result.']');

		#my $customer_id = "";
		my $error_code = "";
		#print "Content-type: text/html\n\n".$result."\n";
		foreach my $item (@$items) {

				#print $item->{id};
				$error_code =  $item->{error}->{code};
				$customer_id = $item->{id};
		}


		#print $customer_id;
		#exit(0);



	#Stripe カスタマー情報セット

	my $dbh = $self->{db}->connect_db();
	my $sql = "UPDATE members SET member_stripe_cus_id = '$customer_id' WHERE member_id=${member_id}";
	$dbh->do($sql);
	$dbh->commit();

	#決済
	# stripe charge register
	my $price = $subtotal;
	my $command = 'curl -X POST  https://api.stripe.com/v1/charges -u '.$secret.':'.$secret_pass.' -d amount='.$price.' -d currency=jpy -d customer='.$customer_id.' -d description="'.$item_name.'"';

	my $result = `$command`;

	my $items = decode_json('['.$result.']');

	my $result_id = "";
	my $error_code = "";
	foreach my $item (@$items) {
			$error_code =  $item->{error}->{code};
			$result_id = $item->{id};
	}

	my $status = "";
  if( $result_id ){
		$status = "succeeded";
	} else {
		$status = "error";
	}

	$msgs->{txn_id} = $result_id;

	#カード決済成功
	my $crd_success = 0;
	my $errors = "";
	if( $status eq "succeeded"){
		$crd_success = 1;
		$errors = "";
	}else{
		$crd_success = 2;
		$errors = $error_code;
		$msgs->{txn_id} = $result_id;
		$proc->{errs} = "error";
		$context->{fatalerrs} = ["決済処理ができませんでした。"];
	}



	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db});
	my $member = $omember->get_from_db($member_id);

	my $crd_id = $self->{q}->param("invoice");
	my $ocrd = new FCC::Class::Card(conf=>$self->{conf}, db=>$self->{db});
	my $crd = $ocrd->get($crd_id);

	my $pln_id = $item_name;


	#プラン情報を取得
	my $opln = new FCC::Class::Plan(conf=>$self->{conf}, db=>$self->{db});
	my $pln = $opln->get($pln_id);

	#ここになんなのか調べる
	$msgs->{payer_id} = "";
	#メールでも通知されている
	$msgs->{receipt_id} = "";
	my $crd_ipn_message = $errors;


	my $now = time;
	my @tm = FCC::Class::Date::Utils->new(time=>$now, tz=>$self->{conf}->{tz})->get(1);
	#autosテーブル操作
	my $auto;
	if($crd_success == 1 && $crd->{crd_subscription} == 1) {
		my $oauto = new FCC::Class::Auto(conf=>$self->{conf}, db=>$self->{db});
		$oauto->stop_subscription({ member_id => $member_id, auto_stop_reason => 4 });
		$auto = $oauto->add({
			member_id        => $member_id,
			crd_id           => $crd_id,
			pln_id           => $pln_id,
			auto_price       => $crd->{crd_price},
			auto_point       => $crd->{crd_point},
			auto_day         => $tm[2] + 0,
			auto_last_ym     => $tm[0] . $tm[1],
			auto_status      => 1,
			auto_count       => 1,
			auto_mdate       => $now,
			auto_txn_id      => $msgs->{txn_id}
		});
	}


	#ポイントチャージ
	my $mbract;
	if( $crd_success == 1 ) {
		my $ombract = new FCC::Class::Mbract(conf=>$self->{conf}, db=>$self->{db});
		$mbract = $ombract->charge({
			member_id => $member_id,
			seller_id => $member->{seller_id},
			mbract_type => 1,
			mbract_reason => $crd->{crd_subscription} ? 42 : 41,
			mbract_price => $crd->{crd_point},
			pln_id => $pln_id,
			crd_id => $crd_id,
			auto_id => $auto ? $auto->{auto_id} : 0,
		});
	}



	#カード決済情報をアップデート
	my $new_card = $ocrd->mod({
		crd_id => $crd_id,
		mbract_id => $mbract ? $mbract->{mbract_id} : 0,
		auto_id => $auto ? $auto->{auto_id} : 0,
		crd_rdate => $now,
		crd_success => $crd_success,
		crd_txn_id => $msgs->{txn_id},
		crd_payer_id => $msgs->{payer_id},
		crd_receipt_id => $msgs->{receipt_id},
		crd_ipn_message => Unicode::Japanese->new($crd_ipn_message, 'sjis')->get()
	});

	#print "Content-type: text/html\n\n".$crd_id."\n"; exit(0);



	#通知メール送信
	if( $crd_success == 1 ) {

		my $mail_params = {};
		while( my($k, $v) = each %{$member} ) {
			$mail_params->{$k} = $v;
		}
		while( my($k, $v) = each %{$new_card} ) {
			$mail_params->{$k} = $v;
		}
		if($auto) {
			while( my($k, $v) = each %{$auto} ) {
				$mail_params->{$k} = $v;
			}
		}
		if($pln) {
			while( my($k, $v) = each %{$pln} ) {
				$mail_params->{$k} = $v;
			}
		}
		$self->send_mail($mail_params);
	}

	#
	$context->{proc} = $proc;
	return $context;
}




sub send_mail {
	my($self, $in) = @_;
	#通知先アドレスがセットされていなければ終了
	unless($in->{member_email}) { return; }
	#テンプレートを読み取る
	my $ot = new FCC::Class::Tmpl(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	#現在日時
	my @tm = FCC::Class::Date::Utils->new(time=>time, tz=>$self->{conf}->{tz})->get(1);
	#
	for my $tmpl_id ("ppl9001") {
		my $t = $ot->get_template_object($tmpl_id);
		#置換
		while( my($k, $v) = each %{$in} ) {
			$t->param($k => $v);
			if($k eq "crd_success") {
				$t->param("${k}_${v}" => 1);
			} elsif($k =~ /_(point|price)$/) {
				$t->param("${k}_with_comma" => FCC::Class::String::Conv->new($v)->comma_format());
			}
		}
		$t->param("ssl_host_url" => $self->{conf}->{ssl_host_url});
		$t->param("sys_host_url" => $self->{conf}->{sys_host_url});
		$t->param("pub_sender" => $self->{conf}->{pub_sender});
		$t->param("pub_from" => $self->{conf}->{pub_from});
		#現在日時
		for( my $i=0; $i<=9; $i++ ) {
			$t->param("tm_${i}" => $tm[$i]);
		}
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
#	 		die $error;
	 	}
	}


}

1;
