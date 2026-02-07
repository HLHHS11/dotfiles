#!/usr/bin/env sh
set -ue

[ -L "${HOME}/.zshrc" ] && unlink "${HOME}/.zshrc"

if [ "$(uname)" = "Darwin" ]; then
	[ -L "${HOME}/Library/Application Support/Code/User/settings.json" ] && unlink "${HOME}/Library/Application Support/Code/User/settings.json"
	[ -L "${HOME}/Library/Application Support/Cursor/User/settings.json" ] && unlink "${HOME}/Library/Application Support/Cursor/User/settings.json"
fi
