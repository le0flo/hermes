{ pkgs, ... }: {
  # Plasma
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = [
    pkgs.xterm
    pkgs.kdePackages.elisa
    pkgs.kdePackages.xwaylandvideobridge
    pkgs.kdePackages.plasma-browser-integration
  ];

  # Portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];
}
