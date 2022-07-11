;; NOTE: a lot of this config was yanked from other people's configs!


;; Things like menu bar/package manager set-up
;; are configred in this file!
;; Navigation + interacting with Emacs
;; frames and buffers.
;; So things like selectrum, ace-window,
;; undo-tree can be found here
(load-file "~/.emacs.d/config/life/sig.el")

;; programming/markup things
(load-file "~/.emacs.d/config/prog/sig.el")


;; OCaml stuff ... is automaticly added by ocamlsetup
; shift tab to complete
;;;;;;;;;;;
;; Theme ;;
;;;;;;;;;;;

(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/themes/"))
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/moe-emacs.d/"))
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")


;; Cosmetics
(straight-use-package `powerline)
(powerline-default-theme)

(require 'moe-theme)
(load-theme 'moe-dark t)
(setq moe-theme-highlight-buffer-id t)
(setq moe-theme-mode-line-color 'purple)




;; paren highlighting w/moe-theme
(show-paren-mode t)
(setq show-paren-style 'expression)

(set-face-attribute 'default nil
                    :family "Iosevka SS09"
                    :height 130)



;; Weird auto-set vars get sent here!
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(put 'downcase-region 'disabled nil)
