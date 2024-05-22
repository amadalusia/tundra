{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.space-bar
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
    gnomeExtensions.pop-shell
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
      ];
      favorite-apps = [
        "firefox.desktop"
        "emacs.desktop"
        "alacritty.desktop"
        "vesktopdesktop.desktop"
      ];
    };
    "org/gnome/desktop/wm/preferences" = {
      workspace-names = ["Main" "Browsing" "Coding" "Messaging"];
    };
  };
}
