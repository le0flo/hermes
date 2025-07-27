# Hermes's configurations

A repository for every configuration and dotfiles on my laptop's operating system.
Not meant to be used on non-unix machines.

### Usage

Download the repo:

```sh
git clone https://github.com/le0flo/hermes
cd hermes
```

If you have **NixOS**:

```sh
cp /etc/nixos/hardware-configuration.nix ./nixos/
sudo nixos-rebuild switch --flake .
```
