{ config, ... }:
let
  inherit (config) fonts colorScheme;
  inherit (colorScheme) palette;
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
        background = "${palette.base00}";
        foreground = "${palette.base05}";
        regular0 = "${palette.base00}";
        regular1 = "${palette.base08}";
        regular2 = "${palette.base0B}";
        regular3 = "${palette.base0A}";
        regular4 = "${palette.base0D}";
        regular5 = "${palette.base0E}";
        regular6 = "${palette.base0C}";
        regular7 = "${palette.base05}";
        bright0 = "${palette.base03}";
        bright1 = "${palette.base08}";
        bright2 = "${palette.base0B}";
        bright3 = "${palette.base0A}";
        bright4 = "${palette.base0D}";
        bright5 = "${palette.base0E}";
        bright6 = "${palette.base0C}";
        bright7 = "${palette.base07}";
        "16" = "${palette.base09}";
        "17" = "${palette.base0F}";
        "18" = "${palette.base01}";
        "19" = "${palette.base02}";
        "20" = "${palette.base04}";
        "21" = "${palette.base04}";
      };
    };
  };
}
