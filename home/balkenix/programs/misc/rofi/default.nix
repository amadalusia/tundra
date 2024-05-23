{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland
    extraConfig = builtins.readFile ./config/config.rasi;
    theme = ./config/kanagawa.rasi
  };
}