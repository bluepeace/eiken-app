package FCC::View::Mypage::DmgdtlfrmView;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::View::Mypage::_SuperView);
use CGI::Utils;
use Clone;
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
	$t->param("pkey" => $context->{proc}->{pkey});

	#講師情報
	while( my($k, $v) = each %{$context->{prof}} ) {
		if( ! defined $v ) { $v = ""; }
		$t->param($k => CGI::Utils->new()->escapeHtml($v));
		if($k =~ /^(prof_cdate|prof_mdate)$/) {
			my @tm = FCC::Class::Date::Utils->new(time=>$v, tz=>$self->{conf}->{tz})->get(1);
			for( my $i=0; $i<=9; $i++ ) {
				$t->param("${k}_${i}" => $tm[$i]);
			}
		} elsif($k =~ /^prof_(gender|status|card|reco|coupon_ok)$/) {
			$t->param("${k}_${v}" => 1);
		} elsif($k =~ /^prof_(associate1|associate2|intro|intro2|memo|memo2|note)$/) {
			my $tmp = CGI::Utils->new()->escapeHtml($v);
			$tmp =~ s/\n/<br \/>/g;
			$t->param($k => $tmp);
		} elsif($k eq "prof_rank") {
			my $title = $self->{conf}->{"prof_rank${v}_title"};
			$t->param("${k}_title" => CGI::Utils->new()->escapeHtml($title));
		} elsif($k eq "prof_fee") {
			$t->param("${k}_with_comma" => FCC::Class::String::Conv->new($v)->comma_format());
		}
	}


	#メッセージ検索結果の一覧
	my $res = $context->{res};
	my @list_loop;
	my $epoch = time;
	for my $ref (@{$res->{list}}) {
		my %hash;
		while( my($k, $v) = each %{$ref} ) {
			$hash{$k} = CGI::Utils->new()->escapeHtml($v);
			if($k eq "dmsg_direction") {
				$hash{"${k}_${v}"} = 1;
			} elsif($k eq "dmsg_desc") {
				$hash{$k} =~ s/\x0D\x0A|\x0D|\x0A/<br>/g;
			} elsif($k eq "dmsg_content") {
				my $tmp = CGI::Utils->new()->escapeHtml($v);
				$tmp =~ s/\n/<br \/>/g;
				$tmp =~ s/(https?\:\/\/[0-9a-zA-Z\#\%\&\=\~\+\-\?\.\_\,\@\$\:\/\;]+)/<a href=\"$1\" target=\"_blank\">$1<\/a>/g;
				$hash{$k} = $tmp;
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
	$t->param("search_base_url" => $context->{search_base_url});

	$self->print_html($t);
}

1;
