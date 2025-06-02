{inputs, pkgs, lib, config, ...}:
let
  hyprlandPackages = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  options = {
    hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    # UWSM
    programs.uwsm.enable = true;

    # Hyprland
    programs.hyprland = {
      enable = true;
      withUWSM = true;

      package = hyprlandPackages.hyprland;
      portalPackage = hyprlandPackages.xdg-desktop-portal-hyprland;
    };

    # Portals
    xdg.portal = {
      config = {
        hyprland = {
          default = [ "hyprland" "termfilechooser" "gtk" "gnome" ];
          "org.freedesktop.portal.FileChooser" = [ "termfilechooser" ];
          "org.freedesktop.portal.OpenURI" = [ "termfilechooser" ];
        };
      };

      extraPortals = with pkgs; [
        hyprlandPackages.xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser
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
