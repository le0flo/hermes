{ inputs, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-l14-intel
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    consoleLogLevel = 3;

    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];

    supportedFilesystems = [ "ntfs" ];

    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];

    extraModprobeConfig = "options v4l2loopback devices=1 video_nr=1 card_label=\"OBS Cam\" exclusive_caps=1";

    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    loader = {
      timeout = 3;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Networking
  networking = {
    hostName = "hermes";
    networkmanager.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

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

  # Security
  security.rtkit.enable = true;
  security.polkit.enable = true;

  # X11
  services.xserver = {
    enable = false;
    xkb = {
      layout = "it";
      variant = "";
    };
  };

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
  };

  # KDE Plasma
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = [
    pkgs.xterm
    pkgs.kdePackages.elisa
    pkgs.kdePackages.xwaylandvideobridge
    pkgs.kdePackages.plasma-browser-integration
  ];

  # Portals
  xdg.portal.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Services
  services.printing.enable = true;
  services.libinput.enable = true;
  services.flatpak.enable = true;
  services.power-profiles-daemon.enable = true;

  # SSH
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      UsePAM = false;
      PrintMotd = false;
    };
  };

  # I2P
  services.i2pd = {
    enable = true;
    address = "127.0.0.1";
    port = 4444;

    proto = {
      http.enable = true;
      httpProxy.enable = true;
      socksProxy.enable = true;

      sam = {
        enable = true;
        address = "127.0.0.1";
        port = 7655;
      };

      i2cp = {
        enable = true;
        address = "127.0.0.1";
        port = 7654;
      };
    };
  };

  # Mullvad VPN
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  # Virtualization
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  # Packages
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # KDE
    kdePackages.kate
    kdePackages.discover
    kdePackages.filelight
    networkmanagerapplet
    vlc

    # Utilities
    wget
    curl
    neovim
    exfat
  ];

  # Shell
  programs.zsh.enable = true;

  # GPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Steam
  hardware.steam-hardware.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  # Virt Manager
  programs.virt-manager.enable = true;

  # OBS
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    plugins = [
      pkgs.obs-studio-plugins.droidcam-obs
    ];
  };

  # Users
  users.users.leo = {
    isNormalUser = true;
    description = "Leonardo";
    shell = pkgs.zsh;

    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "docker"
      "dialout"
      "tty"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      leo = import ../home-manager/leo.nix;
    };
  };

  system.stateVersion = "24.11";
}
