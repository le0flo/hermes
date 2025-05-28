{lib, config, ...}: {
  options = {
    swww.enable = lib.mkEnableOption "Enables my Swww configuration";
  };

  config = lib.mkIf config.swww.enable {
    services.swww.enable = true;
  };
}
