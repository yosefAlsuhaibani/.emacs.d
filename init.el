;; NOTE: a lot of this config was yanked from other people's configs!




;; Things like menu bar/package manager set-up
;; are configred in this file!
(load "~/.emacs.d/config/basic.el")

;; Navigation + interacting with Emacs
;; frames and buffers.
;; So things like selectrum, ace-window,
;; undo-tree can be found here
(load "~/.emacs.d/config/mov.el")

;; Org-mode + LaTeX stuff; things to
;; produce written things!
(load "~/.emacs.d/config/prose.el")


;; Weird auto-set vars get sent here!
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)


;;;;;;;;;;;;;;;;;;;;;;
;; LANG MODES STUFF ;;
;;;;;;;;;;;;;;;;;;;;;;
(use-package sml-mode)

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

(setq exec-path (cons "/usr/local/SML/bin" exec-path))
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


;; OCaml stuff ... is automaticly added by ocamlsetup
; shift tab to complete
;;;;;;;;;;;
;; Theme ;;
;;;;;;;;;;;

;; https://github.com/alezost/alect-themes
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-bright t)

(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 120
                    )

(set-face-font 'default "Fira Code")

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
