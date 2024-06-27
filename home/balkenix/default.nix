{
  nix-colors,
  inputs,
  pkgs,
  ...
}:
let
  nix-colors-lib = nix-colors.lib.contrib { inherit pkgs; };
in
{
  imports = [
    inputs.self.homeManagerModules.font-module
    nix-colors.homeManagerModules.default
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
    ./programs/misc/hyprpaper.nix
    ./programs/misc/retroarch.nix
    ./programs/misc/waybar.nix
    ./programs/misc/mpd.nix
    ./gtk.nix
    ./qt.nix
    ./xdg.nix
  ];

  colorScheme = nix-colors.colorSchemes.tokyo-night-dark;

  fonts = {
    enable = true;
    monospace = {
      name = "SpaceMono Nerd Font Mono";
      package = pkgs.space-mono-nerd;
      size = 14;
    };
  };

  home.packages = with pkgs; [
    tomato-c
    rmg
  ];

  home.stateVersion = "23.11";
}
