{ pkgs, ... }: {
  # NixOS
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System packages
  environment.systemPackages = with pkgs; [
    # KDE
    kdePackages.kate
    kdePackages.discover
    kdePackages.filelight
    networkmanagerapplet
    vlc

    # Utilities
    fastfetch
    keepassxc
    veracrypt
    htop
    wget
    curl
    exfat
    git

    # Wine
    wine
    wine64

    # Editors
    zed-editor
    neovim

    # Web
    librewolf
    qbittorrent

    # Games
    prismlauncher
    heroic

    # Languages
    gcc
    temurin-bin
    python314
    rustup
    nodePackages.nodejs
    texliveBasic
    nil
    nixd
    hugo
  ];

  # Dynamic linking
  programs.nix-ld.enable = true;

  # Shell
  programs.zsh.enable = true;

  # GPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Steam
  hardware.steam-hardware.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  # Virt Manager
  programs.virt-manager.enable = true;

  # OBS
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    plugins = [
      pkgs.obs-studio-plugins.droidcam-obs
    ];
  };
}
