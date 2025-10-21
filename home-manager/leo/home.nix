{...}: {
  imports = [
    ./gui/niri.nix

    ./programs/zsh.nix
    ./programs/zed.nix
    ./programs/syncthing.nix
    ./programs/alacritty.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
  };

  # Custom guis
  niri.enable = true;

  # Custom programs
  zsh.enable = true;
  zed.enable = true;
  syncthing.enable = true;
  alacritty.enable = true;

  # Version
  home.stateVersion = "25.05";
}
