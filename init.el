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
(use-package yaml-mode)
(use-package cmake-mode)
(use-package gnuplot-mode)
(use-package erlang)
(use-package restclient)
(use-package gnuplot)
(use-package cmake-mode)
(use-package yaml-mode)
(use-package org-ref)
(use-package slime)
(use-package ethan-wspace)
(use-package geiser)
(use-package ob-elixir)
(use-package ess)
(use-package alchemist)
(use-package go-mode)
(use-package go-guru)
(use-package hasklig-mode)
(use-package flycheck)
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (erlang-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(setq geiser-default-implementation 'racket)
(setq inferior-lisp-program "sbcl")

;; enable ethan wspace
(global-ethan-wspace-mode 1)

;; shortcut for magit-status
(global-set-key "\C-xg" 'magit-status)

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

;; enable electric pair mode by default
(electric-pair-mode 1)

(setq erlang-indent-level 4)

;; ------ Haskell ------
;(setq haskell-program-name "ghci")
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; (require 'haskell-mode)

;; ------ Org ------
(load-file "~/.emacs.d/ob-julia.el")
(defconst task-file "~/org/tasks.org")
(defconst research-journal-file "~/org/research-journal.org")
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(setq org-log-into-drawer t)
(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS(i!)" "BLOCKED(b@)" "|" "DONE(d!)" "CANCELED(c!)")))
(setq org-todo-keyword-faces '(("TODO" . org-todo) ("DONE" . org-done) ("CANCELED" . (:foreground "DodgerBlue1"))
                               ("BLOCKED" . (:foreground "DarkOrange1"))))
(setq org-agenda-files
 (list task-file))
(setq org-capture-templates
      '(("t" "Task" entry (file task-file)
         "* TODO [#C] %? %^g")
        ("n" "Research note" entry (file research-journal-file)
         "* %? %^g\n %T")
        ("m" "Memory note" entry (file "memory.org")
         "* %? %^g\n %T")))
(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'org-capture-after-finalize-hook 'org-save-all-org-buffers)
;; (defun sync-org-files ()
;;   (async-shell-command "unison248 -ui text -auto -batch org-sync"))
;; (add-hook 'org-mode-hook
;;           (lambda () (add-hook 'after-save-hook 'sync-org-files nil 'local)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (gnuplot . t)
   (octave . t)
   (matlab . t)
   (emacs-lisp . t)
   (lisp . t)
   (haskell . t)
   (scheme . t)
   (elixir . t)
   (julia . t)
   ))

(defun my-org-confirm-babel-evaluate (lang body)
  (not (or (string= lang "elixir") (string= lang "gnuplot"))))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted")))
(setq org-latex-minted-options '(("frame" "lines") ("linenos=true")))

(require 'org-ref)
(setq reftex-default-bibliography '("~/org/bibliography/lbsb-references.bib"))
(setq org-ref-default-bibliography "~/org/bibliography/references.bib"
      org-ref-bibliography-notes "~/org/bibliography/notes.org")
(setq org-ref-cite-completion-function 'org-ref-ivy-cite-completion)
(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
        "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"))

;; org export latex classes and settings
(add-to-list 'org-latex-classes
             '("acmart" "\\documentclass{acmart}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("tufte-book" "\\documentclass{tufte-book}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))

(add-to-list 'org-latex-classes
             '("tufte-handout" "\\documentclass{tufte-handout}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))

(add-to-list 'org-latex-classes
             '("memoir" "\\documentclass{memoir}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))

(setq org-html-doctype "html5")
(setq org-html-html5-fancy t)

(setq org-publish-project-alist
      '(

        ("org-notes"
         :base-directory "~/website/"
         :base-extension "org"
         :publishing-directory "/ssh:wfvining@mack.cs.unm.edu:public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/gen_style.css\" />"
         :html-head-extra "<link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro|Source+Serif+Pro|Source+Code+Pro\" rel=\"stylesheet\"><link rel=\"icon\" href=\"img/icon.png\" />"
         ; (expand-filename ...) to add contents of a file into html-head
         :html-head-include-default-style nil
         :html-toplevel-hlevel 1
         :headline-levels 4
         :auto-preamble t
         :with-toc nil
         :with-title nil
         :section-numbers nil
         :html-postamble "Published on %T"
         :html-preamble "<ul class=\"menu\" id=\"top\"><li class=\"menu\"><a href=\"index.html\">Home</a></li><li class=\"menu\"><a href=\"index.html#publications\">Publications</a></li><li class=\"menu\"><a href=\"index.html#software\">Software</a></li><li class=\"menu\"><a href=\"index.html#contact\">Contact</a></li></ul>"
         )

        ("org-static"
         :base-directory "~/website/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|mp4"
         :publishing-directory "/ssh:wfvining@mack.cs.unm.edu:public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("website" :components ("org-notes" "org-static"))

        ))

;; ------ Scheme ------
(setq scheme-program-name "guile")

;;(require 'mac-key-mode)
;;(mac-key-mode 1)
;;(pc-selection-mode 1)
;;(setq mac-option-modifier 'meta)

;; Ivy configuration
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "C-c l") 'counsel-find-library)
(global-set-key (kbd "C-c i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "C-c u") 'counsel-unicode-char)

;; Erlang LS

;; (setq lsp-keymap-prefix "C-;")
;; (add-hook 'erlang-mode-hook #'lsp)
;; (use-package yasnippet)
;; (yas-global-mode t)
;; (use-package lsp-ui)
;; (setq lsp-ui-sideline-enable t)
;; (setq lsp-ui-doc-enable t)
;; (setq lsp-ui-doc-position 'bottom)

;; (use-package lsp-origami)
;; (add-hook 'origami-mode-hook #'lsp-origami-mode)
;; (add-hook 'erlang-mode-hook #'origami-mode)

;; (use-package which-key)
;; (add-hook 'erlang-mode-hook 'which-key-mode)
;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; Always show diagnostics at the bottom, using 1/3 of the available space
(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.33)))

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

(global-display-line-numbers-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes '(aspen))
 '(custom-safe-themes
   '("74783cbd94da768d1c21a464c99c95019d916e850fe8cf4dd498f82ed4b845c5" "4b6d236309ccc1639694f05e2fc77f9ba5ccfbe19829c25f5dbb66c8f94fb780" "cab8fa3a50d6cb8d6b1ef5f0361bc7bb81b86b8bf07c6ef96bf4da9164290764" "dc92140eef55cb06cf61a50e75bd518ab787d10560f80f27eabc83b1764af86b" "704359b9e6f2b17373a0bba8e9114822d4936511a86adfb49af92f9fd17d13dc" "80cc795c1a741290b22bd0d0814fb715a5ede6dc879bda6fb1b4d4bbcd228056" "82821dfff1083673ef25c4152514d6a2a038672a18aa473fe2c83386aae2ce91" "a752b0b5dd583517745d6ee5793bcd6c249d53dbdb6d015b11b18db075f18832" "77c450cceca9d9a0f5f1389e2b62e9f634f78957385ffc308d3c2c72983752f4" "e496f0a63c251a8f0f1b9327f16e3cbd4640c39b99e56b0e79b5186a587c47d7" "bc0f5e734a1c6e82842693fd2c3656ccf83d9d18470d02b9ea5a80c387190aea" default))
 '(custom-theme-directory "~/.emacs.d/")
 '(org-agenda-files
   '("~/ai/term-paper.org" "~/org/dissertation-proposal.org" "~/org/research-journal.org" "~/org/tasks.org"))
 '(package-selected-packages
   '(dash dap-mode lsp-treemacs helm-lsp lsp-ivy flycheck helm which-key lsp-origami lsp-ui yasnippet lsp-mode ivy-erlang-complete conda pytest python-pytest wc-mode fira-code-mode writeroom-mode go-guru go-mode cargo rust-mode centered-window matlab-mode markdown-mode alchemist ess ob-elixir slime elixir-mode ethan-wspace company-erlang hasklig-mode org-ref erlang yaml-mode use-package restclient paradox magit haskell-mode gnuplot-mode gnuplot counsel company cmake-mode))
 '(paradox-automatically-star nil)
 '(paradox-github-token t)
 '(which-function-mode nil))

;; (use-package hasklig-mode
;;   :hook (haskell-mode erlang-mode elixir-mode))

;; (load-file "~/.emacs.d/fira-setup.el")
;; (add-hook 'elixir-mode-hook  #'fira-code-mode)
;; (add-hook 'erlang-mode-hook  #'fira-code-mode)
;; (add-hook 'haskell-mode-hook #'fira-code-mode)

(add-hook 'haskell-mode-hook #'hasklig-mode)
(add-hook 'elixir-mode-hook  #'hasklig-mode)
(add-hook 'erlang-mode-hook  #'hasklig-mode)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit default :stipple nil :background "gray24" :foreground "light gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 109 :width normal :foundry "ADBO" :family "Hasklig"))))
;;  '(markdown-header-face ((t (:foreground "medium sea green" :underline t :weight normal))))
;;  '(markdown-italic-face ((t (:slant italic))))
;;  '(markdown-markup-face ((t (:foreground "SteelBlue1" :slant normal :weight normal)))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(line-number ((t (:inherit (shadow default) :background "gray25" :foreground "light gray" :slant italic :weight light :family "Hasklig"))))
;;  '(line-number-current-line ((t (:inherit line-number :background "gray36")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(default ((t (:inherit default :height 140))))
 '(line-number ((t (:inherit line-number :height 0.8)))))
