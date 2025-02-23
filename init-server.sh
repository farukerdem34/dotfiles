#!/bin/bash
packages='gcc make neovim stow tmux git curl'
if command -v sudo &>/dev/null; then
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install -y "$packages"
else
  apt update -y
  apt upgrade -y
  apt install -y "$packages"
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd "$HOME"/.dotfiles/ || git clone https://github.com/farukerdem34/dotfiles.git "$HOME"/.dotfiles
cd "$HOME"/.dotfiles || exit

if [[ -e "$HOME"/.bashrc ]]; then
  mv -u "$HOME"/.bashrc .bashrc.bak
fi

if [[ -e "$HOME"/.tmux.conf ]]; then
  mv -u "$HOME"/.tmux.conf .tmux.conf.bak
fi

if [[ -e "$HOME"/.config/nvim ]]; then
  rm -rf "$HOME"/.config/nvim
fi

stow bash nvim tmux

cd "$HOME" || exit
~/.tmux/plugins/tpm/bin/install_plugins

nvim --headless "+Lazy! sync" +qa

cd "$HOME" || exit

yes y | curl -sS https://starship.rs/install.sh | sh

if [[ -f "$HOME"/.bashrc ]]; then
  . .bashrc
fi
