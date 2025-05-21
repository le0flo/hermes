{ pkgs,...}: {
  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
    packages = [
      # Web
      pkgs.librewolf
      pkgs.qbittorrent

      # Utilities
      pkgs.fastfetch
      pkgs.zed-editor
      pkgs.keepassxc
      pkgs.veracrypt

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

  # Git
  programs.git.enable = true;

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      theme = "eastwood";
    };

    shellAliases = {
      ll = "ls -al";
      ff = "fastfetch";
      vim = "nvim";
      update-system = "sudo nixos-rebuild switch --flake ~/git/hermes";
    };

    initContent = ''
        # Ctrl + arrow keys
        bindkey '^[Oc' forward-word
        bindkey '^[Od' backward-word
        bindkey '^[[1;5D' backward-word
        bindkey '^[[1;5C' forward-word
        bindkey '^H' backward-kill-word

        # Theme
        autoload -U colors
        colors
    '';
  };

  home.stateVersion = "24.11";
}
