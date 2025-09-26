{pkgs, lib, config, ...}: {
  options = {
    utils.enable = lib.mkEnableOption "various utilities";
  };

  config = lib.mkIf config.utils.enable {
    environment.systemPackages = with pkgs; [
      # Browser
      firefox

      # Mail
      thunderbird

      # Privacy
      keepassxc
      veracrypt

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
      gnumake
      tcpdump
      pandoc
      pciutils
      fastfetch
      vulkan-tools
      wireguard-tools
    ];

    # Zsh
    programs.zsh.enable = true;

    # GnuPG
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
