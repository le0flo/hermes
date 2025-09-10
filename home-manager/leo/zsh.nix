{lib, config, ...}: {
  options = {
    zsh.enable = lib.mkEnableOption "Enable the ZShell configuration";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      syntaxHighlighting.enable = true;

      history.size = 10000;

      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
      };

      shellAliases = {
        ls = "ls -lh --color=auto";
        l = "ls";
        ll = "ls -a";
        ssh = "TERM=xterm-256color ssh";
        configure-nix = "zeditor ~/Desktop/hermes";
        update-system = "sudo nixos-rebuild switch --flake ~/Desktop/hermes";
        update-home = "home-manager switch --flake ~/Desktop/hermes";
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
  };
}
