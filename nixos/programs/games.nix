{pkgs, lib, config, ...}: {
  options = {
    games.enable = lib.mkEnableOption "Enable steam and other game launchers";
  };

  config = lib.mkIf config.games.enable {
    hardware.steam-hardware.enable = true;

    programs = {
      gamescope.enable = true;
      gamemode.enable = true;

      steam = {
        enable = true;
        gamescopeSession.enable = false; # SteamOS interface
      };
    };

    environment.systemPackages = with pkgs; [
      prismlauncher

      # Wine
      wineWow64Packages.waylandFull
    ];
  };
}
