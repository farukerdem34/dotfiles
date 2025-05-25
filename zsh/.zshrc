bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last actionZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share/zinit/zinit.git}"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1; 


zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

export PATH=$PATH:$HOME/.local/bin/:/home/linuxbrew/.linuxbrew/bin
# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Imports
source ~/.zsh_aliases.zsh
source ~/.zsh_completion_sources.zsh

eval "$(starship init zsh)"
