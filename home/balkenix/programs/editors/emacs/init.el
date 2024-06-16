(require 'use-package)
(setq use-package-always-ensure t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(setq-default indent-tabs-mode nil)

(dired-async-mode 1)

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))


(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x C-g" . magit-status)))

(use-package parinfer-rust-mode
  :hook emacs-lisp-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t)
  :mode "\\*.rs\\'")

(use-package go-mode
  :mode "\\*.go\\'")

(use-package typescript-mode
  :mode ("\\*.ts\\'" "\\*.js\\'"))

(use-package clojure-mode
  :mode ("\\*.clj\\'" "\\*.cljs\\'"))
