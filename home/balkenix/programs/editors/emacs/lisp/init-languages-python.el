;;; init-languages-python.el --- Sets up Python with Emacs
;;; Commentary:
;;; Code:
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))
(provide 'init-languages-python)
;;; init-languages-python.el ends here
