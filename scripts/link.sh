#!/usr/bin/env sh
set -ue

DOTFILES_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# ~/.zshrc → dotfiles/zshrc.d/.zshrc
if [ -L "${HOME}/.zshrc" ]; then
	unlink "${HOME}/.zshrc"
fi
ln -sf "${DOTFILES_ROOT}/zshrc.d/.zshrc" "${HOME}/.zshrc"

# VSCode settings.json / keybindings.json
if [ "$(uname)" = "Darwin" ]; then
	CODE_USER="${HOME}/Library/Application Support/Code/User"
	mkdir -p "${CODE_USER}"
	for f in settings.json keybindings.json; do
		[ -L "${CODE_USER}/$f" ] && unlink "${CODE_USER}/$f"
		[ -f "${DOTFILES_ROOT}/vscode/$f" ] && ln -sf "${DOTFILES_ROOT}/vscode/$f" "${CODE_USER}/$f"
	done

	# Cursor settings.json / keybindings.json
	CURSOR_USER="${HOME}/Library/Application Support/Cursor/User"
	mkdir -p "${CURSOR_USER}"
	for f in settings.json keybindings.json; do
		[ -L "${CURSOR_USER}/$f" ] && unlink "${CURSOR_USER}/$f"
		[ -f "${DOTFILES_ROOT}/cursor/$f" ] && ln -sf "${DOTFILES_ROOT}/cursor/$f" "${CURSOR_USER}/$f"
	done
fi
