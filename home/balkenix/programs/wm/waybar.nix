{ config, pkgs, ... }:
let
  colours = config.stylix.base16Scheme;
  inherit (config.stylix) fonts;
in
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      modules-left = [ "custom/date" "custom/time" ];
      modules-center = [ "river/tags" ];
      modules-right = [ "pulseaudio" "network" "battery" "tray" ];
      height = 36;

      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-source = "{icon} {volume}%";
        format-muted = "";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "󰂯";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" ];
        };
        ignored-sinks = ["Easy Effects Sink"];
        tooltip = true;
        tooltip-format = "{desc} is at {volume}% volume right now.";
        on-click-right = "${pkgs.pavucontrol}/bin/pavucontrol";
        scroll-step = 2;
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
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        format = "{icon} {capacity}%";
      };
    }];
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
      #tray {
        padding: 0px 8px;
        color: #${colours.base00};
      }

      #custom-date {
        background-color: #${colours.base06};
        border-bottom: none;
      }

      #custom-time {
        background-color: #${colours.base08};
        border-bottom: none;
      }

      #network {
        background-color: #${colours.base0B};
        border-bottom: none;
      }

      #battery {
        background-color: #${colours.base0C};
        border-bottom: none;
      }
    '';
  };
}
