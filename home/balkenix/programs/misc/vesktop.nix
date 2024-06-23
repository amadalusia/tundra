{ config, inputs, ... }:
let
  font = config.stylix.fonts.monospace.name;
in
{
  imports = [ inputs.self.homeManagerModules.vesktop ];

  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
    };
    theme = ''
      :root {
        --font-primary: '${font}', 'gg sans', 'Noto Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif, 'Apple Symbols';
        --font-display: '${font}', 'gg sans', 'Noto Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif, 'Apple Symbols';
        --font-headline: '${font}', 'ABC Ginto Nord', 'Noto Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif, 'Apple Symbols';
        --font-code: '${font}', 'gg mono', 'Source Code Pro', Consolas, 'Andale Mono WT', 'Andale Mono', 'Lucida Console',
        'Lucida Sans Typewriter', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', 'Liberation Mono', 'Nimbus Mono L', Monaco,
        'Courier New', Courier, monospace;
        --font-clan-body: '${font}', Fraunces, 'gg sans', serif, 'Noto Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif,
        'Apple Symbols';
        --font-clan-signature: '${font}', Corinthia, 'gg sans', cursive, 'Noto Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif,
        'Apple Symbols';
      }
    '';
  };

  stylix.targets.vesktop.enable = true;
}
