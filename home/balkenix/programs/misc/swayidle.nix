{config, ...}: {
  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${config.programs.swaylock.package}/bin/swaylock -fFe"; }
      { event = "lock"; command = "lock"; }
    ];
  };
}
