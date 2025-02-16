#!/bin/bash
packages="stow neovim tmux bat fzf git gcc btop make fastfetch kitty zsh"
if [[ command -v yay &> /dev/null ]]; then
  yay -Syu $packages
elif [[ command -v pacman &> /dev/null ]]; then
  sudo pacman -Syu $packages  
elif [[ command -v apt &> /dev/null ]]; then
  sudo apt update -y
  sudo apt install -y $packages
fi


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd $HOME/.dotfiles/



# Backup .bashrc
if [[ -e $HOME/.bashrc ]]; then
  mv -u $HOME/.bashrc .bashrc.bak
fi

# Backup .tmux.conf
if [[ -e $HOME/.tmux.conf ]]; then
  mv -u $HOME/.tmux.conf .tmux.conf.bak
fi

# Backup NeoVim Config
if [[ -d $HOME/.config/nvim ]]; then
  tar -zcvf $HOME/.config/nvim.bak $HOME/.config/nvim  
fi

# Backup Kitty Config 
if [[ -d $HOME/.config/kitty ]]; then
  tar -zcvf $HOME/.config/kitty.bak $HOME/.config/kitty
fi

# Backup fastfetch
if [[ -d $HOME/.config/fastfetch ]]; then
  tar -zcvf $HOME/.config/fastfetch.bak $HOME/.config/fastfetch
fi

if [[ -d $HOME/.config/bat ]]; then
  tar -zcvf $HOME/.config/bat.bak $HOME/.config/bat
fi

if [[ -d $HOME/.config/btop ]]; then
  tar -zcvf $HOME/.config/btop.bak $HOME/.config/btop
fi

# Backup zsh
if [[ -e $HOME/.zshrc ]]; then
  cp $HOME/.zshrc $HOME/.zshrc.bak
fi

# Backup P10k 
if [[ -e $HOME/.p10k.zsh ]]; then
  cp $HOME/.p10k.zsh $HOME/.p10k.zsh.bak
fi

stow bash bat fastfetch kitty nvim btop tmux vimrc zsh

cd $HOME
~/.tmux/plugins/tpm/bin/install_plugins
nvim --headless "+Lazy! sync" +qa
cd $HOME
. .bashrc
