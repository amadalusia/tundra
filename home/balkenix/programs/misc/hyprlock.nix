{ config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          outline_thickness = 5;
          placeholder_text = "Type your password...";
          fail_text = "Fail $ATTEMPTS: $FAIL";
          shadow_passes = 2;
        }
      ];

      label = [
        {
          monitor = "";
          font_size = 20;
          font_family = "SpaceMono Nerd Font Mono";
          text = "wsg @$USER, it's $TIME rn";
          halign = "center";
        }
      ];
    };
  };
}
