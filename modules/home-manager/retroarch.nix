{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.programs.retroarch;
in
{
  options.programs.retroarch = {
    enable = mkEnableOption "RetroArch";
    cores = mkOption {
      type = with types; listOf package;
      description = ''
        Download cores to use with RetroArch.
      '';
    };
    extraConfig =
      with types;
      mkOption {
        type = attrsOf (oneOf [
          int
          float
          bool
          str
        ]);
        default = { };
        description = ''
          Provide options for RetroArch.
        '';
      };
    finalPackage = mkOption {
      type = types.package;
      default = (pkgs.retroarch.override { cores = cfg.cores; });
    };
  };
  config = mkIf cfg.enable {
    home.packages = [ cfg.finalPackage ];

    xdg.configFile = {
      "retroarch/retroarch.cfg" = {
        text = generators.toKeyValue {
          mkKeyValue = generators.mkKeyValueDefault {
            mkValueString =
              v:
              if isString v then
                ''"${v}"''
              else if isInt v then
                ''"${toString v}"''
              else if isBool v then
                ''"${toString v}"''
              else if isFloat v then
                ''"${toString v}"''
              else
                generators.mkValueStringDefault v;
          } " = ";
        } cfg.extraConfig;
      };
    };
  };
}
