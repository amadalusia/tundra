# Gruvbox Dark Hard

{ lib, config, ... }:
let
  cfg = config.stylix.gruvbox;
in
with lib;
{
  options.stylix.gruvbox = {
    enable = mkEnableOption "gruvbox";
    wallpaper = mkOption {
      type = types.path;
      default = ../../wallpapers/anime_skull.png;
      description = ''
        Set a wallpaper of your choice.
      '';
    };
  };

  config = mkIf cfg.enable {
    stylix = {
      base16Scheme = {
        base00 = "1d2021";
        base01 = "3c3836";
        base02 = "504945";
        base03 = "665c54";
        base04 = "BDAE93";
        base05 = "d5c4a1";
        base06 = "ebdbb2";
        base07 = "fbf1c7";
        base08 = "fb4934";
        base09 = "fe8019";
        base0A = "fabd2f";
        base0B = "b8bb26";
        base0C = "8ec07c";
        base0D = "83a598";
        base0E = "d3869b";
        base0F = "d65d0e";
      };
      image = cfg.wallpaper;
    };
  };
}
