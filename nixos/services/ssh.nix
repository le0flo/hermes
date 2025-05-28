{lib, config, ...}: {
  options = {
    ssh.enable = lib.mkEnableOption "Enable SSH server and client";
  };

  config = lib.mkIf config.ssh.enable {
    services.openssh = {
      enable = true;

      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        UsePAM = false;
        PrintMotd = false;
      };
    };
  };
}
