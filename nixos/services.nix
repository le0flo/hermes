{ pkgs, ... }: {
  services.printing.enable = true;
  services.libinput.enable = true;
  services.flatpak.enable = true;
  services.power-profiles-daemon.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
      sam.enable = true;
      i2cp.enable = true;
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
}
