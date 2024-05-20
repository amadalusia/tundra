{pkgs, ...}: let
  my_emacs = pkgs.emacsWithPackagesFromUsePackage {
    config = ./init.el;
    defaultInitFile = true;
    package = pkgs.emacs-pgtk;
    alwaysEnsure = true;

    extraEmacsPackages = epkgs:
      with epkgs; [
        use-package
        async
        avy
      ];
  };
in {
  programs.emacs = {
    enable = true;
    package = my_emacs;
  };
}
