package FCC::Action::Mypage::DmgfledwnAction;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::Action::Mypage::_SuperAction);
use FCC::Class::Dmsg;

sub dispatch {
	my($self) = @_;
	my $context = {};
	my $member_id = $self->{session}->{data}->{member}->{member_id};

	#ダイレクトメッセージ識別IDを取得
	my $dmsg_id = $self->{q}->param("dmsg_id");
	if( ! defined $dmsg_id || $dmsg_id eq "" || $dmsg_id =~ /[^\d]/ ) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}

	#情報を取得
	my $odmsg = new FCC::Class::Dmsg(conf=>$self->{conf}, db=>$self->{db});
	my $dmsg = $odmsg->get($dmsg_id);
	if( ! $dmsg ) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	} elsif(!$dmsg->{dmsg_file}) {
		$context->{fatalerrs} = ["ファイルは登録されていません。"];
		return $context;
	} elsif($dmsg->{member_id} ne $member_id) {
		$context->{fatalerrs} = ["不正なリクエストです。"];
		return $context;
	}

	#ファイルのパスを取得
	my $fpath = $self->{conf}->{dmsg_file_dir} . "/" . $dmsg_id . ".dat";
	unless(-e $fpath ) {
		$context->{fatalerrs} = ["ファイルが見つかりませんでした。"];
		return $context;
	}

	#ファイルサイズ
	my $fsize = -s $fpath;

	$context->{fpath} = $fpath; 
	$context->{fsize} = $fsize; 
	$context->{fname} = $dmsg->{dmsg_file}; 
	return $context;
}


1;
