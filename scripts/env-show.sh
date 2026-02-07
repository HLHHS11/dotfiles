#!/usr/bin/env sh
# 現在の環境（~/.config/dotfiles/env の内容）を表示する。ファイルがなければ "(not set)"
set -ue
env_file="${HOME}/.config/dotfiles/env"
if [ -f "$env_file" ]; then
	cat "$env_file"
else
	echo "(not set)"
fi
