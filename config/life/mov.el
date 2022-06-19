
;; This package reminds me what keys do what
(use-package which-key
  :diminish
  :defer 1
  :config (which-key-mode)
          (which-key-setup-side-window-bottom)
          (setq which-key-idle-delay 0.05))


;; cool git graphics package!
(use-package magit
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
