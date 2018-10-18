;; python

(when (require 'flycheck nil t)
  (add-hook 'python-mode-hook 'flycheck-mode))

(use-package jedi
  :ensure t
  :config
  (progn
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:complete-on-dot t)))

(use-package py-autopep8
  :ensure t
  :config
  (progn
    (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)))

;; pip install  yapf at first
(use-package py-yapf
  :ensure t
  :config
  (progn
    (add-hook 'python-mode-hook 'py-yapf-enable-on-save)))

;; php

(use-package php-mode
  :ensure t
  :pin melpa
  :config
  (progn
    (add-hook 'php-mode-hook 'php-enable-psr2-coding-style)))

(use-package ac-php
  :ensure t
  :config
  (progn
      (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )

               (ac-php-core-eldoc-setup ) ;; enable eldoc
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
               ))))

;; Java
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; (use-package jdee											  ;;
 ;;   :ensure t												  ;;
 ;;   :config												  ;;
 ;;   (progn												  ;;
 ;;     (custom-set-variables '(jdee-server-dir (expand-file-name "jdee-server" user-emacs-directory))))) ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; matlab
;(use-package matlab-mode
;  :ensure t)

(provide 'init-dev)
