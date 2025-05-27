{config, lib, modulesPath, ...}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "sdhci_pci" ];
    initrd.kernelModules = [ ];

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  # Disks
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/862aabe1-b30f-485c-95e8-839029cae680";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/081B-26E3";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/19708579-59e1-4314-863b-ab7ca9034ab1"; }
  ];

  # Networking
  networking.useDHCP = lib.mkDefault true;

  # Hardware
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
