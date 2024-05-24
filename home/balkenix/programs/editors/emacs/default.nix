{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraConfig = builtins.readFile ./init.el;
    alwaysEnsure = true;
    extraPackages = epkgs:
      with epkgs; [
        use-package
        async
        avy
	kanagawa-theme
        doom-modeline
        nix-mode
        lsp-mode
        lsp-ui
        lsp-ivy
        lsp-treemacs
        which-key
        dap-mode
        helm-lsp
        tree-sitter
        magit
      ];
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
    client.enable = false;
  };
}
