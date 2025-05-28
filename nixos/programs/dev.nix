{pkgs, lib, config, ...}: {
  options = {
    dev.enable = lib.mkEnableOption "Enable development tools";
  };

  config = lib.mkIf config.dev.enable {
    environment.systemPackages = with pkgs; [
      # Editors
      zed-editor

      # Nix
      nil
      nixd

      # VMs
      temurin-bin

      # Interpreters
      nodePackages.nodejs
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
