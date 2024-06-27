{ config, ... }:
let
  inherit (config) fonts;
  inherit (config.colorScheme) palette;
in
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        pad = "10x10";
        font = "${fonts.monospace.name}:size=${toString fonts.monospace.size}";
        dpi-aware = "no";
      };
      colors = {
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
        regular0 = "${palette.base00}";
        regular1 = "${palette.base01}";
        regular2 = "${palette.base02}";
        regular3 = "${palette.base03}";
        regular4 = "${palette.base04}";
        regular5 = "${palette.base05}";
        regular6 = "${palette.base06}";
        regular7 = "${palette.base07}";
        bright0 = "${palette.base08}";
        bright1 = "${palette.base09}";
        bright2 = "${palette.base0A}";
        bright3 = "${palette.base0B}";
        bright4 = "${palette.base0C}";
        bright5 = "${palette.base0D}";
        bright6 = "${palette.base0E}";
        bright7 = "${palette.base0F}";
      };
    };
  };
}
