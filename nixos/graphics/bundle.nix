{pkgs, ...}: {
  imports = [
    ./display-manager.nix
    ./gnome.nix
    ./plasma.nix
    ./cosmic.nix
    ./hyprland.nix
  ];
  
  # Drivers
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
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
