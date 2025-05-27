{pkgs, lib, config, ...}: {
  options = {
    plasma.enable = lib.mkEnableOption "Enables Plasma 6";
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
    ];
  };
}
