(deftheme wfv-gray-nobold
  "Created 2017-03-30.")

(custom-theme-set-variables
 'wfv-gray-nobold
 '(type-break-interval 1200)
 '(electric-pair-mode t)
 '(debug-on-quit t)
 '(which-function-mode t))

(custom-theme-set-faces
 'wfv-gray-nobold
 '(org-done ((t (:foreground "#8ae234"))))
 '(org-level-4 ((t (:inherit outline-7))))
 '(org-level-7 ((t (:inherit outline-4))))
 '(org-todo ((t (:foreground "Maroon2"))))
 '(term-color-blue ((t (:foreground "DeepSkyBlue2"))))
 '(font-lock-type-face ((nil (:inherit default :foreground "#8ae234" :weight normal))))
 '(font-lock-builtin-face ((nil (:inherit font-lock-type-face :weight normal))))
 '(font-lock-comment-face ((nil (:inherit default :foreground "#888a85" :slant italic))))
 '(font-lock-string-face ((nil (:inherit default :foreground "#34e4ea" :slant italic))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:inherit default :foreground "#db2763" :weight bold))))
 '(makefile-shell ((t (:foreground "magenta"))))
 '(font-lock-constant-face ((t (:inherit font-lock-variable-name-face :foreground "white" :slant normal))))
 '(font-lock-doc-face ((t (:inherit default :foreground "gray65" :slant italic))))
 '(font-lock-function-name-face ((t (:inherit default :foreground "Maroon2" :slant normal))))
 '(font-lock-keyword-face ((t (:inherit default :foreground "white"))))
 '(font-lock-preprocessor-face ((t (:inherit default :foreground "#fdca40" :weight normal))))
 '(font-lock-variable-name-face ((t (:inherit default :foreground "DeepSkyBlue1"))))
 '(default ((t (:inherit nil :stipple nil :background "#464646" :foreground "gray70" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo")))))

(provide-theme 'wfv-gray-nobold)
