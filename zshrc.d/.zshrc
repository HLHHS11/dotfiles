# ローダー: 共有ファイルを番号順に source し、その後「環境」に応じて local/${ENV}.zsh のみ source
# この .zshrc の所在ディレクトリ（%x の絶対パスの :h）を ZSHRC_D にセット
ZSHRC_D="${${(%):-%x}:A:h}"

# dotfiles の make をどこからでも実行できるようにする
DOTFILES_ROOT="${ZSHRC_D}/.."
dotfiles() { make -C "${DOTFILES_ROOT}" "$@"; }

for i in $(/bin/ls "$ZSHRC_D"/[0-9]*-*.zsh 2>/dev/null | sort); do
	# shellcheck source=/dev/null
	source "$i"
done
# shellcheck source=/dev/null
source "$ZSHRC_D/../scripts/lib/dotfiles-env.sh"
DOTFILES_ENV_NAME=$(get_dotfiles_env)
if [ -n "$DOTFILES_ENV_NAME" ] && [ -f "$ZSHRC_D/local/${DOTFILES_ENV_NAME}.zsh" ]; then
	# shellcheck source=/dev/null
	source "$ZSHRC_D/local/${DOTFILES_ENV_NAME}.zsh"
fi
