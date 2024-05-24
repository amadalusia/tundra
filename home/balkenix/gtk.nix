{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-B";
      package = pkgs.unstable.kanagawa-gtk-theme;
    };
    iconTheme = {
      name = "Kanagawa";
      package = pkgs.unstable.kanagawa-icon-theme;
    };
    cursorTheme = {
      name = "GoogleDot-Black";
      package = pkgs.google-cursor;
    };
  };
}
