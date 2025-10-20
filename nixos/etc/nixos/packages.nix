{ config, pkgs, ... }:

{
  # Flatpak
  services.flatpak.enable = true;
 environment.systemPackages = with pkgs; [
# Base
  wget
  firefox
  kitty
  tmux
  stow
  git
  bat
  btop
  wireguard-tools
  teamspeak3
  qbittorrent
  yt-dlp
  ffmpeg
# Corprete Hell 
  teams-for-linux
  # easyeffects
  thunderbird
  obsidian
  libreoffice
  spotify
# Fancy Shell
  zsh
  starship
  eza
  zoxide
  neovim
  fastfetch
  fzf
  ripgrep
  fd
  imagemagick
# Development
  virt-manager
  lazygit
  nmap
  dnslookup
  jq
  # lazydocker
  podman-compose
  buildah
  hcloud
  ansible
  sshpass
  terraform
  python3Full# Lazyvim
  nodejs_24# Lazyvim
  rustup# Lazyvim
  unzip# Lazyvim
  luajitPackages.luarocks # Lazyvim
  # Kubernetes 
  # kubectl
  # minikube
  k3s
  ];

}
