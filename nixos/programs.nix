{inputs, pkgs, ...}: {
  imports = [
    ./programs/development.nix
    ./programs/virtualization.nix
    ./programs/games.nix
    ./programs/obs.nix
  ];

  # NixOS
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Packages
  environment.systemPackages = with pkgs; [
    # Home manager
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager

    # Browser
    firefox

    # Mail client
    thunderbird

    # Password manager
    keepassxc

    # Media
    vlc
    aonsoku

    # Other
    vim
    wireguard-tools
    htop
    ffmpeg
    yt-dlp
    veracrypt
    file
    exfat
    pciutils
  ];

  # Dynamic linking
  programs.nix-ld.enable = true;

  # Zsh
  programs.zsh.enable = true;

  # Custom
  development.enable = true;
  virtualization.enable = true;
  games.enable = true;
  obs.enable = true;
}
