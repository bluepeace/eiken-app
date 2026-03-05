package FCC::View::Admin::MbrcsvaddfrmView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Admin::_SuperView);
use CGI::Utils;

sub dispatch {
	my($self, $context) = @_;

	#システムエラーの評価
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
		exit;
	}

	#テンプレートのロード
	my $t = $self->load_template();

	#プリセット
	$t->param("pkey" => $context->{proc}->{pkey});
	my $in = $context->{proc}->{in};
	while( my($k,$v) = each %{$in} ) {
		$t->param($k => CGI::Utils->new()->escapeHtml($v));
	}

	#プロセスエラー
	if( defined $context->{proc}->{errs} && @{$context->{proc}->{errs}} ) {
		my $errs = "<ul>";
		for my $e (@{$context->{proc}->{errs}}) {
			$t->param("$e->[0]_err" => "err");
			$errs .= "<li>$e->[1]</li>";
		}
		$errs .= "</ul>";
		$t->param('errs' => $errs);
	}

	$self->print_html($t);
}

1;
