{pkgs, lib, config, ...}: {
  options = {
    utils.enable = lib.mkEnableOption "various utilities";
  };

  config = lib.mkIf config.utils.enable {
    environment.systemPackages = with pkgs; [
      # Terminal
      vim
      htop

      # Privacy
      veracrypt
      keepassxc

      # Media
      vlc

      # Other
      file
      exfat
      tcpdump
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
