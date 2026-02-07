#!/usr/bin/env sh
# 環境を ~/.config/dotfiles/env に 1 行で書き込む（リポジトリには含めない）
set -ue
env_name="${1:-}"
if [ -z "$env_name" ]; then
	echo "usage: $0 <env-name>" >&2
	echo "  e.g. $0 private-macbook-air-2022" >&2
	exit 1
fi
dir="${HOME}/.config/dotfiles"
mkdir -p "$dir"
echo "$env_name" > "${dir}/env"
echo "env set to: $env_name (saved in ${dir}/env)"
