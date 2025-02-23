#!/bin/bash
packages="stow neovim tmux bat fzf git gcc btop make fastfetch kitty zsh starship"
if command -v yay &>/dev/null; then
  yay -Syu $packages
elif command -v pacman &>/dev/null; then
  sudo pacman -Syu $packages
elif command -v apt &>/dev/null; then
  sudo apt update -y
  sudo apt install -y $packages
fi

git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

cd "

"/.dotfiles/

# Backup .bashrc
if [[ -e "

"/.bashrc ]]; then
  mv -u "

"/.bashrc .bashrc.bak
fi

# Backup .tmux.conf
if [[ -e "

"/.tmux.conf ]]; then
  mv -u "

"/.tmux.conf .tmux.conf.bak
fi

# Backup NeoVim Config
if [[ -d "

"/.config/nvim ]]; then
  tar -zcvf "

"/.config/nvim.bak "

"/.config/nvim
fi

# Backup Kitty Config
if [[ -d "

"/.config/kitty ]]; then
  tar -zcvf "

"/.config/kitty.bak "

"/.config/kitty
fi

# Backup fastfetch
if [[ -d "

"/.config/fastfetch ]]; then
  tar -zcvf "

"/.config/fastfetch.bak "

"/.config/fastfetch
fi

if [[ -d "

"/.config/bat ]]; then
  tar -zcvf "

"/.config/bat.bak "

"/.config/bat
fi

if [[ -d "

"/.config/btop ]]; then
  tar -zcvf "

"/.config/btop.bak "

"/.config/btop
fi

# Backup zsh
if [[ -e "

"/.zshrc ]]; then
  cp "

"/.zshrc "

"/.zshrc.bak
fi

stow bash bat fastfetch kitty nvim btop tmux vimrc zsh starship

cd "

"
~/.tmux/plugins/tpm/bin/install_plugins
nvim --headless "+Lazy! sync" +qa
cd "

"
. .bashrc
