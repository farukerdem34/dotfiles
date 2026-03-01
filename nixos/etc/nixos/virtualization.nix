{ config, pkgs, ... }:

{
  # Development - libvirtd
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker.enable = true;
  # virtualisation.podman.enable = true;
}
