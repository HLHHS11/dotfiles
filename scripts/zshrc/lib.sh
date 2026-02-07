# zshrc 用スクリプトの共通定義。source して使う。
# 呼び元（list.sh / edit.sh）のパスからリポジトリルートを決める。
set -ue
ZSHRC_SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_ROOT="$(cd "${ZSHRC_SCRIPT_DIR}/../.." && pwd)"
MANIFEST="${DOTFILES_ROOT}/zshrc.d/MANIFEST"
ZSHRC_D="${DOTFILES_ROOT}/zshrc.d"

# 名前（MANIFEST の第1列）→ 絶対パスを返す（無ければ空）。MANIFEST は TSV: 名前\t説明\tファイル名
get_path_for_name() {
	name="$1"
	while IFS='	' read -r a desc fname; do
		[ "$a" = "$name" ] && echo "${ZSHRC_D}/${fname}" && return
	done < "$MANIFEST"
}
