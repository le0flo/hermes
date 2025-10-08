{lib, config, ...}: {
  options.windowmaker.enable = lib.mkEnableOption "windowmaker";

  config = lib.mkIf config.hyprland.enable {
    services.xserver.windowManager.windowmaker.enable = true;
  };
}
