#!/bin/bash
packages='gcc make neovim stow tmux git curl eza zoxide gh'
if command -v sudo &>/dev/null; then
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install -y $packages
else
  apt update -y
  apt upgrade -y
  apt install -y $packages
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

stow bash tmux

# Uncomment the line if you want to use LazyVim in you server
# stow nvim

cd "$HOME" || exit
~/.tmux/plugins/tpm/bin/install_plugins

# nvim --headless "+Lazy! sync" +qa

cd "$HOME" || exit

# Install Lazygit
#
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Install Docker
curl https://get.docker.com | bash

# Install LazyDocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

yes y | curl -sS https://starship.rs/install.sh | sh

if [[ -f "$HOME"/.bashrc ]]; then
  . .bashrc
fi
