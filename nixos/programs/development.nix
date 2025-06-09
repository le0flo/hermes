{pkgs, lib, config, ...}: {
  options = {
    development.enable = lib.mkEnableOption "Enable development tools";
  };

  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      # Editors
      zed-editor
      eclipses.eclipse-java
      dbeaver-bin
      digital

      # Languages
      temurin-bin
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
