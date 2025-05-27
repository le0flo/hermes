{ pkgs, lib, config, ... }: {
  options = {
    utilities.enable = lib.mkEnableOption "Enables base system utilities";
  };

  config = lib.mkIf config.utilities.enable {
    environment.systemPackages = with pkgs; [
      fastfetch
      curl
      exfat
      networkmanagerapplet
      vlc

      # Wine
      wine
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
