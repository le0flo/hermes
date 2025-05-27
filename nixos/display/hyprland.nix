{inputs, pkgs, lib, config, ...}:
let
  hyprlandPackages = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  options = {
    hyprland.enable = lib.mkEnableOption "Enables Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    # Hyprland
    programs.hyprland = {
      enable = true;
      withUWSM = true;

      package = hyprlandPackages.hyprland;
      portalPackage = hyprlandPackages.xdg-desktop-portal-hyprland;
    };

    # Hyprlock
    programs.hyprlock.enable = true;

    # Packages
    environment.systemPackages = with pkgs; [
      hypridle
      alacritty
      bemenu
      lf
    ];
  };
}
