{pkgs, lib, config, ...}: {
  options = {
    utilities.enable = lib.mkEnableOption "Enable various utilities";
  };

  config = lib.mkIf config.utilities.enable {
    environment.systemPackages = with pkgs; [
      fastfetch
      wl-clipboard
      exfat
      vlc
      curl
      file

      # Terminal
      alacritty

      # Web
      librewolf
      qbittorrent

      # Privacy
      veracrypt
      keepassxc
      kdePackages.kleopatra
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
