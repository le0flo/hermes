{lib, config, ...}: {
  options = {
    alacritty.enable = lib.mkEnableOption "Enable my Alacritty configuration";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        window = {
          padding = { x = 10; y = 10; };
          opacity = 0.7;
          blur = true;
        };
        font = {
          size = 12.00;
        };
        colors = {
          # TODO
        };
      };
    };
  };
}
