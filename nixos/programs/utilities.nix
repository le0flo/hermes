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

    # Session variables
    environment.profileRelativeSessionVariables = {
      TERMINAL = [ "${pkgs.alacritty}/bin/alacritty" ];
    };

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
