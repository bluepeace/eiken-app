package FCC::Action::Mypage::StripesintentAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Mypage::_SuperAction);
use CGI::Utils;
use FCC::Class::Card;
use FCC::Class::Plan;
use FCC::Class::Mbract;
use FCC::Class::Member;
use FCC::Class::Date::Utils;
use FCC::Class::String::Conv;
use JSON qw/encode_json decode_json/;
use Data::Dumper;

no warnings 'redefine';

sub dispatch {
    my ($self) = @_;
    my $context = {};

	my $msgs = {};

	my $subtotal = $self->{q}->param("subtotal");
	my $payment_method_id = $self->{q}->param("payment_method");

	my $member_id = $self->{session}->{data}->{member}->{member_id};

	my $omember = new FCC::Class::Member(conf=>$self->{conf}, db=>$self->{db}, memd=>$self->{memd});
	#会員情報を取得
	my $me = $omember->get_from_db($member_id);

	my $stripe_cus_id = $me->{member_stripe_cus_id};

	my $stripe_secret_key = $self->{conf}->{stripe_secret_key};

	my $customer_id = "";
	my $result_id = "";
	my $payment_id = "";
	my $secret = $stripe_secret_key;
	my $secret_pass = 'password';
	my $status = "";
	my $client_secret = "";

	#顧客追加 既に顧客情報をもっている時は

	# stripe customer register
	my $command = 'curl -X POST https://api.stripe.com/v1/customers -u '.$secret.':'.$secret_pass.' -d description="Customer for '.$member_id.'"';

	my $result = `$command`;

	my $items = decode_json('['.$result.']');

	my $error_code = "";

	foreach my $item (@$items) {
		$error_code =  $item->{error}->{code};
		$customer_id = $item->{id};
	}

	my $price = $subtotal;
	my $command = 'curl -X POST https://api.stripe.com/v1/payment_intents -u '.$secret.':'.$secret_pass.' -d amount='.$price.' -d currency=jpy -d customer='.$customer_id.' -d payment_method='.$payment_method_id.' -d description="Charge for '.$member_id.'" -d confirmation_method=automatic -d payment_method_types[0]=card -d setup_future_usage=off_session -d confirm=true';
	my $cmd = $command;

	my $result = `$command`;
	my $items = decode_json('['.$result.']');

	foreach my $item (@$items) {
		$payment_id =  $item->{id};
		$status =  $item->{status};
		$client_secret = $item->{client_secret};
	}

	$context->{res} = {
		client_secret => $client_secret,
		payment_id => $payment_id,
		customer_id => $customer_id
	};
	return $context;

}

1;
