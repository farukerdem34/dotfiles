# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings = {
    max-jobs = "auto";     # Çekirdek sayısına göre otomatik
    cores = 0;             # Tüm CPU çekirdeklerini kullan
  };
  # boot.extraModulePackages = [ "hotfix_kvadra_touchpad" ];
  # Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "lomaroid"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };
  # Flatpak
  services.flatpak.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Hyprland
  programs.hyprland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "tr";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "trq";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.faruk = {
    isNormalUser = true;
    description = "faruk";
    extraGroups = [ 
      "networkmanager"
      "wheel" 
      "libvirtd"
      # "docker"
    ];
    packages = with pkgs; [
    ];
  };

  # Development - libvirtd
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  # virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;


  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
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
# Corprete Hell 
  teams-for-linux
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
  # lazydocker
  podman-compose
  buildah
  hcloud
  ansible
  terraform
  kubectl
  python3Full# Lazyvim
  nodejs_24# Lazyvim
  rustup# Lazyvim
  unzip# Lazyvim
  ];
  programs.vim.enable = true;
  programs.vim.defaultEditor = true;
  programs.neovim.vimAlias = true;
  #programs.neovim.defaultEditor = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
