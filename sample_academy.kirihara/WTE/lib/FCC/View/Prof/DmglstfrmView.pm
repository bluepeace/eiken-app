package FCC::View::Prof::DmglstfrmView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Prof::_SuperView);
use CGI::Utils;
use FCC::Class::Date::Utils;
use FCC::Class::String::Conv;

sub dispatch {
	my($self, $context) = @_;
	#システムエラーの評価
	if($context->{fatalerrs}) {
		$self->error($context->{fatalerrs});
		exit;
	}
	#テンプレートのロード
	my $t = $self->load_template();
	my $smsg_desc_chars = $self->{tmpl_loop_params}->{list_loop}->{DMSG_DESC_CHARS} + 0;
	unless($smsg_desc_chars) { $smsg_desc_chars = 100; }
	#検索結果の一覧
	my $res = $context->{res};
	my @list_loop;
	my $epoch = time;
	for my $ref (@{$res->{list}}) {
		my %hash;
		while( my($k, $v) = each %{$ref} ) {
			$hash{$k} = CGI::Utils->new()->escapeHtml($v);
			if($k eq "dmsg_content") {
				my $s = $v;
				$s =~ s/\x0D\x0A|\x0D|\x0A//g;
				$s =~ s/\s+/ /g;
				$s =~ s/^\s+//;
				$s =~ s/\s+$//;
				my $s2 = FCC::Class::String::Conv->new($s)->truncate_chars(0, $smsg_desc_chars);
				if($s ne $s2) { $s2 .= "…"; }
				$hash{$k} = CGI::Utils->new()->escapeHtml($s2);
			}
		}
		$hash{CGI_URL} = $self->{conf}->{CGI_URL};
		$hash{static_url} = $self->{conf}->{static_url};
		$hash{epoch} = $epoch;
		push(@list_loop, \%hash);
	}
	$t->param("list_loop" => \@list_loop);
	#ページナビゲーション
	my @navi_params = ('hit', 'fetch', 'start', 'end', 'next_num', 'prev_num');
	for my $k (@navi_params) {
		my $v = $res->{$k};
		$t->param($k => $v);
		$t->param("${k}_with_comma" => FCC::Class::String::Conv->new($v)->comma_format());
	}
	$t->param("next_url" => $res->{next_url});
	$t->param("prev_url" => $res->{prev_url});
	#ページナビゲーション
	$t->param("page_loop" => $res->{page_list});

	#
	$self->print_html($t);
}

1;
