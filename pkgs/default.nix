{ pkgs, ... }:
{
  space-mono-nerd = pkgs.nerdfonts.override { fonts = [ "SpaceMono" ]; };
}
