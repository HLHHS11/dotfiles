# ローダー: 共有ファイルを番号順に source し、その後「環境」に応じて local/${ENV}.zsh のみ source
ZSHRC_D="${0:A:h}"
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
