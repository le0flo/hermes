{...}: {
  imports = [
    ./hyprland/bundle.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";

    sessionVariables = {
      PATH = "$PATH:$HOME/.local/bin";
    };
  };

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
      update-home = "home-manager switch --flake ~/git/hermes";
      npmg = "npm -g --prefix \"$HOME/.local\"";
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

  # Version
  home.stateVersion = "25.05";
}
