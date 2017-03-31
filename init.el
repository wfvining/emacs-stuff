;; ------ Marmalade ------
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa") t)
(package-initialize)

;; basic appearance stuff
(column-number-mode t)
(show-paren-mode t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; *scratch*
")

;; tab-indentation is the devil
(set-default 'indent-tabs-mode nil)
;; Always indent after a newline (thanks ohai-emacs).
(define-key global-map (kbd "RET") 'newline-and-indent)

;(use-package ethan-wspace
;             :demand t
;             :commands global-ethan-wspace-mode
;             :config
;             (global-ethan-wspace-mode 1)
;             :bind ("C-c c" . ethan-wspace-clean-all)
;             :diminish ethan-wspace-mode)

(setq-default tab-width 4)

(setq mode-require-final-newline nil)

;; Always turn on flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode)

;; ------ C Indentation ------
(setq c-default-style "linux"
      c-basic-offset 3)

;; remove toolbar
(tool-bar-mode -1)
;; and the scrollbar
(set-scroll-bar-mode 'nil)
;; and the menu
(menu-bar-mode -99)

;; ------ Erlang ------
;(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.8.1/emacs"
;                      load-path))
;(setq erlang-root-dir "/usr/local/lib/erlang")
;(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
;(require 'erlang-start)

;; ------ Io ------
;(setq load-path (cons "~/.emacs.d/lisp" load-path))
;(require 'io-mode)

;(require 'elixir-mode)

(setq erlang-indent-level 4)

;; ------ Haskell ------
(setq haskell-program-name "ghci")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(require 'haskell-mode)

;; ------ Org ------
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/life.org"
                             "~/org/linguistics.org"
                             "~/org/projects.org"
                             ))

;; ------ Rust -----
;; (add-to-list 'load-path "~/.emacs.d/modes/rust-mode/")
;; (autoload 'rust-mode "rust-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
;; (custom-set-variables
;;    '(show-paren-mode t)
;;    '(size-indication-mode t)
;;    '(tool-bar-mode nil)
;;    '(transient-mark-mode t)
;;    '(column-number-mode t)
;;    '(indent-tabs-mode nil)
;;    '(make-backup-files nil))

;; ------ Scheme ------
(setq scheme-program-name "racket")

;;(require 'mac-key-mode)
;;(mac-key-mode 1)
;;(pc-selection-mode 1)
;;(setq mac-option-modifier 'meta)

;(add-to-list 'load-path "/home/wfv/slime") ;; change this

;(require 'slime)
;(slime-setup '(slime-repl slime-autodoc slime-fancy-inspector))

;(setq inferior-lisp-program "/usr/local/bin/ccl") ;; change this
;; use this on a 32Bit Mac (only if your mac is pretty old)
;;(setq inferior-lisp-program "/usr/local/bin/ccl") ;; if needed, change this
;(command-execute 'slime)

;; Som variable I might want to set.
;; (custom-theme-set-variables
;;  'wfv-gray-nobold
;;  '(type-break-interval 1200)
;;  '(electric-pair-mode t)
;;  '(debug-on-quit t)
;;  '(which-function-mode t))

(global-hl-line-mode t) ; turn it on for all modes by default

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wfv-gray-nobold)))
 '(custom-safe-themes
   (quote
    ("1651d8d8793a68425206636eb6eddaadcea0a5893e86533456092f37ce4d8cba" "cb4043174063dd4ecef0979403613cbdce8f1a6035404f422f2e480d0524e050" "734f21e68230313dcc77120a853c7fc962c627b41a4656566d09f3ffb0fffa2b" default)))
 '(package-selected-packages
   (quote
    (toml-mode company-ghci company-ghc company-erlang company cargo restclient rust-mode magit)))
 '(which-function-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(error ((t (:foreground "firebrick1" :weight bold))))
 '(fringe ((t (:background "gray35"))))
 '(highlight ((t (:background "gray21"))))
 '(isearch ((t (:background "coral1" :foreground "gray26"))))
 '(link ((t (:foreground "SteelBlue1" :underline t))))
 '(minibuffer-prompt ((t (:foreground "SteelBlue1"))))
 '(mode-line ((t (:background "gray55" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(org-date ((t (:foreground "turquoise" :underline t))))
 '(org-document-info ((t (:foreground "white smoke" :slant italic))))
 '(org-document-title ((t (:foreground "white" :weight bold))))
 '(org-footnote ((t (:inherit link))))
 '(org-table ((t (:foreground "DodgerBlue1"))))
 '(region ((t (:background "slate grey"))))
 '(shadow ((t (:foreground "grey16"))))
 '(show-paren-match ((t (:background "gold" :foreground "black"))))
 '(show-paren-mismatch ((t (:background "deep pink" :foreground "gray18")))))
