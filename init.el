;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(org-babel-load-languages (quote ((emacs-lisp . t) (python . t))))
 '(org-babel-python-command "/home/xl/bin/anaconda3/bin/python3")
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-format-latex-header
   "\\documentclass{article}
\\usepackage[UTF8, heading = true]{ctex}
\\usepackage[usenames]{color}
[PACKAGES]
[DEFAULT-PACKAGES]
\\pagestyle{empty}             % do not remove
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}")
 '(org-format-latex-options
   (quote
    (:foreground "Black" :background "Transparent" :scale 1.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-html-mathjax-options
   (quote
    ((path "https://cdn.bootcss.com/mathjax/2.7.5/MathJax.js?config=TeX-AMS_SVG")
     (scale "100")
     (align "center")
     (font "TeX")
     (linebreaks "false")
     (autonumber "AMS")
     (indent "0em")
     (multlinewidth "85%")
     (tagindent ".8em")
     (tagside "right"))))
 '(org-latex-compiler "xelatex")
 '(org-preview-latex-process-alist
   (quote
    ((dvipng :programs
	     ("latex" "dvipng")
	     :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
	     (1.0 . 1.0)
	     :latex-compiler
	     ("latex -interaction nonstopmode -output-directory %o %f")
	     :image-converter
	     ("dvipng -fg %F -bg %B -D 200 -T tight -o %O %f"))
     (dvisvgm :programs
	      ("latex" "dvisvgm")
	      :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :use-xcolor t :image-input-type "dvi" :image-output-type "svg" :image-size-adjust
	      (1.7 . 1.5)
	      :latex-compiler
	      ("latex -interaction nonstopmode -output-directory %o %f")
	      :image-converter
	      ("dvisvgm %f -n -b min -c %S -o %O"))
     (imagemagick :programs
		  ("latex" "convert")
		  :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
		  (1.0 . 1.0)
		  :latex-compiler
		  ("pdflatex -interaction nonstopmode -output-directory %o %f")
		  :image-converter
		  ("convert -density %D -trim -antialias %f -quality 100 %O")))))
 '(package-selected-packages
   (quote
    (apache-mode nginx-mode git magit markdown-preview-mode markdown-mode yasnippet matlab matlab-mode htmlize ac-php php-mode yasnippet-snippets py-yapf py-autopep8 jedi emmet-mode js2-mode web-mode flycheck elpy use-package seethru golden-ratio-scroll-screen golden-ratio)))
 '(python-shell-interpreter "/home/xl/bin/anaconda3/bin/python")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "YaHei Monaco Hybird" :foundry "MS  " :slant normal :weight normal :height 143 :width normal))))
 '(hl-line ((t (:background "black")))))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(cond ((eq system-type 'darwin)
       (setq mac-command-modifier 'meta))
      ())
;; pretty symbol
(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
	'(
	  ("lambda" . 955) ; λ
	  ("<=" . 8804) ; ≤
	  (">=" . 8805) ; ≥
	  ("!=" . 8800) ; ≠
	  ("->" . 8594) ; →
	  ("=>" . 8658) ; ⇒
	  )))
(add-hook 'php-mode-hook 'my-pretty-lambda)
(add-hook 'c-mode-hook 'my-pretty-lambda)
(add-hook 'scheme-mode-hook 'my-pretty-lambda)
(add-hook 'racket-mode-hook 'my-pretty-lambda)
(add-hook 'php-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode t)

;; define Lisp
(setq inferior-lisp-program "/usr/bin/scheme")
;; c-set-style k&r
(setq c-default-style "k&r" c-basic-offset 4)
;; org-mode sub superscript using _{}
(setq org-export-with-sub-superscripts '{})

;; auto backup
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/auto-backup"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(add-to-list 'load-path (expand-file-name "libs" user-emacs-directory))
(require 'init-pkgs)
(require 'init-dev)
(require 'init-web)
