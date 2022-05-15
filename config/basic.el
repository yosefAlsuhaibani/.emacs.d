
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

;; Package repos
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))
