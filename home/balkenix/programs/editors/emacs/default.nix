{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraConfig = builtins.readFile ./init.el;
    extraPackages = epkgs:
      with epkgs; [
        use-package
        async
        avy
        kanagawa-theme
        doom-modeline
	nix-mode
      ];
  };
}
