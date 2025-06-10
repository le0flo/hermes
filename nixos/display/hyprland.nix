{inputs, pkgs, lib, config, ...}:
let
  hyprlandPackages = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  options = {
    hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };

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
        default = [ "hyprland" "termfilechooser" "gtk" "gnome" ];
        "org.freedesktop.portal.FileChooser" = [ "termfilechooser" ];
        "org.freedesktop.portal.OpenURI" = [ "termfilechooser" ];
      };

      extraPortals = with hyprlandPackages; [
        xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-termfilechooser
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
    };

    # Packages
    environment.systemPackages = with pkgs; [
      tofi
      lf
      swww
      ncpamixer
    ];
  };
}
