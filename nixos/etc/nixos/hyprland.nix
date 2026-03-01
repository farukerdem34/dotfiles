
{ config, pkgs, ... }:

{
  # Hyprland
  programs.hyprland.enable = true;
 environment.systemPackages = with pkgs; [
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
  brightnessctl
  ];

}
