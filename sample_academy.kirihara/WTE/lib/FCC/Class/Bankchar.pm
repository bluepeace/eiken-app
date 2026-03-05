package FCC::Class::Bankchar;
$VERSION = 1.00;
use strict;
use warnings;
use base qw(FCC::_Super);
use Carp;

sub init {
	my($self, %args) = @_;
}

sub conv_bank_account_name_han {
	my($self, $name) = @_;
	# 全角ハイフン、全角マイナス、全角音引を半角ハイフンに変換
	$name =~ s/\xE2\x80\x90/-/g; # ‐ (全角ハイフン)
	$name =~ s/\xE3\x83\xBC/-/g; # ー (全角音引)
	$name =~ s/\xEF\xBC\x8D/-/g; # － (全角マイナス)

	# 全角文字を半角に変換
	my $han = Unicode::Japanese->new($name)->z2h->get;
	return $han;
}

sub check_bank_account_name {
	my($self, $name, $caption) = @_;
	# ----------------------------------------
	# https://orange-factory.com/dnf/utf-8.html
	# https://www.japannetbank.co.jp/how_remittance_name.html
	# https://www.rakuten-bank.co.jp/login/receive-name.html
	# ----------------------------------------

	my $tmp = $name;
	$tmp =~ s/\xE3\x82[\xA1-\xBF]//g; # 全角カタカナ1
	$tmp =~ s/\xE3\x83[\x80-\xB6]//g; # 全角カタカナ2
	$tmp =~ s/\xEF\xBC[\x90-\x99]//g; # 全角数字 (０～９)
	$tmp =~ s/\xEF\xBC[\xA1-\xBA]//g; # 全角Ａ～Ｚ
	$tmp =~ s/\xEF\xBC\x8C//g; # ， (全角カンマ)
	$tmp =~ s/\xEF\xBC\x8E//g; # ． (全角ピリオド)
	$tmp =~ s/\xE2\x80\x90//g; # ‐ (全角ハイフン)
	$tmp =~ s/\xE3\x83\xBC//g; # ー (全角音引)
	$tmp =~ s/\xEF\xBC\x8D//g; # － (全角マイナス)
	$tmp =~ s/\xEF\xBC\x8F//g; # ／ (全角スラッシュ)
	$tmp =~ s/\xE3\x80\x8C//g; # 「 (かぎ括弧:開)
	$tmp =~ s/\xE3\x80\x8D//g; # 」 (かぎ括弧:閉)
	$tmp =~ s/\xEF\xBC\x88//g; # （ (開き括弧)
	$tmp =~ s/\xEF\xBC\x89//g; # ） (閉じ括弧)
	$tmp =~ s/\xEF\xBF\xA5//g; # ￥ (円マーク)
	$tmp =~ s/\xE3\x80\x80//g; # 全角スペース

	if($tmp) {
		return "\"${caption}\" は全角カナ、全角アルファベット大文字、全角数字、全角スペース、そして全角の記号 (， ． － ／「 」（ ）￥) を使って入力してください。";
	}

	my $err = "促音、拗音などの全角カタカナ小文字は利用できません。大文字に変換して入力してください。（誤:トップ, 正:トツプ）";
	if($name =~ /\xE3\x82[\xA1\xA3\xA5\xA7\xA9]/) { # ァィゥェォ
		return $err;
	}
	if($name =~ /\xE3\x83\x83/) { # ッ
		return $err;
	}
	if($name =~ /\xE3\x83[\xA3\xA5\xA7\xAE]/) { # ャュョヮ
		return $err;
	}
	if($name =~ /\xE3\x83[\xB5\xB6]/) { # ヵヶ
		return $err;
	}

	return "";
}

1;
