{...}: {
  imports = [
    ./zsh.nix
    ./alacritty.nix
    ./hyprland.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";

    sessionVariables = {
      PSQL_USER = "test";
      PSQL_PASSWORD = "test";
    };
  };

  zsh.enable = true;
  alacritty.enable = true;
  hyprland.enable = false;

  # Version
  home.stateVersion = "25.05";
}
