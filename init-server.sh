#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y gcc make nvim stow tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd $HOME/.dotfiles/
mv -u $HOME/.bashrc .bashrc.bak
mv -u $HOME/.tmux.conf .tmux.conf.bak
rm -rf $HOME/.config/nvim

stow bash nvim tmux

cd $HOME
~/.tmux/plugins/tpm/bin/install_plugins
nvim --headless "+Lazy! sync" +qa
. .bashrc
