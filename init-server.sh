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
  packages='sudo stow tmux git curl eza zoxide '
  if command -v sudo &>/dev/null; then
    local update="sudo apt-get update -y"
    local upgrade="sudo apt-get upgrade -y"
    local install="sudo apt-get install $packages"
    if [[ $VERBOSE -ge 1 ]]; then
      update="$update -qq > /dev/null"
      upgrade="$upgrade -qq > /dev/null"
      install="$install -qq > /dev/null"
    fi
    print_muave "Updating packages"
    bach -c $update
    print_muave "Upgrading packages"
    bash -c $upgrade
    print_muave "Installing packages"
    bash -c $install
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
  local clone_tpm='git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'
  local install_plugins="$HOME/.tmux/plugins/tpm/bin/install_plugins"

  if [[ $VERBOSE -le 1 ]]; then
    clone_tpm="$clone_tpm -q"
    install_plugins="$install_plugins >/dev/null 2>&1"
  fi
  bash -c $clone_tpm
  print_muave "Installing TPM plugins"
  bash -c $install_plugins
  print_green "TPM installed successfully"
}

clone_repo() {
  if [[ -d "$HOME"/.dotfiles ]]; then
    print_muave "$HOME/.dotfiles already exists"
    cd "$HOME"/.dotfiles >/dev/null 2>&1 || print_red "Failed to change directory to $HOME/.dotfiles"
  else
    local clone_dotfiles="git clone https://github.com/farukerdem34/dotfiles.git $HOME/.dotfiles"
    if [[ $VERBOSE -ge 1 ]]; then
      clone_dotfiles="$clone_dotfiles -q"
    fi
    print_muave "Cloning dotfiles"
    bash -c $clone_dotfiles
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
}

stow_packages() {
  # Uncomment the line if you want to use LazyVim in you server
  # stow nvim
  cd $HOME/.dotfiles >/dev/null 2>&1 || print_red "Failed to change directory to $HOME/.dotfiles"
  print_muave "Stowing packages"
  stow bash tmux
  print_green "Packages stowed successfully"

}

# Install Lazygit
install_lazygit() {
  print_muave "Installing LazyGit"
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  local install_targz="curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz""
  local extract_targz="tar xf lazygit.tar.gz lazygit"
  local install_lazygit_cmd="sudo install lazygit -D -t /usr/local/bin/"
  if [[ $VERBOSE -ge 1 ]]; then
    install_targz="$install_targz -s"
    extract_targz="$extract_targz >/dev/null 2>&1"
    install_lazygit_cmd="$install_lazygit_cmd >/dev/null 2>&1"
  fi
  bash -c $install_targz
  bash -c $extract_targz
  bash -c $install_lazygit_cmd
  print_green "LazyGit installed successfully"
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
install_lazygit
install_starship
source_bashrc
print_green "Server setup completed successfully"
