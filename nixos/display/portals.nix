{inputs, pkgs, ...}:
let
  hyprlandPackages = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  xdg.portal = {
    enable = true;

    config = {
      kde.default = [ "kde" "gtk" "gnome" ];
      kde."org.freedesktop.portal.FileChooser" = [ "kde" ];
      kde."org.freedesktop.portal.OpenURI" = [ "kde" ];

      hyprland.default = [ "hyprland" "gtk" "gnome" "termfilechooser" ];
      hyprland."org.freedesktop.portal.FileChooser" = [ "termfilechooser" ];
      hyprland."org.freedesktop.portal.OpenURI" = [ "termfilechooser" ];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-termfilechooser

      pkgs.kdePackages.xdg-desktop-portal-kde
      hyprlandPackages.xdg-desktop-portal-hyprland
    ];
  };
}
