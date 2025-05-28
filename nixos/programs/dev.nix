{pkgs, lib, config, ...}: {
  options = {
    dev.enable = lib.mkEnableOption "Enable development tools";
  };

  config = lib.mkIf config.dev.enable {
    environment.systemPackages = with pkgs; [
      # Editors
      zed-editor

      # Compilers
      gcc
      cmake
      rustup

      # VMs
      temurin-bin

      # Interpreters
      python314
      nodePackages.nodejs
      texliveBasic

      # Other
      pkg-config
      hugo
      nil
      nixd
    ];

    # Git
    programs.git = {
      enable = true;

      config = {
        init = {
          defaultBranch = "master";
        };
        core = {
          editor = "nvim";
        };
      };
    };
  };
}
