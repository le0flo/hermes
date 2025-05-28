{lib, config, ...}: {
  options = {
    virtual-machines.enable = lib.mkEnableOption "Enable Virt manager, the QEMU backend and Docker";
  };

  config = lib.mkIf config.virtual-machines.enable {
    virtualisation = {
      docker.enable = true;
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    programs.virt-manager.enable = true;
  };
}
