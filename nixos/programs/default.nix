{inputs, pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./cybersec.nix
    ./games.nix
    ./obs.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [
    firefox thunderbird keepassxc
    vlc ffmpeg yt-dlp
    zed-editor alacritty
    gnumake texliveFull nil nixd
    openssh rsync wireguard-tools
    veracrypt exfat
    tmux vim file
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

  # Virt manager
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  users.groups."libvirtd".members = [ "leo" ];
  programs.virt-manager.enable = true;

  # Custom
  fonts.enable = true;
  cybersec.enable = true;
  games.enable = true;
  obs.enable = true;
}
