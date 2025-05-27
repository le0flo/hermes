{inputs, pkgs, ...}:
let
  hyprlandPackages = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprlandPackages.hyprland;

    systemd.enable = true;
    systemd.variables = [ "--all" ];

    settings = {
      "$terminal" = "alacritty";
      "$menu" = "bemenu-run -c -l 10 -W .5";
    };
  };
}
