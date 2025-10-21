{inputs, pkgs, ...}: {
  imports = [
    ./cybersec.nix
    ./games.nix
    ./obs.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [
    firefox thunderbird keepassxc
    zed-editor alacritty tmux nil nixd
    openssh rsync wireguard-tools
    vlc ffmpeg yt-dlp
    veracrypt exfat
    vim file
    fastfetch btop

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
  users.extraGroups."docker".members = [ "leo" ];

  # Custom
  cybersec.enable = true;
  games.enable = true;
  obs.enable = true;
}
