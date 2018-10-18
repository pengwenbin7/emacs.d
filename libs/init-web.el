(use-package web-mode
  :ensure t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.html?" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.blade.php" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.twig" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.jsp" . web-mode))
    ;; Set tab to 4 to play nice with plebeian editors
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" "\\.json\\'"))

(use-package css-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
    (add-to-list 'auto-mode-alist '("\\.sass$" . css-mode))))

(use-package emmet-mode
  :ensure t
  :commands (emmet-expand-line emmet-expand)
  :init
  (progn
    (add-hook 'sgml-mode-hook 'emmet-mode)
    (add-hook 'web-mode-hook 'emmet-mode)
    (add-hook 'css-mode-hook  'emmet-mode))
  :config
  (progn
    ;(bind-key "C-j" 'emmet-expand-line emmet-mode-keymap)
    ;(bind-key "<C-return>" 'emmet-expand emmet-mode-keymap)
    (setq emmet-indentation 2)
    (defadvice emmet-preview-accept (after expand-and-fontify activate)
      "Update the font-face after an emmet expantion."
      (font-lock-fontify-buffer))))

(provide 'init-web)
