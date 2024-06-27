{ config, pkgs, ... }:
let
  inherit (config.colorScheme) palette;
  inherit (config) fonts;
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
              font-size: 15px;
              border: none;
              border-radius: 0;
            }

            window#waybar {
              background-color: #${palette.base00};
      	color: #${palette.base05};
      	font-family: "${fonts.monospace.name}";
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
            }

            #custom-date {
              border-bottom: none;
            }

            #custom-time {
              border-bottom: none;
            }

            #network {
              border-bottom: none;
            }

            #battery {
              border-bottom: none;
            }

            #pulseaudio {
              border-bottom: none;
            }

            #backlight {
              border-bottom: none;
            }

            #memory {
              border-bottom: none;
            }

            #tags button {
            	color: #${palette.base05}; 
              padding: 0px 8px;
            }

            #tags button:hover {
            	color: #${palette.base00};
            	background-color: #${palette.base05};
              padding: 0px 8px;
            }

            #tags button.focused {
              background-color: #${palette.base03};
              color: #${palette.base05}; 
            }

            #tags button.urgent {
              color: #${palette.base00};
      	background-color: #${palette.base0F}
            }
    '';
  };
}
