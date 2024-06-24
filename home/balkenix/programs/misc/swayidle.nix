{ config, pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${config.programs.hyprlock.package}/bin/hyprlock";
      }
      {
        event = "lock";
        command = "lock";
      }
    ];
    timeouts = [
      {
        timeout = 100;
        command = "${pkgs.brightnessctl}/bin/brightnessctl set 30%";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl set 60%";
      }
      {
        timeout = 300;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
