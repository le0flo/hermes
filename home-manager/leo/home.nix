{...}: {
  imports = [
    ./zsh.nix
    ./alacritty.nix
    ./helix.nix
    ./zed.nix
    ./hyprland.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";

    sessionVariables = {
      SIMPLEACCOUNTS_PSQL_USER = "test";
      SIMPLEACCOUNTS_PSQL_PASSWORD = "test";
    };
  };

  zsh.enable = true;
  alacritty.enable = true;
  helix.enable = true;
  zed.enable = true;
  hyprland.enable = false;

  # Version
  home.stateVersion = "25.05";
}
