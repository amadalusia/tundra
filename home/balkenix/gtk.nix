{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-BL-LB";
      package = pkgs.unstable.kanagawa-gtk-theme;
    };
    iconTheme = {
      name = "Kanagawa";
      package = null;
    };
  };
}
