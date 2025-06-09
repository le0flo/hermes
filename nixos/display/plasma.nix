{pkgs, lib, config, ...}: {
  options = {
    plasma.enable = lib.mkEnableOption "Enable Plasma 6";
  };

  config = lib.mkIf config.plasma.enable {
    services.desktopManager.plasma6.enable = true;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      xwaylandvideobridge
      plasma-browser-integration
      konsole
      elisa
    ];

    # Portals
    xdg.portal = {
      config.kde = {
        default = [ "kde" "gtk" "gnome" ];
        "org.freedesktop.portal.FileChooser" = [ "kde" ];
        "org.freedesktop.portal.OpenURI" = [ "kde" ];
      };

      extraPortals = with pkgs.kdePackages; [
        xdg-desktop-portal-kde
      ];
    };

    # Packages
    environment.systemPackages = with pkgs.kdePackages; [
      kate
      filelight
      discover
    ];
  };
}
