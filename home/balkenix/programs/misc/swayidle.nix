{ config, pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${config.programs.swaylock.package}/bin/swaylock -fFe";
      }
      {
        event = "lock";
        command = "lock";
      }
    ];
    timeouts = [
      {
        timeout = 100;
        command = "${pkgs.brightnessctl}/bin/brightnessctl set 20%-";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl set +20%";
      }
      {
        timeout = 300;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
