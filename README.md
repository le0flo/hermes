# Hermes's NixOS configuration

### Requirements

- [NixOS](https://nixos.org/)

### Installation

1. Enable `flakes` in your existing NixOS configuration
2. Replace the `hardware-configuration.nix` in the `nixos/` folder with yours from `/etc/nixos/`
3. Run `sudo nixos-rebuild switch --flake .`
