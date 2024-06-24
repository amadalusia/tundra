{
  inputs,
  config,
  pkgs,
  ...
}:
let
  screenshot_output = "${config.xdg.userDirs.pictures}/Screenshots/";
  river-bsp-layout = inputs.river-bsp-layout.packages.${pkgs.system}.default;
  colors = config.stylix.base16Scheme;
in
{
  home.packages = with pkgs; [
    wl-clipboard
    libnotify
    pavucontrol
    grimblast
    blueberry
    networkmanagerapplet
  ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
    enableZshIntegration = true;
  };

  wayland.windowManager.river =
    let
      mod = "Super";
    in
    {
      enable = true;
      xwayland.enable = true;
      extraConfig = ''
        for i in $(seq 1 6)
        do
            tags=$((1 << ($i - 1)))
            riverctl map normal Super $i set-focused-tags $tags
            riverctl map normal Super+Shift $i set-view-tags $tags
            riverctl map normal Super+Control $i toggle-focused-tags $tags
            riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
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
          "-app-id" = {
            "'imv'" = "float";
            "'mpv'" = "float";
          };
          "ssd" = "";
        };
        map = {
          normal = {
            "None Print" = "spawn '${pkgs.grimblast}/bin/grimblast --notify --freeze copysave area ${screenshot_output}'";
            "Shift Print" = "spawn '${pkgs.grimblast}/bin/grimblast --notify copysave output ${screenshot_output}'";
            "${mod} Return" = "spawn '${config.programs.foot.package}/bin/foot'";
            "${mod} p" = "spawn '${config.programs.tofi.package}/bin/tofi-drun | ${pkgs.bash}/bin/bash'";
            "${mod}+Shift c" = "close";
            "${mod}+Shift q" = "exit";
            "${mod} h" = "move left 96";
            "${mod} j" = "move down 96";
            "${mod} k" = "move up 96";
            "${mod} l" = "move right 96";
            "${mod} t" = "default-layout bsp-layout";
            "${mod} f" = "default-layout";
            "${mod}+Shift Space" = "toggle-float";
            "${mod} m" = "toggle-fullscreen";
            "${mod}+Shift h" = "resize horizontal -96";
            "${mod}+Shift j" = "resize vertical -96";
            "${mod}+Shift k" = "resize vertical 96";
            "${mod}+Shift l" = "resize horizontal 96";
            "${mod} Tab" = "swap next";
            "${mod}+Shift Tab" = "swap previous";
          };
        };
        map-pointer = {
          normal = {
            "${mod} BTN_LEFT" = "move-view";
            "${mod} BTN_RIGHT" = "resize-view";
          };
        };
        default-layout = "bsp-layout";
        spawn = [
          "'${river-bsp-layout}/bin/river-bsp-layout --inner-gap 10 --outer-gap 10 --split-perc 0.5 &'"
          "'${config.services.hyprpaper.package}'"
          "'${config.programs.waybar.package}/bin/waybar'"
          "'${pkgs.networkmanagerapplet}/bin/nm-applet'"
        ];
        border-color-focused = "0x${colors.base0B}";
        border-color-unfocused = "0x${colors.base03}";
      };
    };

  dconf = {
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "close";
      };
    };
  };
}
