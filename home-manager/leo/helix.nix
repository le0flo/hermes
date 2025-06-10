{lib, config, ...}: {
  options = {
    helix.enable = lib.mkEnableOption "Enable the helix configuration";
  };

  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;

      settings = {
        theme = "zed_onedark";

        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
    };
  };
}
