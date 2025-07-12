# Hermes's NixOS configuration

### Requirements

- [NixOS](https://nixos.org/)

### Installation

1. Enable `flakes` in your existing NixOS configuration
2. Replace the `hardware-configuration.nix` in the `nixos/` folder with yours from `/etc/nixos/`

### Usage

```sh
cd hermes
sudo nixos-rebuild switch --flake . # The system will use the configuration specified in this folder from now on
```
