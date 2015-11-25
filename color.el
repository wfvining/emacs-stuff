;; The Best Emacs Color Scheme Ever.
;; by Will Vining, evolved from something I found on the internet
;; several years ago...
;; This is probably not the _right_ way to define a color scheme in 
;; emacs, but it seems to work.
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil 
                :stipple nil 
                :background "#464646"
                :foreground "#adadad"
                :inverse-video nil 
                :box nil
                :strike-through nil 
                :overline nil 
                :underline nil 
                :slant normal 
                :weight normal 
;                :height 90 ; If the font is way too small, this is why.
                           ; comment out for the default font size.
                           ; or tweak it to make it look right.
;                :width normal 
;                :foundry "bitstream" 
;                :family "Bitstream Vera Sans Mono"
                ))))
 '(font-lock-type-face ((nil (:inherit default 
                              :foreground "#8ae234" 
                              :weight bold))))
 '(font-lock-builtin-face ((nil (:inherit font-lock-type-face 
                                 :weight normal))))
 '(font-lock-comment-face ((nil (:inherit default 
                                 :foreground "#888a85" 
                                 :slant italic))))
 '(font-lock-constant-face ((nil (:inherit font-lock-variable-name-face
                                  :slant normal))))
 '(font-lock-doc-face ((t (:inherit default
                           :foreground "#fdca40"
                           :slant italic))))
 '(font-lock-function-name-face ((nil (:inherit default 
				       ;:foreground "#ff4ccd"
				       :foreground "#00a9e2"
				       ;:weight bold
                                       :slant normal))))
 '(font-lock-keyword-face ((nil (:inherit default 
                                 :foreground "white" 
                                 :weight bold))))
 '(font-lock-preprocessor-face ((t (:inherit default 
				    :foreground "#db2763"
                                    :weight bold))))
 '(font-lock-string-face ((nil (:inherit default
				:foreground "#34e4ea"
				:slant italic))))
 '(font-lock-variable-name-face ((nil (:inherit default
                                       :foreground "white"
                                       :slant italic))))
 '(font-lock-warning-face ((((class color) 
                             (min-colors 88) 
                             (background dark)) 
                            (:inherit default
			     :foreground "#db2763"
                             :weight bold))))
 '(makefile-shell ((t (:foreground "magenta"))) t)
 '(makefile-targets ((t (:inherit font-lock-function-name-face 
                         :foreground "white" 
                         :weight bold)))))

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(defface hl-line '((t (:background "#383838"))) ; was #363636
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default

