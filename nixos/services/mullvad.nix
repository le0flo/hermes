{pkgs, lib, config, ...}: {
  options = {
    mullvad.enable = lib.mkEnableOption "Enable the mullvad vpn client";
  };

  config = lib.mkIf config.mullvad.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
