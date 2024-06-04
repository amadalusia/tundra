(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist
             '(font . "Maple Mono NF-13"))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(set-default 'truncate-lines nil)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(setq doom-modeline-height 30)
(setq doom-modeline-icon t)
(setq doom-modeline-lsp t)
