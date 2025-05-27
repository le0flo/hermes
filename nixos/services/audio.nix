{ lib, config, ... }: {
  options = {
    audio.enable = lib.mkEnableOption "Enables the audio backend";
  };

  config = lib.mkIf config.audio.enable {
    services.pulseaudio.enable = false;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
