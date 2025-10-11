{inputs, pkgs, lib, config, ...}:
let
  hyprlandPackages = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  options.hyprland.enable = lib.mkEnableOption "hyprland wm";

  config = lib.mkIf config.hyprland.enable {
    programs = {
      uwsm.enable = true;

      hyprland = {
        enable = true;
        withUWSM = true;

        package = hyprlandPackages.hyprland;
        portalPackage = hyprlandPackages.xdg-desktop-portal-hyprland;
      };
    };

    # Portals
    xdg.portal = {
      config.hyprland = {
        default = [ "hyprland" "termfilechooser" "gtk" ];
        "org.freedesktop.portal.FileChooser" = [ "termfilechooser" ];
        "org.freedesktop.portal.OpenURI" = [ "termfilechooser" ];
      };

      extraPortals = with pkgs; [
        hyprlandPackages.xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser
        xdg-desktop-portal-gtk
      ];
    };

    # Packages
    environment.systemPackages = with pkgs; [
      rofi lf swww
    ];
  };
}
