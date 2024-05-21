{pkgs, ...}: {
  imports = [
    ./programs/editors/emacs
    ./programs/cli/zsh

    ./programs/terminals/alacritty.nix
    # ./gtk.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    vesktop
    tomato-c
  ];

  home.stateVersion = "23.11";
}
