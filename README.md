# Hermes's NixOS configuration

### Requirements

- [NixOS](https://nixos.org/)
- [Nix flakes](https://nixos.wiki/wiki/flakes)

### Installation

1. Enable `flakes` in your existing NixOS configuration
2. Replace the `hardware-configuration.nix` under `./nixos/` with yours
3. Run `sudo nixos-rebuild switch --flake .`
