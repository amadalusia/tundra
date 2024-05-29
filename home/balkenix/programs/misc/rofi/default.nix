{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    catppuccin.enable = true;
    settings = {
      font = "IosevkaTerm Nerd Font Mono 12";
    };
  };
}
