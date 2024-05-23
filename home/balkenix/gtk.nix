{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-B-LB";
      package = pkgs.unstable.kanagawa-gtk-theme;
    };
    iconTheme = {
      name = "oomox-Kanagawa";
      package = null;
    };
    cursorTheme = {
      name = "GoogleDot-Black";
      package = pkgs.google-cursor;
    };
  };
}
