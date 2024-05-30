{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    catppuccin.enable = true;
    extraConfig = {
      font = "IosevkaTerm Nerd Font Mono 12";
    };
  };
}
