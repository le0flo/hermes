{ ... }: {
  imports = [
    ./audio.nix
    ./ssh.nix
    ./i2pd.nix
    ./mullvad.nix
  ];

  # Security
  security.rtkit.enable = true;
  security.polkit.enable = true;

  # Base
  services.printing.enable = true;
  services.libinput.enable = true;
  services.flatpak.enable = true;
  services.power-profiles-daemon.enable = true;

  # Custom
  audio.enable = true;
  ssh.enable = true;
  i2pd.enable = true;
  mullvad.enable = true;
}
