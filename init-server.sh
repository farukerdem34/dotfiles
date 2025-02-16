#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y gcc make nvim stow
git clone https://github.com/farukerdem34/dotfiles $HOME/.dotfiles
cd $HOME/.dotfiles/
mv -u $HOME/.bashrc .bashrc.bak
stow bash nvim
cd $HOME
. .bashrc
