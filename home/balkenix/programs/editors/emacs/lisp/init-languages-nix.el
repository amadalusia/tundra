;;; init-languages-nix.el --- setup the nix language
;;; Commentary:
;;; Code:
(use-package lsp-nix
  :ensure lsp-mode
  :after (lsp-mode)
  :demand t
  :custom
  (lsp-nix-nil-formatter ["nixfmt"])
  (lsp-nix-nil-max-mem 4096)
  (lsp-nix-nil-auto-eval-inputs nil))

(use-package nix-mode
  :hook (nix-mode . lsp-deferred)
  :ensure t)

(provide 'init-languages-nix)
;;; init-languages-nix.el ends here
