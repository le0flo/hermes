{pkgs, lib, config, ...}: {
  options = {
    obs.enable = lib.mkEnableOption "Enable obs and virtual camera";
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
