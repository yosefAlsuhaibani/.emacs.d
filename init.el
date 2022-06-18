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

(load-theme 'infodoc t t)
(enable-theme 'infodoc)

(set-face-attribute 'default nil
                    :family "Iosevka SS09"
                    :height 130
                  )



;; Weird auto-set vars get sent here!
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
