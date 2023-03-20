(deftheme updated-aspen-dim
  "Created 2023-03-10.")

(custom-theme-set-variables
 'updated-aspen-dim
 '(custom-safe-themes '("5dc81c389eca34b59265e4ed2f6fe51f611a117ecb6d41b971142537713fbf17" "74783cbd94da768d1c21a464c99c95019d916e850fe8cf4dd498f82ed4b845c5" "4b6d236309ccc1639694f05e2fc77f9ba5ccfbe19829c25f5dbb66c8f94fb780" "cab8fa3a50d6cb8d6b1ef5f0361bc7bb81b86b8bf07c6ef96bf4da9164290764" "dc92140eef55cb06cf61a50e75bd518ab787d10560f80f27eabc83b1764af86b" "704359b9e6f2b17373a0bba8e9114822d4936511a86adfb49af92f9fd17d13dc" "80cc795c1a741290b22bd0d0814fb715a5ede6dc879bda6fb1b4d4bbcd228056" "82821dfff1083673ef25c4152514d6a2a038672a18aa473fe2c83386aae2ce91" "a752b0b5dd583517745d6ee5793bcd6c249d53dbdb6d015b11b18db075f18832" "77c450cceca9d9a0f5f1389e2b62e9f634f78957385ffc308d3c2c72983752f4" "e496f0a63c251a8f0f1b9327f16e3cbd4640c39b99e56b0e79b5186a587c47d7" "bc0f5e734a1c6e82842693fd2c3656ccf83d9d18470d02b9ea5a80c387190aea" default))
 '(custom-theme-directory "~/.emacs.d/")
 '(org-agenda-files nil)
 '(package-selected-packages '(company smartparens dash dap-mode lsp-treemacs helm-lsp lsp-ivy flycheck helm which-key lsp-origami lsp-ui yasnippet lsp-mode ivy-erlang-complete conda pytest python-pytest wc-mode fira-code-mode writeroom-mode go-guru go-mode cargo rust-mode centered-window matlab-mode markdown-mode ess ob-elixir slime elixir-mode ethan-wspace hasklig-mode org-ref erlang yaml-mode use-package restclient paradox magit haskell-mode gnuplot-mode gnuplot counsel cmake-mode))
 '(paradox-automatically-star nil)
 '(paradox-github-token t))

(custom-theme-set-faces
 'updated-aspen-dim
 '(line-number ((t (:inherit line-number :height 0.8))))
 '(font-lock-variable-name-face ((t (:inherit default :foreground "SlateGray3"))))
 '(font-lock-string-face ((t (:inherit default :foreground "CadetBlue" :slant italic))))
 '(font-lock-comment-face ((t (:inherit default :foreground "AntiqueWhite4" :slant italic))))
 '(default ((t (:family "Victor Mono" :foundry "UKWN" :width normal :height 158 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "ivory3" :background "gray23" :stipple nil :extend nil :inherit default))))
 '(font-lock-constant-face ((t (:inherit font-lock-variable-name-face :foreground "snow1" :slant normal :weight bold))))
 '(font-lock-keyword-face ((t (:inherit default :foreground "white"))))
 '(font-lock-preprocessor-face ((t (:inherit default :foreground "darkseagreen2" :slant italic :weight normal))))
 '(font-lock-type-face ((t (:inherit default :foreground "PaleTurquoise2" :weight normal))))
 '(font-lock-function-name-face ((t (:inherit default :foreground "thistle2"))))
 '(erlang-font-lock-exported-function-name-face ((t (:inherit font-lock-function-name-face))))
 '(shadow ((t (:foreground "snow4"))))
 '(flycheck-error ((t (:underline (:color "tomato" :style wave)))))
 '(flycheck-warning ((t (:underline (:color "DarkGoldenrod1" :style wave)))))
 '(flycheck-fringe-error ((t (:foreground "tomato"))))
 '(org-level-1 ((t (:inherit outline-1 :extend nil)))))

(provide-theme 'updated-aspen-dim)
