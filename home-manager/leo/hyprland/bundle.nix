{...}: {
  imports = [
    ./hyprland.nix
    ./swww.nix
    ./alacritty.nix
  ];

  hyprland.enable = true;
  swww.enable = true;
  alacritty.enable = true;
}
