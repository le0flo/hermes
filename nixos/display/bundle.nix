{...}: {
  imports = [
    ./portals.nix
    ./manager.nix
    ./plasma.nix
    ./cosmic.nix
    ./hyprland.nix
  ];

  # X11
  services.xserver = {
    enable = false;
    xkb = {
        layout = "it";
        variant = "";
    };
  };

  # Desktop enviroments
  plasma.enable = true;
  cosmic.enable = true;
  hyprland.enable = false; # xdg-desktop-portal-hyprland conflicts with other xdg-desktop-portal implementations
}
