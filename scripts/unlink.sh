#!/usr/bin/env sh
set -ue

[ -L "${HOME}/.zshrc" ] && unlink "${HOME}/.zshrc"

if [ "$(uname)" = "Darwin" ]; then
	for f in settings.json keybindings.json; do
		[ -L "${HOME}/Library/Application Support/Code/User/$f" ] && unlink "${HOME}/Library/Application Support/Code/User/$f"
		[ -L "${HOME}/Library/Application Support/Cursor/User/$f" ] && unlink "${HOME}/Library/Application Support/Cursor/User/$f"
	done
fi
