{ pkgs, lib, config, ... }: {
  options = {
    games.enable = lib.mkEnableOption "Enables the Steam client and Session, PrismLauncher and Heroic Games Launcher";
  };

  config = lib.mkIf config.games.enable {
    hardware.steam-hardware.enable = true;
    programs.gamescope.enable = true;
    programs.gamemode.enable = true;
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    environment.systemPackages = with pkgs; [
      heroic
      prismlauncher
    ];
  };
}
