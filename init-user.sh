#!/bin/bash

print_muave() {
  echo -e "\e[38;2;203;166;247m$1\e[0m"
}
print_red() {
  echo -e "\e[38;2;243;139;168m$1\e[0m"
  exit
}

print_green() {
  echo -e "\e[38;2;166;227;161m$1\e[0m"
}

alias yayy="yay --noconfirm --color always "

install_hyprland() {
  packages="hyprland hyprshot hypridle hyprlock hyprpaper aswaync blueberry waybar"
  yayy $packages
}

install_packages() {
  print_muave "Installing packages"
  packages="stow neovim tmux bat fzf git gcc btop make fastfetch kitty zsh starship lazygit lazydocker zoxide eza"
  if command -v yay &>/dev/null; then
    yay -Syu $packages
  elif command -v pacman &>/dev/null; then
    sudo pacman -Syu $packages
    # elif command -v apt-get &>/dev/null; then
    #   sudo apt-get update -y
    #   sudo apt-get install -y $packages
  else
    print_red "No valid package manager found"
    exit 1
  fi
  print_green "Packages installed"
}

install_tpm() {
  print_muave "Cloning TPM"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm -q
  print_muave "Installing TPM plugins"
  ~/.tmux/plugins/tpm/bin/install_plugins >/dev/null 2>&1
  print_green "TPM installed successfully"
}

clone_repo() {
  if [[ -d "$HOME"/.dotfiles ]]; then
    print_muave "$HOME/.dotfiles already exists"
    read -p "The repository in the $HOME/.dotfiles will be git reset --hard, are you verify this action?" hard_reset
    if [[ $hard_reset == "yes" ]]; then
      cd $HOME/.dotfiles || print_red "Failed to change directory to $HOME/.dotfiles"
      git reset --hard
      git fetch
      git pull
    else
      print_green "Skipping dotfiles cloning"
    fi
  else
    print_muave "Cloning dotfiles"
    git clone https://github.com/farukerdem34/dotfiles.git $HOME/.dotfiles -q
    print_green "Dotfiles cloned successfully"
  fi
}

backup() {
  # Backup .bashrc
  if [[ -e ~/.bashrc ]]; then
    print_muave "Backing up .bashrc"
    mv -u ~/.bashrc .bashrc.bak
  fi

  if [[ -e ~/.bash_aliases ]]; then
    print_muave "Backing up .bash_aliases"
    mv ~/.bash_aliases ~/.bash_aliases.bak
  fi

  if [[ -e ~/.bash_completions ]]; then
    print_muave "Backing up .bash_completions"
    mv ~/.bash_completions ~/.bash_completions.bak
  fi

  # Backup .tmux.conf
  if [[ -e ~/.tmux.conf ]]; then
    print_muave "Backing up .tmux.conf"
    mv -u ~/.tmux.conf .tmux.conf.bak
  fi

  # Backup NeoVim Config
  if [[ -d ~/.config/nvim ]]; then
    print_muave "Backing up nvim"
    tar -zcvf ~/.config/nvim.bak ~/.config/nvim
    rm -rf ~/.config/nvim
  fi

  # Backup Kitty Config
  if [[ -d ~/.config/kitty ]]; then
    print_muave "Backing up kitty"
    tar -zcvf ~/.config/kitty.bak ~/.config/kitty
    rm -rf ~/.config/kitty
  fi

  # Backup fastfetch
  if [[ -d ~/.config/fastfetch ]]; then
    print_muave "Backing up fastfetch"
    tar -zcvf ~/.config/fastfetch.bak ~/.config/fastfetch
    rm -rf ~/.config/fastfetch
  fi

  # Backup bat
  if [[ -d ~/.config/bat ]]; then
    print_muave "Backing up bat"
    tar -zcvf ~/.config/bat.bak ~/.config/bat
    rm -rf ~/.config/bat
  fi

  # Backup btop
  if [[ -d ~/.config/btop ]]; then
    muaave "Backing up btop"
    tar -zcvf ~/.config/btop.bak ~/.config/btop
    rm -rf ~/.config/btop
  fi

  # Backup zsh
  if [[ -e ~/.zshrc ]]; then
    print_muave "Backing up zsh"
    mv ~/.zshrc ~/.zshrc.bak
  fi

  if [[ -e ~/.zsh_aliases.zsh ]]; then
    print_muave "Backing up zsh_aliases"
    mv ~/.zsh_alieses ~/.zsh_alieses.bak
  fi

  if [[ -e ~/.zsh_completion_sources.zsh ]]; then
    print_muave "Backing up zsh_completion_sources"
    mv ~/.zsh_completion_sources.zsh ~/.zsh_completion_sources.zsh.bak
  fi
  print_green "Backups created successfully"
}

stow_packages() {
  cd ~/.dotfiles || print_red "Failed to change directory to $HOME/.dotfiles"
  print_muave "Stowing packages"
  stow nvim tmux bat btop fastfetch kitty zsh starship
  print_green "Packages stowed successfully"
}

install_lazyvim() {
  print_muave "Installing LazyVim"
  nvim --headless "+Lazy! sync" +qa
  print_green "LazyVim installed successfully"
}

print_muave "Dotfiles installed successfully"
tmux
