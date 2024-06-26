_: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${../../../../wallpapers/dummy.png}" ];
      wallpaper = [ "eDP-1,${../../../../wallpapers/dummy.png}" ];
    };
  };
}
