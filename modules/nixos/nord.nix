# Nord Dark

{ lib, config, ... }:
let
  cfg = config.stylix.nord;
in
with lib;
{
  options.stylix.nord = {
    enable = mkEnableOption "nord";
    wallpaper = mkOption {
      type = types.path;
      default = ../../wallpapers/nord/ign_animeGirlSleeping.png;
      description = ''
        Set a wallpaper of your choice.
      '';
    };
  };

  config = mkIf cfg.enable {
    stylix = {
      base16Scheme = {
        base00 = "2E3440";
        base01 = "3B4252";
        base02 = "434C5E";
        base03 = "4C566A";
        base04 = "D8DEE9";
        base05 = "E5E9F0";
        base06 = "ECEFF4";
        base07 = "8FBCBB";
        base08 = "BF616A";
        base09 = "D08770";
        base0A = "EBCB8B";
        base0B = "A3BE8C";
        base0C = "88C0D0";
        base0D = "81A1C1";
        base0E = "5E81AC";
        base0F = "B48EAD";
      };
      image = cfg.wallpaper;
    };
  };
}
