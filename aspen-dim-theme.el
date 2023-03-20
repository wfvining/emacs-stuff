(deftheme aspen-dim
  "Created 2023-03-04.")

(custom-theme-set-variables
 'aspen-dim
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(which-function-mode nil))

(custom-theme-set-faces
 'aspen-dim
 '(line-number ((t (:inherit line-number :height 0.8))))
 '(font-lock-variable-name-face ((t (:inherit default :foreground "SlateGray3"))))
 '(font-lock-string-face ((t (:inherit default :foreground "CadetBlue" :slant italic))))
 '(font-lock-comment-face ((t (:inherit default :foreground "AntiqueWhite4" :slant italic))))
 '(default ((t (:inherit default :extend nil :stipple nil :background "gray23" :foreground "ivory3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 158 :width normal :foundry "UKWN" :family "Victor Mono"))))
 '(font-lock-constant-face ((t (:inherit font-lock-variable-name-face :foreground "snow1" :slant normal :weight bold))))
 '(font-lock-keyword-face ((t (:inherit default :foreground "white"))))
 '(font-lock-preprocessor-face ((t (:inherit default :foreground "darkseagreen2" :slant italic :weight normal))))
 '(font-lock-type-face ((t (:inherit default :foreground "PaleTurquoise2" :weight normal))))
 '(font-lock-function-name-face ((t (:inherit default :foreground "thistle2"))))
 '(erlang-font-lock-exported-function-name-face ((t (:inherit font-lock-function-name-face))))
 '(shadow ((t (:foreground "snow4"))))
 '(error ((t (:foreground "brown3" :weight bold)))))

(provide-theme 'aspen-dim)
