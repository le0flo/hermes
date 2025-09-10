{...}: {
  imports = [
    ./zsh.nix
    ./zed.nix
    ./alacritty.nix
    ./helix.nix
    ./hyprland.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
  };

  # Custom
  zsh.enable = true;
  alacritty.enable = false;
  helix.enable = false;
  zed.enable = true;
  hyprland.enable = false;

  # Version
  home.stateVersion = "25.05";
}
