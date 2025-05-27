{ inputs, pkgs, lib, config, ... }: {
  options = {
    hyprland.enable = lib.mkEnableOption "Enables the Hyprland window manager";
  };

  config = lib.mkIf config.hyprland.enable {
    # Hyprland
    programs.hyprland = {
      enable = true;
      withUWSM = true;

      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    # Hyprlock
    programs.hyprlock = {
      enable = true;
      package = inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock;
    };

    # Portals
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    # Packages
    environment.systemPackages = with pkgs; [
      alacritty
      bemenu
    ];
  };
}
