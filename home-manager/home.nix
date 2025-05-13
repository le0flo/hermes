{ inputs, lib, config, pkgs,...}: {
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
    ];
  };

  programs.home-manager.enable = true;

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;
  };

  # Development
  programs.git.enable = true;
  programs.java.enable = true;

  home.stateVersion = "24.11";
}
