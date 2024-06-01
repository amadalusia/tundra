{config, pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraConfig = ''
      ${builtins.readFile ./init.el}
      ${builtins.readFile ./lisp/init-ui.el}
    '';
    extraPackages = epkgs:
      with epkgs; [
        use-package
        async
        avy
        swiper
        ivy
        counsel
        doom-modeline
        nix-mode
        rust-mode
        typescript-mode
        go-mode
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
        catppuccin-theme
        parinfer-rust-mode
        flycheck
        flycheck-rust
        flycheck-golangci-lint
        treesit-grammars.with-all-grammars
        spacious-padding
      ];
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
    client.enable = true;
  };
}
