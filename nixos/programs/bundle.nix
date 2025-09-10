{inputs, pkgs, ...}: {
  imports = [
    ./utils.nix
    ./development.nix
    ./virtualization.nix
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

  # Custom
  utils.enable = true;
  development.enable = true;
  virtualization.enable = true;
  games.enable = true;
  obs.enable = true;
}
