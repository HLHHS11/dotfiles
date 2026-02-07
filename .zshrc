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

# fvm defaultのFlutterパス
# export PATH="$PATH":"$HOME/fvm/default/bin"から修正
# export PATH="$HOME/fvm.default/bin:$PATH"
export PATH="$PATH":"$HOME/fvm/default/bin"

# rbenvでインストールしたrubyのパス
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
# Flutter build runner alias
alias build-runner-alias="flutter pub run build_runner build --delete-conflicting-outputs"
# Dart build runner alias
alias dart-build-runner-alias="dart run build_runner build --delete-conflicting-outputs"
# 音を鳴らすコマンドのエイリアス
alias glass='afplay /System/Library/Sounds/Glass.aiff'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yama/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yama/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yama/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yama/google-cloud-sdk/completion.zsh.inc'; fi

# グローバルインストールしたDartツールを使えるようにするためのPATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Flutter 3.7.12にあわせたOpenJDK 17 を使うために設定
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
# For compilers to find openjdk you may need to set:
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenvの設定
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# tex関係のパス設定
export PATH="/Library/TeX/texbin:$PATH"

