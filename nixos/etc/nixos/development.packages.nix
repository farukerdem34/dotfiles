{ config, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
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
    python3Full # Lazyvim
    nodejs_24 # Lazyvim
    rustup # Lazyvim
    unzip # Lazyvim
    luajitPackages.luarocks # Lazyvim
  ];
}
