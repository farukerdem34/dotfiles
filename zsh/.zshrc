# 1. Önce fpath tanımlanmalı (compinit'ten ÖNCE)
fpath=(/Users/faruk/.docker/completions ~/.zsh/completions $fpath)

# 2. Zinit ve Eklentiler
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# 3. compinit sadece BURADA (fpath'ten SONRA) bir kez çağrılmalı
autoload -Uz compinit && compinit

# 4. Diğer Ayarlar ve Bindkey'ler
set -o vi
# ... bindkey satırların ...

# 5. Exportlar ve Aliaslar
export PATH=$PATH:$HOME/.local/bin/
source ~/.zsh_aliases.zsh
alias garak='/Users/faruk/.local/share/garak/.venv/bin/garak'

# 6. Prompt ve Tool Initleri
eval "$(starship init zsh)"

# Bun ayarları
[ -s "/Users/faruk/.bun/_bun" ] && source "/Users/faruk/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Flutter Start
export PATH=$PATH:$HOME/.flutter/flutter/bin
export CHROME_EXECUTABLE=/Applications/Safari.app/Contents/MacOS/Safari
# Flutter End
