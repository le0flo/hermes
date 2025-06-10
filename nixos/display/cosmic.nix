{pkgs, lib, config, ...}: {
  options = {
    cosmic.enable = lib.mkEnableOption "Enable Cosmic";
  };

  config = lib.mkIf config.cosmic.enable {
    services.desktopManager.cosmic.enable = true;

    # Portals
    xdg.portal = {
      config.cosmic = {
        default = [ "cosmic" "gtk" "gnome" ];
        "org.freedesktop.portal.FileChooser" = [ "cosmic" ];
        "org.freedesktop.portal.OpenURI" = [ "cosmic" ];
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-cosmic
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };
  };
}
