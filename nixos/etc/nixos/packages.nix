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
  ];
}
