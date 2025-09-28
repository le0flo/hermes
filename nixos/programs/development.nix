{pkgs, lib, config, ...}: {
  options = {
    development.enable = lib.mkEnableOption "development tools";
  };

  config = lib.mkIf config.development.enable {
    environment.systemPackages = with pkgs; [
      # Editors
      zed-editor

      # Nix
      nixd
      nil
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
