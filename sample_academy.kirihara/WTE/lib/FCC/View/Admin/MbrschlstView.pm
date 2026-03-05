package FCC::View::Admin::MbrschlstView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Admin::_SuperView);
use CGI::Utils;

sub dispatch {
	my($self, $context) = @_;
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
		return;
	}
	my $t = $self->load_template();
	#ナビゲーション
	for my $type ("last", "this", "next") {
		while( my($k, $v) = each %{$context->{"${type}_month"}} ) {
			$t->param("${type}_month_${k}" => $v);
		}
	}
	$t->param("last_month_disabled" => $context->{last_month_disabled});
	$t->param("next_month_disabled" => $context->{next_month_disabled});

	#カレンダー
	my $lessons = $context->{lessons};
	my $profs = $context->{profs};
	my @week_loop;
	for my $week (@{$context->{this_month_date_list}}) {
		my @day_loop;
		for my $d (@{$week}) {
			my $h = {};
			while( my($k, $v) = each %{$d} ) {
				$h->{$k} = $v;
			}
			my $date = $d->{Y} . $d->{m} . $d->{d};
			$h->{lsn_num} = 0;
			if($lessons->{$date}) {
				my @lsn_loop;
				for my $lsn (@{$lessons->{$date}}) {
					my $lsnh = {};
					while( my($k, $v) = each %{$lsn} ) {
						$lsnh->{$k} = CGI::Utils->new()->escapeHtml($v);
					}
					$lsnh->{CGI_URL} = $self->{conf}->{CGI_URL};
					$lsnh->{static_url} = $self->{conf}->{static_url};
					push(@lsn_loop, $lsnh);
				}
				$h->{lsn_loop} = \@lsn_loop;
				$h->{lsn_num} = scalar @{$lessons->{$date}};
			}

			$h->{prof_num} = 0;
			if($profs->{$date}) {
				my @prof_loop;
				for my $prof (@{$profs->{$date}}) {
					my $profh = {};
					while( my($k, $v) = each %{$prof} ) {
						$profh->{$k} = CGI::Utils->new()->escapeHtml($v);
					}
					$profh->{CGI_URL} = $self->{conf}->{CGI_URL};
					$profh->{static_url} = $self->{conf}->{static_url};
					push(@prof_loop, $profh);
				}
				$h->{prof_loop} = \@prof_loop;
				$h->{prof_num} = scalar @{$profs->{$date}};
			}

			$h->{lsn_prof_num} = $h->{lsn_num} + $h->{prof_num};
			$h->{CGI_URL} = $self->{conf}->{CGI_URL};
			$h->{static_url} = $self->{conf}->{static_url};
			$h->{member_id} = $context->{member}->{member_id};
			push(@day_loop, $h);
		}
		push(@week_loop, { day_loop => \@day_loop });
	}
	$t->param("week_loop" => \@week_loop);
	#
	$t->param("ym" => $context->{ym});

	#会員情報
	while(my($k, $v) = each %{$context->{member}}) {
		$t->param($k => CGI::Utils->new()->escapeHtml($v));
	}

	#
	$self->print_html($t);
}

1;
