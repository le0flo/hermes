{lib, config, ...}: {
  options = {
    zed.enable = lib.mkEnableOption "zed config";
  };

  config = lib.mkIf config.zed.enable {
    programs.zed-editor = {
      enable = true;

      extensions = [
        "html"
        "toml"
      ];

      userSettings = {
        features = {
          copilot = false;
        };

        telemetry = {
          metrics = false;
        };

        format_on_save = "off";
        vim_mode = false;

        ui_font_size = 18;
        buffer_font_size = 18;

        theme = {
          mode = "system";
          light = "Gruvbox Light";
          dark = "Gruvbox Dark";
        };
      };
    };
  };
}
