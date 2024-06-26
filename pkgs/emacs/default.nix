{ emacsWithPackagesFromUsePackage, emacs-gtk, ... }:
emacsWithPackagesFromUsePackage {
  package = emacs-gtk;
  config = ./config.org;
  defaultInitFile = true;
  alwaysEnsure = true;
  alwaysTangle = true;
  extraEmacsPackages =
    e: with e; [
      treesit-grammars.with-all-grammars
      nix-ts-mode
    ];
  override = _: prev: { use-package = prev.emacs; };
}
