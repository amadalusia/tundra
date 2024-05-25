{inputs, pkgs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    
    ./programs/de/gnome.nix
    ./programs/editors/emacs
    ./programs/cli/zsh
    ./programs/cli/git.nix
    ./programs/cli/direnv.nix
    ./programs/cli/bat.nix
    ./programs/cli/fzf.nix
    ./programs/terminals/alacritty.nix
    ./programs/misc/rofi
    ./gtk.nix
    ./fonts.nix
  ];

  catppuccin.flavor = "mocha";

  home.packages = with pkgs; [
    vesktop
    tomato-c
  ];

  home.stateVersion = "23.11";
}
