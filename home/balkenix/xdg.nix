_: {
  xdg = {
    enable = true;
    mime.enable = true;
    mineApps = {
      enable = true;
      associations.added = {
        "text/html" = [ "firefox.desktop" ];
        "video/mp4" = [ "mpv.desktop" ];
        "video/x-msvideo" = [ "mpv.desktop" ];
        "video/webm" = [ "mpv.desktop" ];
      };
    };
  };
}
