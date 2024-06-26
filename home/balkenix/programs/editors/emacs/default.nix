{ config, pkgs, ... }:
let
  inherit (builtins) toString;
in
{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: { inherit (tpkgs) collection-fontsrecommended; };
  };

  programs.emacs = {
    enable = true;
    package = pkgs.balkemacs;
    extraPackages = epkgs: with epkgs; [ use-package ];
  };

  stylix.targets.emacs.enable = true;
}
