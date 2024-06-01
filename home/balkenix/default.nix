{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin

    ./programs/wm/river
    ./programs/wm/waybar
    ./programs/editors/emacs
    ./programs/cli/zsh
    ./programs/cli/git.nix
    ./programs/cli/direnv.nix
    ./programs/cli/bat.nix
    ./programs/cli/fzf.nix
    ./programs/cli/lazygit.nix
    ./programs/terminals/alacritty.nix
    ./programs/misc/rofi.nix
    ./programs/misc/tofi.nix
    ./programs/misc/dunst.nix
    ./programs/misc/mpv.nix
    ./programs/misc/yazi.nix
    ./programs/misc/imv.nix
    ./gtk.nix
    ./qt.nix
    ./fonts.nix
    ./xdg.nix
  ];

  catppuccin.flavor = "macchiato";

  home.packages = with pkgs; [
    vesktop
    tomato-c
    rmg
  ];

  home.stateVersion = "23.11";
}
