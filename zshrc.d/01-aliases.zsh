PS1="%F{magenta}%n%f:%F{yellow}%d%f %# "
# lsをls -Gへ
alias ls="ls -G"
# その他lsエイリアス
alias la="ls -a"
alias l="ls"
# 安全策
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# gitの直前のコミットハッシュをコピーする
alias copyhash='git rev-parse HEAD | pbcopy'
# Wi-Fi不調時に再起動する
alias if-updown='sudo ifconfig en0 down && sudo ifconfig en0 up'
# 音を鳴らす
alias afg='afplay /System/Library/Sounds/Glass.aiff'

# Flutter build runner alias
alias build-runner-alias="flutter pub run build_runner build --delete-conflicting-outputs"
# Dart build runner alias
alias dart-build-runner-alias="dart run build_runner build --delete-conflicting-outputs"
# 音を鳴らすコマンドのエイリアス
alias glass='afplay /System/Library/Sounds/Glass.aiff'
