{...}: {
  imports = [
    ./zsh.nix
    ./alacritty.nix
    ./hyprland.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";

    sessionVariables = {
      PATH = "$PATH:$HOME/.local/bin";
    };
  };

  zsh.enable = true;
  alacritty.enable = true;
  hyprland.enable = true;

  # Version
  home.stateVersion = "25.05";
}
