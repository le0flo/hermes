{pkgs, lib, config, ...}: {
  options = {
    gnome.enable = lib.mkEnableOption "Enable Gnome";
  };

  config = lib.mkIf config.gnome.enable {
    services.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = with pkgs; [
      gnome-connections
      gnome-console
      gnome-contacts
      gnome-disk-utility
      gnome-music
      gnome-tour

      epiphany
      geary
      totem
      evince
      decibels
      seahorse
      simple-scan
    ];

    # Portals
    xdg.portal = {
      config.gnome = {
        default = [ "gnome" "gtk" ];
        "org.freedesktop.portal.FileChooser" = [ "gnome" ];
        "org.freedesktop.portal.OpenURI" = [ "gnome" ];
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
    };

    # Packages
    environment.systemPackages = with pkgs; [
      gnome-tweaks
    ];
  };
}
