{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    catppuccin = {
      theme = "mocha";
      accent = "blue";
      enable = true;
      gnomeShellTheme = true;
      cursor.enable = true;
      icon.enable = true;
    };
  };
}
