{pkgs, lib, config, ...}: {
  options = {
    games.enable = lib.mkEnableOption "Enables Steam and other game launchers";
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
