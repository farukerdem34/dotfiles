{ config, pkgs, ... }:

{
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
  easyeffects
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
# Hyprland
  hyprpaper
  hyprlock
  hypridle
  hyprshot
  hyprpicker
  xdg-desktop-portal-hyprland
  waybar
  wofi
  wlogout
  pkgs.nerd-fonts.jetbrains-mono
  networkmanagerapplet
  blueman
  nwg-look
  wl-clipboard
  cliphist
  udiskie
  sassc # Front-end for libsass. for gtk theme installation
  pavucontrol
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
  kubectl
  python3Full# Lazyvim
  nodejs_24# Lazyvim
  rustup# Lazyvim
  unzip# Lazyvim
  luajitPackages.luarocks # Lazyvim
  ];

}
