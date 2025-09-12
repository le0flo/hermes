{pkgs, lib, config, ...}: {
  options = {
    utils.enable = lib.mkEnableOption "various utilities";
  };

  config = lib.mkIf config.utils.enable {
    environment.systemPackages = with pkgs; [
      # Privacy
      veracrypt
      keepassxc

      # Media
      vlc
      aonsoku
      yt-dlp
      ffmpeg

      # Other
      vim
      htop
      file
      exfat
      tcpdump
      pciutils
      vulkan-tools
      wireguard-tools
    ];

    programs = {
      zsh.enable = true;

      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
