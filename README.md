# Hermes's NixOS configuration

### Requirements

- [NixOS](https://nixos.org/) with [flakes](https://wiki.nixos.org/wiki/Flakes) enabled

### Usage

```sh
git clone https://github.com/le0flo/hermes.git
cd hermes
cp /etc/nixos/hardware-configuration.nix ./nixos/
sudo nixos-rebuild switch --flake . # The system will use the configuration specified in this folder from now on
```
