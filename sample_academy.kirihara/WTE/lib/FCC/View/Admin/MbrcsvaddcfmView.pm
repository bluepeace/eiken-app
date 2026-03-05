package FCC::View::Admin::MbrcsvaddcfmView;
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

	my $t = $self->load_template();

	$t->param("pkey" => $context->{proc}->{pkey});
	my $in = $context->{proc}->{in};
	while( my($k,$v) = each %{$in} ) {
		if($k eq "member_list") {
			my @list;
			for my $rec (@{$v}) {
				my $h = {};
				while(my($key, $val) = each %{$rec}) {
					my $escaped = CGI::Utils->new()->escapeHtml($val);
					if($key =~ /^member_(comment|memo2)$/) {
						$escaped =~ s/\n/<br>/g;
					}
					$h->{$key} = $escaped;
				}
				push(@list, $h);
			}
			$t->param("list" => \@list);

		} else {
			$t->param($k => CGI::Utils->new()->escapeHtml($v));
		}
	}

	$self->print_html($t);
}

1;
