{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];

    initrd.verbose = false;

    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    loader.timeout = 3;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking.hostName = "hermes";
  networking.networkmanager.enable = true;

  # Locales
  time.timeZone = "Europe/Rome";
  console.keyMap = "it2";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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

  # Desktop
  services.xserver.enable = false;
  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = [
    pkgs.xterm
    pkgs.kdePackages.okular
    pkgs.kdePackages.elisa
    pkgs.kdePackages.xwaylandvideobridge
  ];

  # Audio
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Services
  services.printing.enable = true;
  services.libinput.enable = true;
  services.flatpak.enable = true;
  services.power-profiles-daemon.enable = true;

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;

  # Packages and Users
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.users.leo = {
    isNormalUser = true;
    description = "leo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      keepassxc
      firefox
      zed-editor
    ];
  };

  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.discover
    networkmanagerapplet
    vlc
    wget
    curl
    zsh
    neovim
    fastfetch

    rustup
    git
  ];

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  programs.java.enable = true;

  system.stateVersion = "24.11";
}
