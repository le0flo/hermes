{...}: {
  imports = [
    ./audio.nix
    ./ssh.nix
    ./i2pd.nix
    ./mullvad.nix
  ];

  # Security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Base
  services = {
    dbus.enable = true;
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    flatpak.enable = true;
    printing.enable = true;
  };

  # Custom
  audio.enable = true;
  ssh.enable = true;
  i2pd.enable = true;
  mullvad.enable = true;
}
