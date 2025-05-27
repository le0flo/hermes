{ ... }: {
  imports = [
    ./utilities.nix
    ./dev.nix
    ./virtual-machines.nix
    ./games.nix
    ./obs.nix
  ];

  # NixOS
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Dynamic linking
  programs.nix-ld.enable = true;

  # Base
  utilities.enable = true;

  # Work
  dev.enable = true;
  virtual-machines.enable = true;

  # Casual
  games.enable = true;
  obs.enable = true;
}
