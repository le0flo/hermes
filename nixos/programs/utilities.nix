{pkgs, lib, config, ...}: {
  options = {
    utilities.enable = lib.mkEnableOption "Enable various utilities";
  };

  config = lib.mkIf config.utilities.enable {
    environment.systemPackages = with pkgs; [
      # Terminal
      alacritty
      wl-clipboard
      helix
      fastfetch
      htop

      # Web
      librewolf
      qbittorrent
      curl

      # Privacy
      veracrypt
      keepassxc
      kdePackages.kleopatra

      # Media
      vlc

      # Files
      file
      exfat
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
