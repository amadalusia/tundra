(require 'use-package)
(setq use-package-always-ensure t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(use-package emacs
  :custom
  (custom-file (make-temp-file "emacs-custom"))
  (display-line-numbers-type 'relative)
  (indent-tabs-mode nil)
  ;; (package-enable-at-startup nil)
  (make-backup-files nil)
  (auto-save-default nil)
  (create-lockfiles nil)
  (dired-kill-when-opening-new-dired-buffer t)
  (treesit-font-lock-level 4)
  (history-delete-duplicates t)
  (use-dialog-box nil)
  :config
  (global-visual-line-mode 1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (tooltip-mode -1)
  (global-hl-line-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  :hook
  ((conf-mode prog-mode text-mode) . display-line-numbers-mode)
  :bind ("C-c t" . (lambda ()
                     (interactive)
                     (call-process-shell-command "foot &" nil 0))))

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
