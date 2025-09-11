{pkgs, lib, config, ...}: {
  options = {
    vpn.enable = lib.mkEnableOption "vpn clients";
  };

  config = lib.mkIf config.vpn.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
