{lib, config, pkgs, ...}: {
  options.niri.enable = lib.mkEnableOption "niri wm";

  config = lib.mkIf config.niri.enable {
    programs = {
      niri.enable = true;
      waybar.enable = true;
    };

    # Portals
    xdg.portal = {
      config."niri" = {
        default = "gnome";
        "org.freedesktop.portal.FileChooser" = "gnome";
        "org.freedesktop.portal.OpenURI" = "gnome";
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-termfilechooser
      ];
    };

    # Packages
    environment.systemPackages = with pkgs; [
      xwayland-satellite
      fuzzel lf
    ];
  };
}
