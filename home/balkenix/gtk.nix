{pkgs, ...}: let
  kanagawa-gtk-theme = pkgs.callPackage ../../pkgs/kanagawa-gtk-theme.nix;
in {
  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-B-LB";
      package = kanagawa-gtk-theme;
    };
  };
}
