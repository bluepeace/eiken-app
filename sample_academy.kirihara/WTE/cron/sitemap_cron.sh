#!/bin/bash
#############################################################
# サイトマップ生成 cron 用ラッパー
#
# 【標準のディレクトリ構成】
#   /var/www/html            … ドキュメントルート（sitemap.xml の出力先）
#   /var/www/WTE/cron        … 本スクリプト・sitemap_gen.pl を格納
#   /var/www/WTE/default     … default.ini.cgi を格納
#
# 使い方:
#   sh sitemap_cron.sh
#      → /var/www/WTE/default/default.ini.cgi を参照
#      → /var/www/html/sitemap.xml に出力
#   sh sitemap_cron.sh /path/to/WTE
#      → 指定した WTE の default/default.ini.cgi を参照
#      → その WTE の1つ上のディレクトリ/sitemap.xml に出力
#   sh sitemap_cron.sh /path/to/WTE /path/to/sitemap.xml
#      → WTE と出力先を両方指定
#
# cron 例（毎日 1:00）:
# 0 1 * * * /var/www/WTE/cron/sitemap_cron.sh >> /var/www/WTE/cron/logs/sitemap.log 2>&1
#############################################################
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"
PERL="perl"

if [ -n "$1" ]; then
  export WTE_ROOT="$1"
  if [ -n "$2" ]; then
    OUTPUT="$2"
  else
    OUTPUT="${WTE_ROOT}/../sitemap.xml"
  fi
else
  # 標準構成: cron が /var/www/WTE/cron のとき → /var/www/html/sitemap.xml
  OUTPUT="${SCRIPT_DIR}/../../html/sitemap.xml"
fi

"$PERL" "$SCRIPT_DIR/sitemap_gen.pl" "$OUTPUT"
ret=$?
echo "$(date '+%Y-%m-%d %H:%M:%S') sitemap_gen exit=$ret"
exit $ret
