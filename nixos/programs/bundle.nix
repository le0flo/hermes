{inputs, pkgs, ...}: {
  imports = [
    ./utilities.nix
    ./development.nix
    ./virtual-machines.nix
    ./games.nix
    ./obs.nix
  ];

  # NixOS
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = [
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager
  ];

  # Dynamic linking
  programs.nix-ld.enable = true;

  # Base
  utilities.enable = true;

  # Work
  development.enable = true;
  virtual-machines.enable = true;

  # Other
  games.enable = true;
  obs.enable = true;
}
