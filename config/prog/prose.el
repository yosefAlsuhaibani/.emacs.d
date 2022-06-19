;; There's a lot to be done here LMAO
;; Currently not touching ORG; need to
;; pick it up someday...

;; LaTeX
(straight-use-package 'auctex)
(straight-use-package 'cdlatex)

;; some config settings we're yanked from
;; https://www.vanormondt.net/~peter/blog
(setq TeX-PDF-mode t)
(setq-default TeX-master)
(add-hook `TeX-mode-hook (lambda ()
                           (TeX-fold-mode 1)))

;; Spellchecking in LaTeX!
(add-hook `LaTeX-mode-hook `flyspell-mode)
(add-hook `TeX-mode-hook `flyspell-mode)
(add-hook `bibtex-mode-hook `flyspell-mode)


;;Org
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
