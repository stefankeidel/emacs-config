;(setq projectile-indexing-method 'alien)
;(setq projectile-enable-caching t)
;(setq prelude-theme 'zenburn)
;(setq prelude-theme 'solarized-dark)

(setq solarized-termcolors 256)
(setq solarized-broken-srgb t)
(setq solarized-scale-org-headlines nil)
(setq solarized-distinct-fringe-background t)
(setq projectile-mode-line "Projectile")
(setq prelude-minimalistic-ui t)


;(set-face-attribute 'vterm-color-black nil :background nil :foreground nil :inherit 'term-color-black)
;(set-face-attribute 'vterm-color-red nil :background nil :foreground nil :inherit 'term-color-red)
;(set-face-attribute 'vterm-color-green nil :background nil :foreground nil :inherit 'term-color-green)
;(set-face-attribute 'vterm-color-yellow nil :background nil :foreground nil :inherit 'term-color-yellow)
;(set-face-attribute 'vterm-color-blue nil :background nil :foreground nil :inherit 'term-color-blue)
;(set-face-attribute 'vterm-color-magenta nil :background nil :foreground nil :inherit 'term-color-magenta)
;(set-face-attribute 'vterm-color-cyan nil :background nil :foreground nil :inherit 'term-color-cyan)
;(set-face-attribute 'vterm-color-white nil :background nil :foreground nil :inherit 'term-color-white)

;;maybe need after  (require 'term)
;(set-face-attribute 'vterm-color-default nil :background nil :foreground nil :inherit 'term)

(require 'spaceline-config)
(spaceline-emacs-theme)
(spaceline-toggle-minor-modes-off)
(spaceline-toggle-battery-on)


;(setq prelude-theme 'base16-zenburn)

;(require 'doom-themes)

;; Global settings (defaults)
;(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;(load-theme 'doom-spacegrey t)
;(setq prelude-theme 'doom-spacegrey)

;; Enable flashing mode-line on errors
;(doom-themes-visual-bell-config)

; Enable custom neotree theme (all-the-icons must be installed!)
; (doom-themes-neotree-config)
;; or for treemacs users
; (doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
;(doom-themes-org-config)

                                        ; todo: install these automatically
;; german-holidays
;; elfeed
;; nyan-mode
;; visual-regexp-steroids
;; smex
;; ejc-sql
;; ob-http
;; ein
;; use-package
;; plantuml-mode
(use-package use-package-chords
  :ensure t)
