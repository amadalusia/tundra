{ pkgs, ... }:
let
  nerdfonts = pkgs.nerdfonts.override { fonts = [ "IosevkaTerm" ]; };
in
{
  fonts.fontconfig.enable = true;

  home.packages = [
    nerdfonts
    pkgs.inter
  ];
}
