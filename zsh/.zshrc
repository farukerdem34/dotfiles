# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "~" delete-char
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit
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

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

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

if command -v docker &> /dev/null;
then
    source <(docker completion zsh)
fi

if  command -v gh &> /dev/null;
then 
    source <(gh completion -s zsh)
fi

if  [[ $TERM == "xterm-kitty" ]];
then 
    alias ssh="kitty +kitten ssh"
fi
if  command -v yay &> /dev/null;
then 
    alias yayy='yay --noconfirm --color always '
fi

export EDITOR=/usr/bin/vim
export PATH=$PATH:$HOME/.local/bin/
alias wg='sudo wg'
alias wg-quick='sudo wg-quick'
alias ff='fastfetch -c $HOME/.config/fastfetch/config.jsonc'
alias copilot='gh copilot explain '
alias bat='bat --theme="Catppuccin Macchiato" --color=always -p '
alias cat=bat
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias vimzf='vim $(fzf)'
alias vim=nvim
