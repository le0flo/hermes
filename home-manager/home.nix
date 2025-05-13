{ inputs, lib, config, pkgs,...}:
{
  imports = [];

  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
    packages = [
      pkgs.firefox
      pkgs.keepassxc
      pkgs.zed-editor
    ];
  };

  # Agents
  programs.home-manager.enable = true;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # Shell
  # TODO

  # Steam
  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.steam.gamescopeSession = true;
  hardware.steam-hardware.enable = true;

  # Development
  programs.git.enable = true;
  programs.java.enable = true;

  home.stateVersion = "24.11";
}
