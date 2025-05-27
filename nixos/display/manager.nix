{ ... }: {
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

  import = [
    ./plasma.nix
    ./hyprland.nix
  ];
}
