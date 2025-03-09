#!/bin/bash
packages="stow neovim tmux bat fzf git gcc btop make fastfetch kitty zsh starship lazygit lazydocker zoxide eza"
if command -v yay &>/dev/null; then
  yay -Syu $packages
elif command -v pacman &>/dev/null; then
  sudo pacman -Syu $packages
elif command -v apt-get &>/dev/null; then
  sudo apt-get update -y
  sudo apt-get install -y $packages
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [[ -e ~/.dotfiles ]]; then
  cd ~/.dotfiles/ || exit
else
  git clone https://github.com/farukerdem34/dotfiles ~/.dotfiles
  cd ~/.dotfiles || exit
fi
# Backup .bashrc
if [[ -e ~/.bashrc ]]; then
  mv -u ~/.bashrc .bashrc.bak
fi

if [[ -e ~/.bash_aliases ]]; then
  mv ~/.bash_aliases ~/.bash_aliases.bak
fi

if [[ -e ~/.bash_completions ]]; then
  mv ~/.bash_completions ~/.bash_completions.bak
fi

# Backup .tmux.conf
if [[ -e ~/.tmux.conf ]]; then
  mv -u ~/.tmux.conf .tmux.conf.bak
fi

# Backup NeoVim Config
if [[ -d ~/.config/nvim ]]; then
  tar -zcvf ~/.config/nvim.bak ~/.config/nvim
fi

# Backup Kitty Config
if [[ -d ~/.config/kitty ]]; then
  tar -zcvf ~/.config/kitty.bak ~/.config/kitty
fi

# Backup fastfetch
if [[ -d ~/.config/fastfetch ]]; then
  tar -zcvf ~/.config/fastfetch.bak ~/.config/fastfetch
fi

# Backup bat
if [[ -d ~/.config/bat ]]; then
  tar -zcvf ~/.config/bat.bak ~/.config/bat
fi

# Backup btop
if [[ -d ~/.config/btop ]]; then
  tar -zcvf ~/.config/btop.bak ~/.config/btop
fi

# Backup zsh
if [[ -e ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.bak
fi

if [[ -e ~/.zsh_aliases.zsh ]]; then
  mv ~/.zsh_alieses ~/.zsh_alieses.bak
fi

if [[ -e ~/.zsh_completion_sources.zsh ]]; then
  mv ~/.zsh_completion_sources.zsh ~/.zsh_completion_sources.zsh.bak
fi

stow nvim tmux bat btop fastfetch kitty zsh starship

~/.tmux/plugins/tpm/bin/install_plugins

nvim --headless "+Lazy! sync" +qa

if [[ -z $BASH_VERSION ]]; then
  . ~/.bashrc
elif [[ -z $ZSH_VERSION ]]; then
  . ~/.zshrc
fi
