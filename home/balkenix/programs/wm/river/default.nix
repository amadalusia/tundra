{config, pkgs, ...}: let
  screenshot = pkgs.callPackage ./scripts/screenshot.nix {};
  screenshot-slurp = pkgs.callPackage ./scripts/screenshot-slurp.nix {};
in {
  home.packages = (with pkgs; [
    swaybg
    grim
    wl-clipboard
    libnotify
  ]) ++ [
    screenshot
    screenshot-slurp
  ];

  wayland.windowManager.river = let
    mod = "Super";
  in {
    enable = true;
    xwayland.enable = true;
    settings = {
      border = 22;
      map = {
        normal = {
          "${mod} + t" = "spawn '${config.programs.alacritty.package}/bin/alacritty'";
          "${mod} + e" = "spawn '${config.programs.emacs.package}/bin/emacsclient -c'";
          "${mod} + p" = "spawn '${config.programs.rofi.package}/bin/rofi -show drun'";
          "${mod} + Shift + w" = "close";
          "${mod} + Shift + e" = "exit";
          "Print" = "${screenshot-slurp}/bin/screenshot-slurp";
          "Shift + Print" = "${screenshot}/bin/screenshot";
        };
      };
      spawn = [
        "${pkgs.swaybg}/bin/swaybg -i ${../../../wallpapers/cafe.jpg}"
      ];
      extraConfig = builtins.readFile ./river_extraconfig;
    };
  };
}
