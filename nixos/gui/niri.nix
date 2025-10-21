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
        default = [ "gnome" "gtk" ];
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
      ];
    };

    # Packages
    environment.systemPackages = with pkgs; [
      xwayland-satellite
      fuzzel
    ];
  };
}
