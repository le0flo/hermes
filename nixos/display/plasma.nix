{ pkgs, lib, config, ... }: {
  options = {
    plasma.enable = lib.mkEnableOption "Enables the KDE Plasma 6 desktop environment";
  };

  config = lib.mkIf config.plasma.enable {
    # Plasma
    services.desktopManager.plasma6.enable = true;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      xwaylandvideobridge
      plasma-browser-integration
    ];

    # Packages
    environment.systemPackages = with pkgs.kdePackages; [
      kate
      filelight
      discover
      xdg-desktop-portal-kde
    ];
  };
}
