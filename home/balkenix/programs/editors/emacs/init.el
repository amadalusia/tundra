(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(require 'use-package)
(setq use-package-always-ensure t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(use-package kanagawa-theme
  :init
  setq kanagawa-theme-comment-italic t)

(load-theme 'kanagawa t)

(use-package doom-modeline
  :init (doom-modeline-mode 1))
