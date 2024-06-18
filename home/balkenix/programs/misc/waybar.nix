{ config, pkgs, ... }:
let
  colours = config.stylix.base16Scheme;
  inherit (config.stylix) fonts;
in
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [
          "custom/date"
          "custom/time"
        ];
        modules-center = [ "river/tags" ];
        modules-right = [
          "network"
          "battery"
          "pulseaudio"
          "backlight"
          "memory"
          "tray"
        ];
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";
          ignored-sinks = [ "Easy Effects Sink" ];
          tooltip = true;
          tooltip-format = "{desc} is at {volume}% volume right now.";
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          scroll-step = 2;
          format-icons = {
            headphone = "";
            hands-free = "󰂯";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
            ];
          };
        };
    
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
          num-tags = 6;
        };
    
        network = {
          interface = "wlan0";
          format = "{ifname}";
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = "󰛳 {ipaddr}/{cidr}";
          format-disconnected = "";
        };
    
        memory = {
          interval = 2;
          format = " {percentage}%";
          tooltip = true;
          tooltip-format = "{used:0.1f}G/{total:0.1f}G";
        };
    
        battery = {
          bat = "BAT0";
          states = {
            warning = 25;
            critical = 10;
          };
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          format = "{icon} {capacity}%";
        };
        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [
            ""
            ""
          ];
        };
      }
    ];
    style = ''
      * {
        font-family: ${fonts.monospace.name};
        font-size: 15px;
        border: none;
        border-radius: 0;
      }
    
      window#waybar {
        background-color: #${colours.base00};
        color: #${colours.base05};
        border-bottom: 3px solid #${colours.base01};
        margin: 0px 10px;
      }
    
      #custom-date,
      #custom-time,
      #network,
      #battery,
      #tray,
      #pulseaudio,
      #backlight,
      #memory {
        padding: 0px 8px;
        color: #${colours.base00};
      }
    
      #custom-date {
        background-color: #${colours.base08};
        border-bottom: none;
      }
    
      #custom-time {
        background-color: #${colours.base09};
        border-bottom: none;
      }
    
      #network {
        background-color: #${colours.base0A};
        border-bottom: none;
      }
    
      #battery {
        background-color: #${colours.base0B};
        border-bottom: none;
      }
    
      #pulseaudio {
        background-color: #${colours.base0C};
        border-bottom: none;
      }
    
      #backlight {
        background-color: #${colours.base0D};
        border-bottom: none;
      }
    
      #memory {
        background-color: #${colours.base0E};
        border-bottom: none;
      }
    
      #tags button {
        padding: 0px 8px;
      }
    
      #tags button.focused {
        background-color: #${colours.base01};
      }
    
      #tags button.urgent {
        background-color: #${colours.base09};
        color: #${colours.base00};
      }
    '';
  };
}
