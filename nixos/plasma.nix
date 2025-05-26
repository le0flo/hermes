{ pkgs, ... }: {
  # X11
  services.xserver = {
    enable = false;
    xkb = {
      layout = "it";
      variant = "";
    };
  };

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
  };

  # KDE Plasma
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = [
    pkgs.xterm
    pkgs.kdePackages.elisa
    pkgs.kdePackages.xwaylandvideobridge
    pkgs.kdePackages.plasma-browser-integration
  ];

  # Portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];

  # Audio
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
