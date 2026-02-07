#!/usr/bin/env sh
# 分割ファイルを編集。NAME 指定でそのファイル、未指定で現在の env の local ファイルを開く。
set -ue
# shellcheck source=./lib.sh
. "$(dirname "$0")/lib.sh"

name="${1:-}"
if [ -n "$name" ]; then
	p=$(get_path_for_name "$name")
	if [ -z "$p" ]; then
		echo "unknown name: $name" >&2
		exit 1
	fi
	exec "${EDITOR:-vi}" "$p"
else
	# 未指定なら現在の env の local ファイルを開く
	# shellcheck source=../lib/dotfiles-env.sh
	. "${DOTFILES_ROOT}/scripts/lib/dotfiles-env.sh"
	env_name=$(get_dotfiles_env)
	if [ -z "$env_name" ]; then
		echo "env がセットされていません。開けません。（make env-set ENV=xxx でセット）" >&2
		exit 1
	fi
	p="${ZSHRC_D}/local/${env_name}.zsh"
	if [ ! -f "$p" ]; then
		echo "local 用ファイルがありません: $p" >&2
		exit 1
	fi
	exec "${EDITOR:-vi}" "$p"
fi
