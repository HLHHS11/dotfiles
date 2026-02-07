#!/usr/bin/env sh
set -ue

DOTFILES_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# ~/.zshrc → dotfiles/zshrc.d/.zshrc
if [ -L "${HOME}/.zshrc" ]; then
	unlink "${HOME}/.zshrc"
fi
ln -sf "${DOTFILES_ROOT}/zshrc.d/.zshrc" "${HOME}/.zshrc"

# VSCode settings.json
if [ "$(uname)" = "Darwin" ]; then
	CODE_USER="${HOME}/Library/Application Support/Code/User"
	mkdir -p "${CODE_USER}"
	if [ -L "${CODE_USER}/settings.json" ]; then
		unlink "${CODE_USER}/settings.json"
	fi
	ln -sf "${DOTFILES_ROOT}/vscode/settings.json" "${CODE_USER}/settings.json"

	# Cursor settings.json
	CURSOR_USER="${HOME}/Library/Application Support/Cursor/User"
	mkdir -p "${CURSOR_USER}"
	if [ -L "${CURSOR_USER}/settings.json" ]; then
		unlink "${CURSOR_USER}/settings.json"
	fi
	ln -sf "${DOTFILES_ROOT}/cursor/settings.json" "${CURSOR_USER}/settings.json"
fi
