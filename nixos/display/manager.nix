{ pkgs, ... }: {
  imports = [
    ./plasma.nix
    ./hyprland.nix
  ];

  # X11
  services.xserver = {
    enable = false;
    xkb = {
        layout = "it";
        variant = "";
    };
  };

  # UWSM
  programs.uwsm.enable = true;

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
  };

  # Portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];
}
