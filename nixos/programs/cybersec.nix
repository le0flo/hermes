{lib, config, pkgs, ...}: {
  options.cybersec.enable = lib.mkEnableOption "cybersecurity tooling";

  config = lib.mkIf config.cybersec.enable {
    # Packages
    environment.systemPackages = with pkgs; [
      ascii gnat15 gdb binaryninja-free
      dig
    ];

    # Wireshark
    programs.wireshark.enable = true;
    users.extraGroups."wireshark".members = [ "leo" ];
  };
}
