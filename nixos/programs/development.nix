{pkgs, lib, config, ...}: {
  options = {
    development.enable = lib.mkEnableOption "Enable development tools";
  };

  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      # Editors
      zed-editor
      helix
      eclipses.eclipse-java
      dbeaver-bin
      digital

      # Java
      temurin-bin

      # Rust
      rustc-wasm32
      cargo
      rustc

      # NodeJS
      nodejs

      # C / C++
      gcc
      cmake
      gdb

      # Python
      python313

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
          editor = "nvim";
        };
      };
    };
  };
}
