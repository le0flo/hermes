{inputs, pkgs, ...}: {
  imports = [
    ./programs/games.nix
    ./programs/obs.nix
  ];

  # NixOS
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Packages
  environment.systemPackages = with pkgs; [
    firefox thunderbird keepassxc
    vlc aonsoku ffmpeg yt-dlp
    veracrypt exfat
    zed-editor nil nixd
    vim htop file
    openssh rsync wireguard-tools

    # Home manager
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager
  ];

  # Dynamic linking
  programs.nix-ld.enable = true;

  # Zsh
  programs.zsh.enable = true;

  # Git
  programs.git = {
    enable = true;

    config = {
      init = {
        defaultBranch = "master";
      };
      core = {
        editor = "vim";
      };
    };
  };

  # Docker
  virtualisation.docker.enable = true;

  # Virtualbox
  virtualisation.virtualbox.host.enable = true;

  # Custom
  games.enable = true;
  obs.enable = true;
}
