{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ texliveFull ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraConfig = ''
      (require 'init-icomp "${./lisp/init-icomp.el}")
      (require 'init-lsp "${./lisp/init-lsp.el}")
      (require 'init-ui "${./lisp/init-ui.el}")

      ${builtins.readFile ./init.el}
    '';
    extraPackages =
      epkgs: with epkgs; [
        use-package
        async
        avy
        vertico
        orderless
        marginalia
        mct
        embark
        consult
        embark-consult
        doom-modeline
        nix-mode
        rust-mode
        typescript-mode
        go-mode
        clojure-mode
        lsp-mode
        lsp-ui
        lsp-ivy
        lsp-treemacs
        which-key
        dap-mode
        tree-sitter
        magit
        vertico
        orderless
        parinfer-rust-mode
        flycheck
        flycheck-rust
        flycheck-golangci-lint
        treesit-grammars.with-all-grammars
        dashboard
        page-break-lines
        direnv
        projectile
      ];
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
    client.enable = true;
  };

  stylix.targets.emacs.enable = true;
}
