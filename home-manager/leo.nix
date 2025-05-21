{ pkgs,...}: {
  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
    packages = [
      pkgs.librewolf
      pkgs.keepassxc
      pkgs.zed-editor
      pkgs.veracrypt
      pkgs.qbittorrent

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

      # Utilities
      pkgs.fastfetch
      pkgs.rsync
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

  # Syncthing
  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices = {
        "nettuno" = {
          id = "HMT23O5-2XFW3ZJ-LJSUSYF-4H3YA4V-Y2SFTTB-OVVUJKQ-NN72WJM-UXGRZAB";
        };

        "desktop" = {
          id = "ZHIS4NJ-VETYFQF-MSYRX5T-OG7RYDJ-UKIDPRH-FZMJSQY-QFOMUGF-MT4XTAZ";
        };

        "colosso" = {
          id = "Y5WZKVK-HZZXXNY-LMC7JO2-6OEXP4Z-MKFIKFR-2RUDXWP-52CSDEH-XBGPUAB";
        };
      };

      folders = {
        "~/Sync" = {
          id = "private-sync";
          label = "Sync";
          devices = [ "nettuno" "desktop" "colosso" ];
        };
      };
    };
  };

  home.stateVersion = "24.11";
}
