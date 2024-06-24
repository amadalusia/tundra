{ pkgs, ... }:
{
  imports = [
    ./programs/wm/river
    ./programs/editors/emacs
    ./programs/editors/nixvim.nix
    ./programs/cli/zsh
    ./programs/cli/tmux
    ./programs/cli/git.nix
    ./programs/cli/direnv.nix
    ./programs/cli/bat.nix
    ./programs/cli/fzf.nix
    ./programs/cli/lazygit.nix
    ./programs/cli/starship.nix
    ./programs/terminals/alacritty.nix
    ./programs/terminals/foot.nix
    ./programs/misc/rofi.nix
    ./programs/misc/tofi.nix
    ./programs/misc/dunst.nix
    ./programs/misc/mpv.nix
    ./programs/misc/yazi.nix
    ./programs/misc/imv.nix
    ./programs/misc/vesktop.nix
    ./programs/misc/armcord.nix
    ./programs/misc/swayidle.nix
    ./programs/misc/hyprlock.nix
    ./programs/misc/retroarch.nix
    ./programs/misc/waybar.nix
    ./programs/misc/mpd.nix
    ./gtk.nix
    ./qt.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    tomato-c
    rmg
  ];

  home.stateVersion = "23.11";
}
