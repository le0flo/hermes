{ inputs, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-l14-intel
    inputs.home-manager.nixosModules.home-manager
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

  # Networking
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
  services.displayManager.sddm.wayland.enable = true;

  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = [
    pkgs.xterm
    pkgs.kdePackages.elisa
    pkgs.kdePackages.xwaylandvideobridge
    pkgs.kdePackages.plasma-browser-integration
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

  # I2P
  services.i2pd = {
    enable = true;
    address = "127.0.0.1";
    proto = {
      http.enable = true;
      httpProxy.enable = true;
      socksProxy.enable = true;
    };
  };

  # SSH
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;

  # Virtualization
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Packages
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # KDE
    kdePackages.kate
    kdePackages.discover
    networkmanagerapplet
    vlc

    # Utilities
    wget
    curl
    neovim
    fastfetch
  ];

  # GPG
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # Steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  hardware.steam-hardware.enable = true;

  # Virt Manager
  programs.virt-manager.enable = true;

  # Users
  users.users.leo = {
    isNormalUser = true;
    description = "Leonardo";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "docker"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      leo = import ../home-manager/home.nix;
    };
  };

  system.stateVersion = "24.11";
}
