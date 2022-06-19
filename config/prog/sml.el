;;;;;;;;;;;;;;;;;;;;;;
;; LANG MODES STUFF ;;
;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'sml-mode)

;; As of 01/09/2021,I am an emacs novice, most of the customizations
;; below are yanked from here
;; https://www.cs.princeton.edu/courses/archive/fall04/cos441/web/resources/.emacs

;; Sml stuff
(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
(setq auto-mode-alist
      (append '(("\\.sml$" . sml-mode)
                ("\\.sig$" . sml-mode)
                ("\\.fun$" . sml-mode))
	        auto-mode-alist))

(add-hook 'sml-mode-hook 'turn-on-font-lock)
(add-hook 'sml-load-hook '(lambda () (require 'sml-font)))

;; Broken TODO: fix lmao
(setq exec-path (cons "/usr/local/smlnj/bin/sml" exec-path))
(setq sml-program-name "smlnj")

;; my favorite sml style
(setq sml-indent-level       2)
(setq sml-pipe-indent        -2)
(setq sml-case-indent        t)
(setq sml-nested-if-indent   t)
(setq sml-type-of-indent     nil)
(setq sml-electric-semi-mode nil)


;; Lean stuff
(straight-use-package 'lean-mode)
(straight-use-package 'unicode-fonts)
(unicode-fonts-setup)


;; Agda things
