{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.fonts;
  inherit (lib) mkOption mkPackageOption;
  inherit (lib.types) str package;
in
{
  options.fonts = {
    enable = lib.mkEnableOption "Enable using fonts like this.";
    sansSerif = {
      name = mkOption {
        type = str;
        default = "Ubuntu";
        description = ''Sets the name for a sans font'';
      };

      package = mkPackageOption pkgs "ubuntu_font_family" { };
    };

    monospace = {
      name = mkOption {
        type = str;
        default = "Source Code Pro";
        description = ''Sets the name for the monospace font'';
      };

      package = mkPackageOption pkgs "source-code-pro" { };
    };

    serif = {
      name = mkOption {
        type = str;
        default = "Noto Serif";
        description = ''Sets the name for the serif font'';
      };

      package = mkPackageOption pkgs "noto-fonts" { };
    };

    emoji = {
      name = mkOption {
        type = str;
        default = "Noto Color Emoji";
        description = ''Sets the name for the emoji font'';
      };

      package = mkPackageOption pkgs "noto-fonts-color-emoji" { };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      cfg.sansSerif.package
      cfg.monospace.package
      cfg.serif.package
      cfg.emoji.package
    ];

    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ cfg.sansSerif.name ];
        monospace = [ cfg.monospace.name ];
        serif = [ cfg.serif.name ];
        emoji = [ cfg.emoji.name ];
      };
    };
  };
}
