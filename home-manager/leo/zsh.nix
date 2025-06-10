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
        theme = "eastwood";
      };

      shellAliases = {
        ll = "ls -al";
        ff = "fastfetch";
        ssh = "TERM=xterm-256color ssh";
        configure-nix = "zeditor ~/git/le0flo/hermes";
        update-system = "sudo nixos-rebuild switch --flake ~/git/le0flo/hermes";
        update-home = "home-manager switch --flake ~/git/le0flo/hermes";
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
