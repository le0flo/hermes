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
  };

  zsh.enable = true;
  alacritty.enable = false;
  helix.enable = false;
  zed.enable = true;
  hyprland.enable = false;

  # Version
  home.stateVersion = "25.05";
}
