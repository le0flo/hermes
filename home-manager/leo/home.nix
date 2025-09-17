{...}: {
  imports = [
    ./zsh.nix
    ./zed.nix
    ./syncthing.nix
    ./alacritty.nix
    ./hyprland.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
  };

  # Custom
  zsh.enable = true;
  zed.enable = true;
  syncthing.enable = true;
  alacritty.enable = false;
  hyprland.enable = false;

  # Version
  home.stateVersion = "25.05";
}
