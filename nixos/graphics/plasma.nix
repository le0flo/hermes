{pkgs, lib, config, ...}: {
  options = {
    plasma.enable = lib.mkEnableOption "plasma";
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
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
    };

    # Packages
    environment.systemPackages = with pkgs.kdePackages; [
      kate
      filelight
      discover

      sddm-kcm
      flatpak-kcm
    ];
  };
}
