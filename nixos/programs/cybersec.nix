{lib, config, pkgs, ...}: {
  options.cybersec.enable = lib.mkEnableOption "cybersecurity tooling";

  config = lib.mkIf config.cybersec.enable {
    # Packages
    environment.systemPackages = with pkgs; [
      ascii gnat15 gdb binaryninja-free
      wireshark-qt dig postman
    ];

    # Wireshark
    users.extraGroups."wireshark".members = [ "leo" ];
  };
}
