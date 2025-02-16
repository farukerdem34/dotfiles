#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y gcc make neovim stow tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd $HOME/.dotfiles/

if [[ -e $HOME/.bashrc ]]; then
  mv -u $HOME/.bashrc .bashrc.bak
fi

if [[ -e $HOME/.tmux.conf ]]; then
  mv -u $HOME/.tmux.conf .tmux.conf.bak
fi

if [[ -e $HOME/.config/nvim ]]; then
  rm -rf $HOME/.config/nvim
fi

stow bash nvim tmux

cd $HOME
~/.tmux/plugins/tpm/bin/install_plugins
nvim --headless "+Lazy! sync" +qa
cd $HOME
. .bashrc
