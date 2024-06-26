{ config, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        pad = "10x10";
        font = config.fonts.monospace.name;
      };
    };
  };
}
