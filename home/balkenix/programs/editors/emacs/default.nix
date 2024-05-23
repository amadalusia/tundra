{pkgs, ...}: {
  home.packages = with pkgs.tree-sitter-grammars; [
    tree-sitter-c
    tree-sitter-go
    tree-sitter-zig
    tree-sitter-nix
    tree-sitter-tsx
    tree-sitter-jsx
    tree-sitter-rust
    tree-sitter-lua
    tree-sitter-cpp
    tree-sitter-elisp
    tree-sitter-python
    tree-sitter-svelte
    tree-sitter-markdown
    tree-sitter-javascript
    tree-sitter-typescript
  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraConfig = builtins.readFile ./init.el;
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
      ];
  };
}
