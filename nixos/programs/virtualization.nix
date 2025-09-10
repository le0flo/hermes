{lib, config, ...}: {
  options = {
    virtualization.enable = lib.mkEnableOption "virtualization software";
  };

  config = lib.mkIf config.virtualization.enable {
    virtualisation = {
      docker = {
        enable = false;
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
      };
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    programs.virt-manager.enable = true;
  };
}
