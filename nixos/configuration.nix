{inputs, config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./gui.nix
    ./services.nix
    ./programs.nix

    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-l14-intel
    inputs.home-manager.nixosModules.home-manager
  ];

  # Boot
  boot = {
    consoleLogLevel = 3;

    kernelParams = [
      "quiet"
      "splash"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];

    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];

    extraModprobeConfig = "options v4l2loopback devices=1 video_nr=1 card_label=\"OBS Cam\" exclusive_caps=1";

    loader = {
      timeout = 3;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

  # Locales
  time.timeZone = "Europe/Rome";
  console.keyMap = "it";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "it_IT.UTF-8";
      LC_IDENTIFICATION = "it_IT.UTF-8";
      LC_MEASUREMENT = "it_IT.UTF-8";
      LC_MONETARY = "it_IT.UTF-8";
      LC_NAME = "it_IT.UTF-8";
      LC_NUMERIC = "it_IT.UTF-8";
      LC_PAPER = "it_IT.UTF-8";
      LC_TELEPHONE = "it_IT.UTF-8";
      LC_TIME = "it_IT.UTF-8";
    };
  };

  # Users
  users.users.leo = {
    isNormalUser = true;
    description = "Leonardo";
    shell = pkgs.zsh;

    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Version
  system.stateVersion = "25.05";
}
