;; NOTE: a lot of this config was yanked from other people's configs!

;; Send all fucky backup files to "backup" dir.
;; + inspo for settings:
;; https://github.com/joedicastro/dotfiles/tree/master/emacs/.emacs.d
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;;A cute little clock
(display-time-mode 1)

;; Disable auto-backups & lock files
(setq create-lockfiles nil)
(setq make-backup-files nil)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
;; Space indents
(setq-default indent-tabs-mode  nil
              default-tab-width 4
              c-basic-offset 4)

;; show matching prens
(setq show-paren-delay 0)
(show-paren-mode t)

;; normal copy paste to clipboard

;; UTF-8 everywhere!
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-language-environment    'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system   'utf-8)
(prefer-coding-system        'utf-8)
(set-input-method nil)

;; Remove trailing whitespace + some other housekeeping things
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)


;; Bootstrap code for straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq Straight-use-package-by-default t)


;; Packages from here onwards!

;; Package repos
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(use-package quelpa)
(use-package quelpa-use-package)
;; Actually get “package” to work.

(setq use-package-always-ensure t)

;; Pakage update stuff!
(use-package auto-package-update
  :defer 10
  :config
  ;; Delete residual old versions
  (setq auto-package-update-delete-old-versions t)
  ;; Do not bother me when updates have taken place.
  (setq auto-package-update-hide-results t)
  ;; Update installed packages at startup if there is an update pending.
  (auto-package-update-maybe))

;; This package reminds me what keys do what
(use-package which-key
  :diminish
  :defer 1
  :config (which-key-mode)
          (which-key-setup-side-window-bottom)
          (setq which-key-idle-delay 0.05))


;; cool git graphics package!
(straight-use-package 'magit
	     :config (global-set-key (kbd "C-x g") 'magit-status))

;; Filtering/sorting candidates -> selectrum + perscient
(straight-use-package 'selectrum)
(straight-use-package 'prescient)
(straight-use-package 'ivy-prescient)
(straight-use-package 'company-prescient)
(straight-use-package 'selectrum-prescient)
(selectrum-mode +1)
(selectrum-prescient-mode +1)
(prescient-persist-mode +1)

;; Window switching
(straight-use-package 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(global-set-key (kbd "C-o") 'ace-window)




;; Undo Tree
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
;; Things to clean the ~undo-tree~ fucked files^


;; "Dog Ears": history tab for buffers
(use-package dogears
  :quelpa (dogears :fetcher github :repo "alphapapa/dogears.el")

  ;; These bindings are optional, of course:
  :bind (:map global-map
              ("M-g d" . dogears-go)
              ("M-g M-b" . dogears-back)
              ("M-g M-f" . dogears-forward)
              ("M-g M-d" . dogears-list)
              ("M-g M-D" . dogears-sidebar)))

;; As of 2021 August 29, I do not have the energy in me
;; to learn org mode. I really want to! and probably will
;; in the upcoming year.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG MODE + LaTeX STUFF   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :config
  (unless (functionp 'org-link-make-string)
    (fset 'org-link-make-string 'org-make-link-string))
  )

(setq org-modules '(org-habit
                    org-mouse
                    org-protocol
                    org-annotate-file
                    org-eval
                    org-expiry
                    org-interactive-query
                    org-collector
                    org-panel
                    org-screen
                    org-toc))
(eval-after-load 'org
  '(org-load-modules-maybe t))
;; Prepare stuff for org-export-backends
(setq org-export-backends '(org latex icalendar html ascii))

;;Yanked from orgmode.org
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))



;; LaTeX
(straight-use-package 'auctex)




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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   (vector "#2d2d2d" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#cccccc"))
 '(beacon-color "#f2777a")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" default))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(dogears quelpa-use-package quelpa undo-tree pdf-tools sml-mode modern-cpp-font-lock auto-complete which-key use-package magit ivy-rich counsel auto-package-update))
 '(pdf-tools-handle-upgrades nil)
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99")))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
