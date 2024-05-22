{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    theme = {
      name = "Juno-palenight";
      package = pkgs.juno-theme;
    };
  };
}
