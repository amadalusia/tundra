{pkgs, ...}: {
  imports = [
    ./programs/de/gnome.nix
    ./programs/editors/emacs
    ./programs/cli/zsh
    ./programs/terminals/alacritty.nix
    ./programs/misc/rofi
    ./gtk.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    vesktop
    tomato-c
  ];

  home.stateVersion = "23.11";
}
