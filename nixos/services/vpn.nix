{pkgs, lib, config, ...}: {
  options = {
    vpn.enable = lib.mkEnableOption "vpn clients";
  };

  config = lib.mkIf config.vpn.enable {
    networking.wireguard.interfaces."wg0" = {
      ips = [ "192.168.1.240/24" ];
      listenPort = 51820;

      privateKeyFile = "/home/leo/.wireguard/private";

      peers = [
        {
          publicKey = "GX/1ks+T1OcBsW7XiMIN1k2/azaCWH69eGh9dltfJhU=";

          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "192.168.1.250:51820";

          persistentKeepalive = 25;
        }
      ];
    };

    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
