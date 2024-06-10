{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.programs.retroarch;
  toCFG = generators.toINI {
    mkKeyValue = generators.mkKeyValueDefault {
      mkValueString = v:
        if v == isString v then ''"${v}"''
        else generators.mkValueStringDefault {} v;
    } " = ";
  };
in {
  options.programs.retroarch = {
    enable = mkEnableOption "RetroArch";
    cores = mkOption {
      type = with types; listOf package;
      description = ''
        Download cores to use with RetroArch.
      '';
    };
    extraConfig = mkOption {
      type = types.attrs;
      default = {};
      description = ''
        Provide options for RetroArch.
      '';
    };
    finalPackage = mkOption {
      type = types.package;
      default = (pkgs.retroarch.override {
        cores = cfg.cores;
      });
    };
  };
  config = mkIf cfg.enable {
    home.packages = [
      cfg.finalPackage
    ];

    xdg.configFile = {
      "retroarch/retroarch.cfg" = {
        source = toCFG "retroarch-settings" cfg.extraConfig;
      };
    };
  };
}
