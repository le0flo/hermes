{
  description = "Hermes's configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations.hermes = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit system;
      };

      modules = [
        ./nixos/configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-l14-intel
      ];
    };
  };
}
