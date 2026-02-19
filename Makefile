define _help
	echo 'link               : シンボリックリンクを張る'
	echo 'unlink             : シンボリックリンクを外す'
	echo ''
	echo 'env                : 環境（zshrc 以外でも使う共通の「現在の環境」）のヘルプ (make env で一覧)'
	echo '  env.set   : 環境をセット (ENV=xxx)'
	echo '  env.show  : 現在の環境を表示'
	echo ''
	echo 'zshrc              : zshrc.d 用サブコマンドのヘルプ (make zshrc で一覧)'
	echo '  zshrc.list       : 分割ファイルを一覧 (DETAIL=1 でファイルパスも表示)'
	echo '  zshrc.edit       : 分割ファイルを編集 (NAME=xxx でそのファイル、未指定で現在 env の local)'
	echo ''
	echo 'help               : この一覧を表示'
endef

.PHONY: default help link unlink env env.set env.show zshrc zshrc.list zshrc.edit
default: help
help:
	@$(call _help)

.PHONY: link
link:
	sh "$(CURDIR)/scripts/link.sh"

.PHONY: unlink
unlink:
	sh "$(CURDIR)/scripts/unlink.sh"

define _help_zshrc
	echo 'zshrc サブコマンド:'
	echo '  make zshrc.list [DETAIL=1]    : 一覧 (DETAIL=1 でファイルパスも表示)'
	echo '  make zshrc.edit [NAME=xxx]   : 編集 (NAME 未指定で現在 env の local ファイル)'
endef

define _help_env
	echo 'env（環境）: zshrc に限らず dotfiles 全体で使う「現在の環境」'
	echo '  make env.set ENV=xxx   : 環境をセット (~/.config/dotfiles/env に保存)'
	echo '  make env.show          : 現在の環境を表示'
endef

.PHONY: env
env:
	@$(call _help_env)

.PHONY: env.set
env.set:
	@sh "$(CURDIR)/scripts/env-set.sh" "$(ENV)"

.PHONY: env.show
env.show:
	@sh "$(CURDIR)/scripts/env-show.sh"

.PHONY: zshrc
zshrc:
	@$(call _help_zshrc)

.PHONY: zshrc.list
zshrc.list:
	sh "$(CURDIR)/scripts/zshrc/list.sh" "$(DETAIL)"

.PHONY: zshrc.edit
zshrc.edit:
	@sh "$(CURDIR)/scripts/zshrc/edit.sh" "$(NAME)"

