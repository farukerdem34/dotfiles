# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
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
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

export PATH=$PATH:$HOME/.local/bin/ 
# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Completion Sources
if  command -v kubectl &> /dev/null;
then 
    source <(kubectl completion zsh)
fi

if  command -v hcloud &> /dev/null;
then 
    source <(hcloud completion zsh)
fi

if command -v fzf &> /dev/null;
then
    source <(fzf --zsh)
fi


# Aliases
if command -v eza &> /dev/null;
then
    alias ll='eza -lh --icons=always --color=always'
    alias ls='eza --icons=always --color=always'
else
    alias ls='ls --color'
    alias ll='ls -lh --color'
fi
alias nano='vim'
alias vi='vim'

if command -v docker &> /dev/null;
then
    source <(docker completion zsh)
fi

if  command -v gh &> /dev/null;
then 
    source <(gh completion -s zsh)
fi

if [[ $TERM == "xterm-kitty" ]] ;
then 
    alias ssh="kitty +kitten ssh"
fi
if  command -v yay &> /dev/null;
then 
    alias yayy='yay --noconfirm --color always '
fi

if command -v zoxide &> /dev/null;
then
  eval "$(zoxide init --cmd cd zsh)"
fi


if command -v nvim &> /dev/null; then
  export EDITOR=/usr/bin/nvim
  alias vim=nvim
fi

if  command -v wg &> /dev/null ; then
  alias wg='sudo wg'
  alias wg-quick='sudo wg-quick'
fi

if  command -v fastfetch &> /dev/null ; then
alias ff='fastfetch -c $HOME/.config/fastfetch/config.jsonc'
fi

alias copilot='gh copilot explain '
if  command -v bat &> /dev/null ; then
  alias bat='bat --theme="Catppuccin Macchiato" --color=always -p '
  alias cat=bat
fi
if  command -v fzf &> /dev/null ; then
  alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
  alias vimzf='vim $(fzf)'
fi

if command -v lazygit &> /dev/null; then
  alias lzg="lazygit"
fi

if command -v lazydocker &> /dev/null; then
  alias lzd="lazydocker"
fi

alias dc='docker compose'
