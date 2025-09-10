{lib, config, ...}: {
  options = {
    virtual-machines.enable = lib.mkEnableOption "Enable virt manager, the qemu backend and docker";
  };

  config = lib.mkIf config.virtual-machines.enable {
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
