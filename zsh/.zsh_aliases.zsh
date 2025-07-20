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

if  command -v wg &> /dev/null ; then
  alias wg='sudo wg'
  alias wg-quick='sudo wg-quick'
fi

if  command -v fastfetch &> /dev/null ; then
alias ff='fastfetch -c $HOME/.config/fastfetch/config.jsonc'
fi

if  command -v bat &> /dev/null ; then
  alias bat='bat --theme="Dracula" --color=always -p '
  alias cat=bat
fi
if  command -v fzf &> /dev/null ; then
  alias fzf='fzf --preview "bat --theme=\"Catppuccin Macchiato\" --color=always  {}"'
  alias vimzf='vim $(fzf)'
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

alias kali='distrobox enter kali-rolling-latest'
