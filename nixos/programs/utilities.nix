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

    # Neovim
    programs.neovim.enable = true;

    # Htop
    programs.htop.enable = true;

    # ZShell
    programs.zsh.enable = true;

    # GPG
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
