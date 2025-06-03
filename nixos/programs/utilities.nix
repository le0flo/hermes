{pkgs, lib, config, ...}: {
  options = {
    utilities.enable = lib.mkEnableOption "Enable various utilities";
  };

  config = lib.mkIf config.utilities.enable {
    environment.systemPackages = with pkgs; [
      alacritty
      fastfetch
      curl
      file
      exfat
      gimp3
      networkmanagerapplet
      vlc

      # Wine
      wine64

      # Web
      librewolf
      qbittorrent

      # Privacy
      veracrypt
      keepassxc
    ];

    programs = {
      neovim.enable = true;
      htop.enable = true;
      zsh.enable = true;

      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
