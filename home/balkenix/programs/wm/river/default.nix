{inputs, config, pkgs, ...}: let
  screenshot = pkgs.callPackage ./scripts/screenshot.nix {};
  screenshot-slurp = pkgs.callPackage ./scripts/screenshot-slurp.nix {};
  river-bsp-layout = inputs.river-bsp-layout.packages.${pkgs.system}.default;
in {
  home.packages = ([
    screenshot-slurp
    screenshot
  ]) ++ (with pkgs; [
    swaybg
    grim
    wl-clipboard
    libnotify
  ]);

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
    '';

    settings = {
      keyboard-layout = "-options 'caps:ctrl' gb";
      input = {
        "touch-1003-35425-ATML1000:00_03EB:8A61" = {
          natural-scroll = "enabled";
        };
        "pointer-2-7-SynPS/2_Synaptics_TouchPad" = {
          natural-scroll = "enabled";
        };
      };
      border-width = 3;
      rule-add = {
        "ssd" = "";
      };
      map = {
        normal = {
          "${mod} Return" = "spawn '${config.programs.alacritty.package}/bin/alacritty'";
          "${mod} p" = "spawn '${config.programs.tofi.package}/bin/tofi-drun | bash'";
          "${mod}+Shift c" = "close";
          "${mod}+Shift q" = "exit";
          "${mod} h" = "focus-view previous";
          "${mod} j" = "focus-view down";
          "${mod} k" = "focus-view up";
          "${mod} l" = "focus-view next";
          "${mod} t" = "default-layout bsp-layout";
          "${mod} f" = "default-layout";
          "${mod}+Shift Space" = "toggle-float";
          "${mod} m" = "toggle-fullscreen";
          "None Print" = "spawn '${screenshot-slurp}/bin/screenshot-slurp'";
          "Shift Print" = "spawn '${screenshot}/bin/screenshot'";
        };
      };
      default-layout = "bsp-layout";
      spawn = [
        "'${river-bsp-layout}/bin/river-bsp-layout --inner-gap 6 --outer-gap 6 --split-perc 0.5 &'"
        "'${pkgs.swaybg}/bin/swaybg -i ${../../../wallpapers/cafe.jpg}'"
        "'${config.programs.waybar.package}/bin/waybar'"
      ];
    };
  };
}
