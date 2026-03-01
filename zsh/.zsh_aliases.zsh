# Aliases
if command -v eza &> /dev/null;
then
    alias ll='eza -lha --icons=always --color=always'
    alias ls='eza --icons=always --color=always'
else
    alias ls='ls --color'
    alias ll='ls -lh --color'
fi
alias nano='vim'
alias vi='vim'


if [[ $TERM == "xterm-kitty" ]] ;
then 
    alias ssh="kitty +kitten ssh"
    alias icat="kitten icat "
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

if command -v lazygit &> /dev/null; then
  alias lzg="lazygit"
fi

if command -v lazydocker &> /dev/null; then
  alias lzd="lazydocker"
fi

alias dc='docker compose'
export PATH=$PATH:$HOME/.local/bin/
alias wg='sudo wg'
alias wg-quick='sudo wg-quick'
