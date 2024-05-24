{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraConfig = builtins.readFile ./init.el;
    extraPackages = epkgs:
      with epkgs; [
        use-package
        async
        avy
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
        vertico
        orderless
      ];
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
    client.enable = false;
  };
}
