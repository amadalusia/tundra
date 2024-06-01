{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      modules-left = [ "custom/date" "custom/time" ];
      modules-center = [ "river/tags" ];
      modules-right = [ "network" "battery" "tray" ];
      
      "custom/date" = {
        format = " {}";
        exec = "${pkgs.coreutils}/bin/date +%d.%m.%Y";
        interval = 60;
      };
      
      "custom/time" = {
        format = " {}";
        exec = "${pkgs.coreutils}/bin/date +%H:%M:%S";
        interval = 1;
      };

      "river/tags" = {
        num-tags = 5;
      };
      
      "network" = {
        interface = "wlan0";
        format = "{ifname}";
        format-wifi = " {essid} ({signalStrength}%)";
        format-ethernet = "󰛳 {ipaddr}/{cidr}";
        format-disconnected = "";
      };
      
      "battery" = {
        bat = "BAT0";
        states = {
          warning = 25;
          critical = 10;
        };
        format = "{icon} {capacity}%";
      };
    }];
  };
}
