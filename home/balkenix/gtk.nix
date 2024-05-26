{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      accent = "red";
      gnomeShellTheme = true;
      cursor.enable = true;
      icon.enable = true;
      tweaks = [
        "rimless"
        "normal"
      ];
    };
  };
}
