#!/usr/bin/env sh
# 現在の環境を表示する。get_dotfiles_env 関数（lib）を使い、結果が空なら "(not set)" を表示。
set -ue
DOTFILES_SCRIPTS="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=./lib/dotfiles-env.sh
. "${DOTFILES_SCRIPTS}/lib/dotfiles-env.sh"
result=$(get_dotfiles_env)
if [ -z "$result" ]; then
	echo "(not set)"
else
	echo "$result"
fi
