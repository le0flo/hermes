{...}: {
  imports = [
    ./manager.nix
    ./plasma.nix
    ./gnome.nix
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

  # Portals
  xdg.portal.enable = true;

  # Desktop enviroments
  plasma.enable = true;
  gnome.enable = false;
  cosmic.enable = false;
  hyprland.enable = false; # xdg-desktop-portal-hyprland conflicts with other xdg-desktop-portal implementations
}
