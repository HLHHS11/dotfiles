#!/usr/bin/env sh
# 分割ファイル一覧。DETAIL=1 でファイルパスも表示。
set -ue
# shellcheck source=./lib.sh
. "$(dirname "$0")/lib.sh"

show_path=0
case "${1:-}" in 1|detail|yes) show_path=1 ;; esac

echo "zshrc の分割ファイル一覧"
echo ""
if [ "$show_path" = 1 ]; then
	printf "  %-12s %-36s %s\n" "名前" "説明" "ファイルパス"
	printf "  %-12s %-36s %s\n" "----------" "------------------------------------" "------------------"
	while IFS='	' read -r a desc fname; do
		[ -z "$a" ] && continue
		printf "  %-12s %-36s %s\n" "$a" "$desc" "${ZSHRC_D}/${fname}"
	done < "$MANIFEST"
else
	printf "  %-12s %s\n" "名前" "説明"
	printf "  %-12s %s\n" "----------" "------------------------------------"
	while IFS='	' read -r a desc fname; do
		[ -z "$a" ] && continue
		printf "  %-12s %s\n" "$a" "$desc"
	done < "$MANIFEST"
	echo ""
	echo "  詳細（ファイルパス）を出す: make zshrc-list DETAIL=1"
fi
