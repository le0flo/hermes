{pkgs, ...}: {
  imports = [
    ./gui/gnome.nix
    ./gui/plasma.nix
    ./gui/cosmic.nix
    ./gui/niri.nix
  ];

  # Drivers
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  # Ly
  services.displayManager.ly = {
    enable = true;
    x11Support = false;

    settings = {
      session_log = ".ly-session.log";
    };
  };

  # X11
  services.xserver = {
    enable = false;
    xkb = {
        layout = "it";
        variant = "";
    };
  };

  # Portals
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  # Desktop enviroments
  gnome.enable = true;
  plasma.enable = false;
  cosmic.enable = false;
  niri.enable = true;
}
