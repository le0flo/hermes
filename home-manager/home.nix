{ pkgs,...}: {
  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
    packages = [
      pkgs.firefox
      pkgs.keepassxc
      pkgs.zed-editor

      # Games
      pkgs.prismlauncher
      pkgs.heroic

      # Languages
      pkgs.gcc
      pkgs.temurin-bin
      pkgs.python314
      pkgs.rustup
      pkgs.nodePackages.nodejs
      pkgs.texliveBasic
      pkgs.nil
      pkgs.nixd
    ];
  };

  programs.home-manager.enable = true;

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      update-system = "sudo nixos-rebuild switch --flake ~/git/hermes";
    };

    history.size = 10000;
  };

  # Git
  programs.git.enable = true;

  home.stateVersion = "24.11";
}
