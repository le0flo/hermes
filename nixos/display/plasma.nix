{ pkgs, lib, config, ... }: {
  options = {
    plasma.enable = lib.mkEnableOption "Enables the KDE Plasma 6 desktop environment";
  };

  config = lib.mkIf config.plasma.enable {
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

    # Packages
    environment.systemPackages = with pkgs.kdePackages; [
      kate
      filelight
      discover
    ];
  };
}
