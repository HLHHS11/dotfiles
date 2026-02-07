# 現在の dotfiles 環境名を取得する関数。source して get_dotfiles_env を呼ぶ。
# 出力: DOTFILES_ENV がセットされていればその値、そうでなければ ~/.config/dotfiles/env の 1 行目（末尾空白除く）。どちらも無ければ空。
# zsh / sh のどちらからも source 可能。
get_dotfiles_env() {
	if [ -n "${DOTFILES_ENV:-}" ]; then
		echo "${DOTFILES_ENV}"
		return 0
	fi
	if [ -f "${HOME}/.config/dotfiles/env" ]; then
		read -r line < "${HOME}/.config/dotfiles/env" || true
		echo "${line%%[[:space:]]*}"
	fi
}
