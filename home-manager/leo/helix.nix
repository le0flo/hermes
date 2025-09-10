{lib, config, ...}: {
  options = {
    helix.enable = lib.mkEnableOption "helix config";
  };

  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;

      settings = {
        theme = "onedark";

        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
    };
  };
}
