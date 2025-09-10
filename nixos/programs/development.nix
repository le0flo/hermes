{pkgs, lib, config, ...}: {
  options = {
    development.enable = lib.mkEnableOption "development tools";
  };

  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      # Editors
      zed-editor

      # Java
      temurin-bin

      # Rust
      rustup

      # NodeJS
      nodejs

      # C / C++
      gcc
      gdb
      cmake

      # Python
      python313
      pyright

      # Latex
      texliveBasic
      texlivePackages.latexmk

      # Nix
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
          editor = "vim";
        };
      };
    };
  };
}
