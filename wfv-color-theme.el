(deftheme wfv-color
  "Created 2017-04-16.")

(custom-theme-set-variables
 'wfv-color
 )

(custom-theme-set-faces
 'wfv-color
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
 '(org-list-dt ((t (:foreground "DeepSkyBlue1"))))
 '(org-tag ((t (:foreground "grey17" :slant italic :weight normal))))
 '(region ((t (:background "slate grey"))))
 '(shadow ((t (:foreground "grey16"))))
 '(show-paren-match ((t (:background "gold" :foreground "black"))))
 '(show-paren-mismatch ((t (:background "deep pink" :foreground "gray18"))))
 '(org-verbatim ((t (:foreground "white" :slant italic :family "Luxi Mono"))))
 '(org-block ((t (:inherit org-verbatim :slant normal))))
 '(hl-line ((t (:background "gray26"))))
 '(which-func ((t (:foreground "maroon3"))))
 '(org-done ((t (:foreground "#8ae234"))))
 '(org-level-4 ((t (:inherit outline-7))))
 '(org-level-7 ((t (:inherit outline-4))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "MediumOrchid1"))))
 '(org-todo ((t (:foreground "Maroon2"))))
 '(font-lock-type-face ((nil (:inherit default :foreground "#8ae234" :weight normal))))
 '(font-lock-builtin-face ((nil (:inherit font-lock-type-face :weight normal))))
 '(font-lock-comment-face ((nil (:inherit default :foreground "gainsboro" :slant italic))))
 '(font-lock-string-face ((nil (:inherit default :foreground "#34e4ea" :slant italic))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:inherit default :foreground "#db2763" :weight bold))))
 '(font-lock-constant-face ((t (:inherit font-lock-variable-name-face :foreground "white" :slant normal))))
 '(font-lock-doc-face ((t (:inherit default :foreground "gray65" :slant italic))))
 '(font-lock-function-name-face ((t (:inherit default :foreground "MediumOrchid1" :slant normal))))
 '(font-lock-keyword-face ((t (:inherit default :foreground "white"))))
 '(font-lock-preprocessor-face ((t (:inherit default :foreground "#fdca40" :weight normal))))
 '(font-lock-variable-name-face ((t (:inherit default :foreground "DeepSkyBlue1"))))
 '(default ((t (:inherit nil :stipple nil :background "#464646" :foreground "gray70" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "simp" :family "Hasklig")))))

(provide-theme 'wfv-color)
