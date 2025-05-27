{ pkgs, lib, config, ... }: {
  options = {
    dev.enable = lib.mkEnableOption "Adds some development tools";
  };

  config = lib.mkIf config.dev.enable {
    environment.systemPackages = with pkgs; [
      zed-editor

      gcc
      temurin-bin
      python314
      rustup
      nodePackages.nodejs
      texliveBasic
      nil
      nixd
      hugo
    ];

    programs.git.enable = true;
  };
}
