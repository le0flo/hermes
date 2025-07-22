# Hermes's configurations

A repository for every configuration and dotfiles for my laptop's operating system.
Not meant to be used on non-unix machines.

### Usage

Download the repo:

```sh
git clone https://github.com/le0flo/hermes.git
cd hermes
```

If you have **NixOS**:

```sh
cp /etc/nixos/hardware-configuration.nix ./nixos/
sudo nixos-rebuild switch --flake .
```
