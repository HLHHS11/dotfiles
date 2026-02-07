# fvm defaultのFlutterパス
# export PATH="$PATH":"$HOME/fvm/default/bin"から修正
# export PATH="$HOME/fvm.default/bin:$PATH"
export PATH="$PATH":"$HOME/fvm/default/bin"

# rbenvでインストールしたrubyのパス
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenvの設定
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# tex関係のパス設定
export PATH="/Library/TeX/texbin:$PATH"

echo "dotfiles: private-macbook-air-2022.zsh loaded."