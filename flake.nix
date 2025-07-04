{
  description = "Hermes's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager/master";
    hyprland.url = "github:hyprwm/Hyprland/main";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, home-manager, ...} @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations."hermes" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system; };
      modules = [ ./nixos/configuration.nix ];
    };

    homeConfigurations."leo" = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs; };
      pkgs = pkgs;
      modules = [ ./home-manager/leo/home.nix ];
    };
  };
}
