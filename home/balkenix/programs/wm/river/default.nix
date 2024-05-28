{inputs, config, pkgs, ...}: let
  screenshot = pkgs.callPackage ./scripts/screenshot.nix {};
  screenshot-slurp = pkgs.callPackage ./scripts/screenshot-slurp.nix {};
  river-bsp-layout = inputs.river-bsp-layout.packages.${pkgs.system}.default;
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
    extraConfig = ''
      for i in {0..9}; do
        riverctl map normal ${mod} $i set-focused-tags $((1 << $(($i - 1))))
        riverctl map normal ${mod}+Shift $i set-view-tags $((1 << $(($i - 1))))
        riverctl map normal ${mod}+Control $i toggle-focused-tags $((1 << $(($i - 1))))
        riverctl map normal ${mod}+Control+Shift $i toggle-view-tags $((1 << $(($i - 1))))
      done

      ${river-bsp-layout}/bin/river-bsp-layout
      ${pkgs.swaybg}/bin/swaybg -i ${../../../wallpapers/cafe.jpg}
    '';
    settings = {
      border-width = 3;
      map = {
        normal = {
          "${mod} t" = "spawn '${config.programs.alacritty.package}/bin/alacritty'";
          "${mod} e" = "spawn '${config.programs.emacs.package}/bin/emacsclient -c'";
          "${mod} p" = "spawn '${config.programs.rofi.package}/bin/rofi -show drun'";
          "${mod}+Shift w" = "close";
          "${mod}+Shift e" = "exit";
          "Print" = "${screenshot-slurp}/bin/screenshot-slurp";
          "Shift+Print" = "${screenshot}/bin/screenshot";
        };
      };
      default-layout = "bsp-layout";
    };
  };
}
