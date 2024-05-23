{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    theme = {
      package = pkgs.unstable.kanagawa-gtk-theme;
    };
    iconTheme = {
      name = "Kanagawa";
      package = null;
    };
  };
}
