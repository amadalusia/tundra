{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    theme = {
      name = "Juno";
      package = pkgs.juno-theme;
    };
  };
}
