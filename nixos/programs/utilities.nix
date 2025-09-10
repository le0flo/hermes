{pkgs, lib, config, ...}: {
  options = {
    utilities.enable = lib.mkEnableOption "Enable various utilities";
  };

  config = lib.mkIf config.utilities.enable {
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
