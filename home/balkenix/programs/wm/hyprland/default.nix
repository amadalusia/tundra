_: {
  systemd.users.services = {
    polkit-kde-authentication-agent-1 = {
      description = "KDE Polkit Agent";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
      };
    };
  };

  home.packages = with pkgs; [
    grimblast
    wl-clipboard
    libsForQt5.polkit-kde-agent
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
