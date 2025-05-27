{ pkgs, lib, config, ... }: {
  options = {
    obs.enable = lib.mkEnableOption "Enables the OBS and OBS Virtual Camera";
  };

  config = lib.mkIf config.obs.enable {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;

      plugins = [
        pkgs.obs-studio-plugins.droidcam-obs
      ];
    };
  };
}
