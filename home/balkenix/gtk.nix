{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    theme = {
      name = "Omni";
      package = pkgs.omni-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };
    cursorTheme = {
      name = "GoogleDot-Black";
      package = pkgs.google-cursor;
    };
  };
}
