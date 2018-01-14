;; ------ Packages ------
;;
;; A lot (all) of this came from ohai-package (github.com/bodil/ohai-emacs)

;; `(online?)` is a function that tries to detect whether you are online.
;; We want to refresh our package list on Emacs start if we are.
(require 'cl)
(defun online? ()
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
                              (member 'up (first (last (network-interface-info
                                                        (car iface)))))))
            (network-interface-list))
    t))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; If we're online, we attempt to fetch the package directories if
;; we don't have a local copy already. This lets us start installing
;; packages right away from a clean install.
(when (online?)
  (unless package-archive-contents (package-refresh-contents)))

;; `Paradox' is an enhanced interface for package management, which also
;; provides some helpful utility functions we're going to be using
;; extensively. Thus, the first thing we do is install it if it's not there
;; already.
(when (not (package-installed-p 'paradox))
  (package-install 'paradox))

;; We're going to be using `use-package' to manage our dependencies.
;; In its simplest form, we can call eg. `(use-package lolcode-mode)'
;; to install the `lolcode-mode' package. We'd also declare one or more
;; entry points so the module isn't loaded unneccesarily at startup.
;; For instance, `(use-package my-module :commands (my-function))' will
;; defer loading `my-module' until you actually call `(my-function)'.
;;
;; Read about it in detail at https://github.com/jwiegley/use-package

;; First, we make sure it's installed, using a function provided by
;; Paradox, which we've just installed the hard way.
(paradox-require 'use-package)

;; Next, we load it so it's always available.
(require 'use-package)

;; Finally, we enable `use-package-always-ensure' which makes
;; use-package install every declared package automatically from ELPA,
;; instead of expecting you to do it manually.
(setq use-package-always-ensure t)

;; ------ Packages That I use ------
(use-package counsel)
(use-package magit)
(use-package company)
(use-package haskell-mode)

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
;(setq haskell-program-name "ghci")
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; (require 'haskell-mode)

;; ------ Org ------
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/bc-lab.org"
                             "~/org/cs591.org"
                             "~/org/swarmathon.org"
                             "~/org/cs561.org"
                             ))

;(global-set-key "\C-/" 'help-command)
(global-set-key "\C-h"   'backspace)

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
(setq scheme-program-name "guile")

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

;; Ivy configuration
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
;; Ivy-based interface to shell and system tools
;; I'm not planning on using these right now.
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Apearance 
(global-hl-line-mode t) ; turn it on for all modes by default

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (wfv-color)))
 '(custom-safe-themes
   (quote
    ("6e64644c0c814c9b987d80078e6d0b2a3cea65d9d2300d80378728e6053842e1" "6ab99af7083324cd2b32f62c52f1f4b2314fb0eaf2157154cfbb11f7827e8f46" "03ca904a51daef657536e604cd2e8679ecf125478fa475710561f56c3c5de103" "7f0d9571d984e14ad672f407b79febf86b6a133e316aba375cfc05860b4142cd" "1651d8d8793a68425206636eb6eddaadcea0a5893e86533456092f37ce4d8cba" "cb4043174063dd4ecef0979403613cbdce8f1a6035404f422f2e480d0524e050" "734f21e68230313dcc77120a853c7fc962c627b41a4656566d09f3ffb0fffa2b" default)))
 '(org-agenda-files
   (quote
    ("~/org/tomorrow.org" "~/org/reading.org" "~/org/bc-lab.org" "~/org/cs556.org" "~/org/cs591.org" "~/org/swarmathon.org" "~/org/cs561.org" "~/org/cs530.org" "~/org/emm.org")))
 '(package-selected-packages
   (quote
    (org stack-mode markdown-mode matlab-mode haskell-mode yaml-mode counsel erlang toml-mode company-ghci company-ghc company-erlang company cargo restclient rust-mode magit)))
 '(which-function-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
<<<<<<< HEAD
 '(default ((t (:inherit nil :stipple nil :background "#464646" :foreground "gray70" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "simp" :family "Hack"))))
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
 '(org-list-dt ((t (:foreground "deep sky blue" :weight bold))))
 '(org-table ((t (:foreground "DodgerBlue1"))))
 '(org-verbatim ((t (:inherit nil :foreground "white" :weight semi-bold))))
 '(region ((t (:background "slate grey"))))
 '(shadow ((t (:foreground "grey16"))))
 '(show-paren-match ((t (:background "gold" :foreground "black"))))
 '(show-paren-mismatch ((t (:background "deep pink" :foreground "gray18")))))
; '(org-verbatim ((t (:foreground "white" :slant normal :family "Mono")))))

;(require 'org-publish)
(setq org-publish-project-alist
      '(

        ("org-notes"
         :base-directory "~/website/"
         :base-extension "org"
         :publishing-directory "/ssh:wfvining@mack.cs.unm.edu:public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/gen_style.css\" />"
         :html-head-extra "<link href=\"https://fonts.googleapis.com/css?family=Playfair+Display|Raleway\" rel=\"stylesheet\"><link rel=\"icon\" href=\"img/icon.png\" />"
         :html-head-include-default-style nil
         :html-toplevel-hlevel 1
         :headline-levels 4
         :auto-preamble t
         :with-toc nil
         :with-title nil
         :section-numbers nil
         :html-postamble nil
         :html-preamble "<ul class=\"menu\" id=\"top\"><li class=\"menu\"><a href=\"index.html\">Home</a></li><li class=\"menu\"><a href=\"index.html#misc\">Miscellany</a></li><li class=\"menu\"><a href=\"index.html#publications\">Publications</a></li></ul>"
         )

        ("org-static"
         :base-directory "~/website/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg"
         :publishing-directory "/ssh:wfvining@mack.cs.unm.edu:public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        
        ("website" :components ("org-notes" "org-static"))
        
        ))

 ;; '(default ((t (:inherit nil :stipple nil :background "#464646" :foreground "gray70" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "DAMA" :family "Hack"))))
 ;; '(error ((t (:foreground "firebrick1" :weight bold))))
 ;; '(fringe ((t (:background "gray35"))))
 ;; '(highlight ((t (:background "gray21"))))
 ;; '(isearch ((t (:background "coral1" :foreground "gray26"))))
 ;; '(link ((t (:foreground "SteelBlue1" :underline t))))
 ;; '(minibuffer-prompt ((t (:foreground "SteelBlue1"))))
 ;; '(mode-line ((t (:background "gray55" :foreground "black" :box (:line-width -1 :style released-button)))))
 ;; '(org-date ((t (:foreground "turquoise" :underline t))))
 ;; '(org-document-info ((t (:foreground "white smoke" :slant italic))))
 ;; '(org-document-title ((t (:foreground "white" :weight bold))))
 ;; '(org-footnote ((t (:inherit link))))
 ;; '(org-table ((t (:foreground "DodgerBlue1"))))
 ;; '(region ((t (:background "slate grey"))))
 ;; '(shadow ((t (:foreground "grey16"))))
 ;; '(show-paren-match ((t (:background "gold" :foreground "black"))))
 ;; '(show-paren-mismatch ((t (:background "deep pink" :foreground "gray18")))))

