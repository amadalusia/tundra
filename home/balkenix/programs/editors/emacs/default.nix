{ config, pkgs, ... }:
let
  inherit (builtins) toString;
in
{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: { inherit (tpkgs) collection-fontsrecommended; };
  };

  services.emacs = {
    enable = true;
    package = pkgs.balkemacs.override { };
  };
}
