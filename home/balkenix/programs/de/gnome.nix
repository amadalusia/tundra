{pkgs, lib, ...}: {
  home.packages = (with pkgs; [
    gnome.gnome-tweaks
  ]) ++ (with pkgs.gnomeExtensions; [
    space-bar
    user-themes
    vitals
    pop-shell
    dash-to-dock
  ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      monospace-font-name = "IosevkaTerm Nerd Font Mono 10";
      font-name = "Inter 11";
      titlebar-font = "Inter 11";
      font-antialiasing = "rgba";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "space-bar@luchrioh"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
        "pop-shell@system76.com"
        "rounded-window-corners@yilozt"
	"dash-to-dock@micxgx.gmail.com"
      ];
      favorite-apps = [
        "firefox.desktop"
        "emacs.desktop"
        "Alacritty.desktop"
        "vencorddesktop.desktop"
      ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Kanagawa-B-LB";
    };
    
    "org/gnome/shell/extensions/pop-shell" = {
      hint-color-rgba =  "rgba(147, 138, 169, 1)";
      activate-launcher = [ "" ];
    };
    
    "org/gnome/desktop/wm/preferences" = {
      workspace-names = ["Main" "Browsing" "Coding" "Messaging"];
    };
    
    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-1 = [ "<Super><Shift>1" ];
      switch-to-workspace-1 = [ "<Super>1" ];

      move-to-workspace-2 = [ "<Super><Shift>2" ];
      switch-to-workspace-2 = [ "'<Super>2" ];

      move-to-workspace-3 = [ "<Super><Shift>3" ];
      switch-to-workspace-3 = [ "<Super>3" ];

      move-to-workspace-4 = "['<Super><Shift>4']";
      switch-to-workspace-4 = [ "<Super>4" ];
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
    };
    
    "org/gnome/desktop/background" = {
      picture-uri = "${../../wallpapers/cafe.jpg}";
      picture-uri-dark = "${../../wallpapers/cafe.jpg}";
      picture-options = "scaled";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (lib.gvariant.mkTuple [ "xkb" "gb" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" "caps:ctrl_modifier" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>T";
      command = "${pkgs.alacritty}/bin/alacritty";
      name = "Launch terminal";
    };
  };
}
