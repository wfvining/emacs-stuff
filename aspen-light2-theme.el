(deftheme aspen-light2
  "Created 2021-11-20.")

(custom-theme-set-variables
 'aspen-light2
 '(custom-theme-directory "~/.emacs.d/")
 '(org-agenda-files '("~/ai/term-paper.org" "~/org/dissertation-proposal.org" "~/org/research-journal.org" "~/org/tasks.org"))
 '(paradox-automatically-star nil)
 '(paradox-github-token t)
 '(which-function-mode nil)
 '(package-selected-packages '(alect-themes dash dap-mode lsp-treemacs helm-lsp lsp-ivy flycheck helm which-key lsp-origami lsp-ui yasnippet lsp-mode ivy-erlang-complete conda pytest python-pytest wc-mode fira-code-mode writeroom-mode go-guru go-mode cargo rust-mode centered-window matlab-mode markdown-mode alchemist ess ob-elixir slime elixir-mode ethan-wspace company-erlang hasklig-mode org-ref erlang yaml-mode use-package restclient paradox magit haskell-mode gnuplot-mode gnuplot counsel company cmake-mode))
 '(custom-safe-themes '("ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "80cc795c1a741290b22bd0d0814fb715a5ede6dc879bda6fb1b4d4bbcd228056" "82821dfff1083673ef25c4152514d6a2a038672a18aa473fe2c83386aae2ce91" "a752b0b5dd583517745d6ee5793bcd6c249d53dbdb6d015b11b18db075f18832" "77c450cceca9d9a0f5f1389e2b62e9f634f78957385ffc308d3c2c72983752f4" "e496f0a63c251a8f0f1b9327f16e3cbd4640c39b99e56b0e79b5186a587c47d7" "bc0f5e734a1c6e82842693fd2c3656ccf83d9d18470d02b9ea5a80c387190aea" default))
 '(yas-global-mode t))

(custom-theme-set-faces
 'aspen-light2
 '(default ((t (:inherit default :extend nil :stipple nil :background "snow" :foreground "gray34" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal))))
 '(highlight ((t (:background "white smoke"))))
 '(line-number ((t (:inherit (shadow default) :background "light gray" :foreground "dim gray" :slant italic :weight light :family "Hasklig"))))
 '(line-number-current-line ((t (:inherit line-number :background "light slate gray" :foreground "SlateGray2"))))
 '(font-lock-preprocessor-face ((t (:inherit default :foreground "dark slate gray" :slant oblique :weight normal))))
 '(font-lock-variable-name-face ((t (:inherit default :foreground "bisque4"))))
 '(font-lock-function-name-face ((t (:inherit default :foreground "SkyBlue4" :slant normal :weight normal))))
 '(font-lock-type-face ((t (:inherit default :foreground "CadetBlue4" :weight normal))))
 '(font-lock-builtin-face ((t (:inherit default :foreground "CadetBlue4"))))
 '(font-lock-keyword-face ((t (:foreground "orange3"))))
 '(font-lock-comment-face ((t (:inherit default :foreground "MistyRose3" :slant italic))))
 '(org-level-2 ((t (:inherit outline-3 :extend nil))))
 '(org-level-3 ((t (:inherit outline-2 :extend nil))))
 '(org-todo ((t (:foreground "dark red" :weight light))))
 '(org-done ((t (:foreground "PaleGreen4" :weight light))))
 '(region ((t (:background "linen" :distant-foreground "gtk_selection_fg_color")))))

(provide-theme 'aspen-light2)
