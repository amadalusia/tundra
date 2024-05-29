{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin

    ./programs/wm/river
    ./programs/editors/emacs
    ./programs/cli/zsh
    ./programs/cli/git.nix
    ./programs/cli/direnv.nix
    ./programs/cli/bat.nix
    ./programs/cli/fzf.nix
    ./programs/cli/lazygit.nix
    ./programs/terminals/alacritty.nix
    ./programs/misc/rofi
    ./programs/misc/dunst
    ./programs/misc/yazi.nix
    ./gtk.nix
    ./fonts.nix
  ];

  catppuccin.flavor = "frappe";

  home.packages = with pkgs; [
    vesktop
    tomato-c
    rmg
  ];

  home.stateVersion = "23.11";
}
