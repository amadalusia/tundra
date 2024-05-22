{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.space-bar
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
    gnomeExtensions.pop-shell
    gnomeExtensions.rounded-window-corners
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "space-bar@luchrioh"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
        "pop-shell@system76.com"
        "rounded-window-corners@yilozt"
      ];
      favorite-apps = [
        "firefox.desktop"
        "emacs.desktop"
        "alacritty.desktop"
        "vesktop.desktop"
      ];
      "extensions/pop-shell" = {
        hint-color-rgba =  "'rgba(147, 138, 169, 1)'";
        activate-launcher = "['<Super>space']";
      };
    };
    "org/gnome/desktop/wm" = {
      preferences = {
        workspace-names = ["Main" "Browsing" "Coding" "Messaging"];
      };
      keybindings = {
        move-to-workspace-1 = "['<Super><Shift>1']";
        switch-to-workspace-1 = "['<Super>1']";

        move-to-workspace-2 = "['<Super><Shift>2']";
        switch-to-workspace-2 = "['<Super>2']";

        move-to-workspace-3 = "['<Super><Shift>3']";
        switch-to-workspace-3 = "['<Super>3']";

        move-to-workspace-4 = "['<Super><Shift>4']";
        switch-to-workspace-4 = "['<Super>4']";
      };
    };
    "org/gnome/desktop/background" = {
      picture-uri = "${../../wallpapers/cafe.jpg}";
      picture-uri-dark = "${../../wallpapers/cafe.jpg}";
      picture-options = "scaled";
    };
    
  };
}
