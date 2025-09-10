{lib, config, ...}: {
  options = {
    audio.enable = lib.mkEnableOption "audio backend";
  };

  config = lib.mkIf config.audio.enable {
    services = {
      pulseaudio.enable = false;

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };
  };
}
