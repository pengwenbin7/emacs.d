(use-package seethru
  :ensure t)
(use-package golden-ratio
  :ensure t
  :diminish golden-ratio-mode
  :init
  (golden-ratio-mode t))
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(use-package yasnippet
  :ensure t
  :init (yas-global-mode t))
(use-package yasnippet-snippets
  :ensure  t)

(use-package htmlize
  :ensure t)

;; git tools
(use-package git
  :ensure t)
(use-package magit
  :ensure t)

;; web server
(use-package nginx-mode
  :ensure t)
(use-package apache-mode
  :ensure t)

;; need to install latex or dvipng
(setq org-latex-create-formula-image-program 'dvipng)
;;(setq org-latex-create-formula-image-program 'imagemagick)

(provide 'init-pkgs)
