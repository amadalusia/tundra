{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    catppuccin = {
      accent = "blue";
      tweaks = [ "normal" ];
      enable = true;
      gnomeShellTheme = true;
      cursor.enable = true;
      icon.enable = true;
    };
  };
}
