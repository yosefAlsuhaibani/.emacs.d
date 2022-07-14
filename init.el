;; NOTE: a lot of this config was yanked from other people's configs!


(require 'org)
(org-babel-load-file
 (expand-file-name "config.org"
                   user-emacs-directory))



;; Weird auto-set vars get sent here!
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(put 'downcase-region 'disabled nil)
