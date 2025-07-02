#!/bin/bash

VERBOSE=0

while getopts "v" opt; do
  case $opt in
  v)
    VERBOSE=$((VERBOSE + 1))
    ;;
  esac
done

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

install_packages() {
  packages='sudo gcc make neovim stow tmux git curl eza zoxide gh'
  if command -v sudo &>/dev/null; then
    print_muave "Updating packages"
    sudo apt-get update -y -qq >/dev/null 2>&1
    print_muave "Upgrading packages"
    sudo apt-get upgrade -y -q >/dev/null 2>&1
    print_muave "Installing packages"
    sudo apt-get install -y -q $packages >/dev/null 2>&1
    print_green "Packages installed successfully"
  else
    print_muave "Updating packages"
    apt-get update -y -qq >/dev/null 2>&1
    print_muave "Upgrading packages"
    apt-get upgrade -y -q >/dev/null 2>&1
    print_muave "Installing packages"
    apt-get install -y -q $packages >/dev/null 2>&1
    print_green "Packages installed successfully"
  fi
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
    cd "$HOME"/.dotfiles >/dev/null 2>&1 || print_red "Failed to change directory to $HOME/.dotfiles"
  else
    print_muave "Cloning dotfiles"
    git clone https://github.com/farukerdem34/dotfiles.git $HOME/.dotfiles -q
    cd $HOME/.dotfiles >/dev/null 2>&1 || print_red "Failed to change directory to $HOME/.dotfiles"
    print_green "Dotfiles cloned successfully"
  fi
}

backup_dots() {
  if [[ -e "$HOME"/.bashrc ]]; then
    print_muave "Backing up .bashrc"
    mv -u "$HOME"/.bashrc .bashrc.bak
    print_green ".bashrc backed up successfully"
  fi

  if [[ -e "$HOME"/.tmux.conf ]]; then
    print_muave "Backing up .tmux.conf"
    mv -u "$HOME"/.tmux.conf .tmux.conf.bak
    print_green ".tmux.conf backed up successfully"
  fi

  if [[ -e "$HOME"/.config/nvim ]]; then
    print_muave "Backing up .config/nvim"
    rm -rf "$HOME"/.config/nvim
    print_green ".config/nvim backed up successfully"
  fi
}

stow_packages() {
  # Uncomment the line if you want to use LazyVim in you server
  # stow nvim
  cd $HOME/.dotfiles >/dev/null 2>&1 || print_red "Failed to change directory to $HOME/.dotfiles"
  print_muave "Stowing packages"
  stow bash tmux
  print_green "Packages stowed successfully"

}

install_lazyvim_packages() {
  print_muave "Installing LazyVim packages"
  nvim --headless "+Lazy! sync" +qa
  print_green "LazyVim packages installed successfully"
}

# Install Lazygit
install_lazygit() {
  print_muave "Installing LazyGit"
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit >/dev/null 2>&1
  sudo install lazygit -D -t /usr/local/bin/ >/dev/null 2>&1
  print_green "LazyGit installed successfully"
}

# Install Docker
install_docker() {
  print_muave "Installing Docker"
  curl -s https://get.docker.com | bash >/dev/null 2>&1
  print_green "Docker installed successfully"
}

# Install LazyDocker
install_lazydocker() {
  print_muave "Installing LazyDocker"
  curl -s https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash >/dev/null 2>&1
  print_green "LazyDocker installed successfully"
}

# Install Starship
install_starship() {
  print_muave "Installing Starship"
  curl -sS https://starship.rs/install.sh | sh
  print_green "Starship installed successfully"
}

source_bashrc() {
  print_muave "Sourcing .bashrc"
  if [[ -f "$HOME"/.bashrc ]]; then
    cd "$HOME" >/dev/null 2>&1 || print_red "Failed to change directory to $HOME"
    . .bashrc
  fi
  print_green ".bashrc sourced successfully"
}

install_packages
clone_repo
backup_dots
stow_packages
install_tpm
install_docker
install_lazydocker
install_lazygit
install_starship
source_bashrc
print_green "Server setup completed successfully"
tmux
