{pkgs, ...}: let
in {
  gtk = {
    enable = true;
    theme = (pkgs.catppuccin-gtk.override {
      accents = ["blue"];
      size = "compact";
      tweaks = ["rimless" "black"];
      variant = "mocha";
    })
  };
}
