{ pkgs, config, lib, ... }: let
  cfg = config.programs.retroarch;
  
in with lib; {
  options.programs.retroarch = {
    enable = mkEnableOption "RetroArch";
    cores = mkOption {
      type = with types; listOf package;
      description = ''
        Download cores to use with RetroArch.
      '';
    };
    extraConfig = mkOption {
      type = with types; nullOr lines;
      default = "";
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
      "retroarch/retroarch.cfg".text = cfg.extraConfig;
    };
  };
}
