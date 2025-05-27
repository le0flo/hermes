{...}: {
  imports = [
    ./portals.nix
    ./manager.nix
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

  # Desktop enviroments
  plasma.enable = true;
  hyprland.enable = true;
}
