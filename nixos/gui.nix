{pkgs, ...}: {
  imports = [
    ./gui/gnome.nix
    ./gui/plasma.nix
    ./gui/cosmic.nix
    ./gui/hyprland.nix
  ];

  # Drivers
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  # Ly
  services.displayManager.ly = {
    enable = true;
    x11Support = false;
  };

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
  gnome.enable = true;
  plasma.enable = false;
  cosmic.enable = false;
  hyprland.enable = false; # xdg-desktop-portal-hyprland conflicts with other xdg-desktop-portal implementations
}
