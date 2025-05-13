{
  description = "Hermes's configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations."hermes" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };

      modules = [
        ./nixos/configuration.nix
      ];
    };
  };
}
