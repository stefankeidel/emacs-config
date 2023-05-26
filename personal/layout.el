;; basic layout of window
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; new frame have no scroll bar either
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))

;; font size
;(set-face-attribute 'default nil :height 155)

(set-face-attribute 'default nil
                    :family "Hack Nerd Font" :height 190)

(set-face-attribute 'variable-pitch nil
                    :family "Hack Nerd Font")

(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;; (require 'doom-modeline)
;; (doom-modeline-mode 1)

;; (setq doom-modeline-buffer-file-name-style 'file-name)

;; (set-face-background 'mode-line          "#4466aa")
;; (set-face-background 'mode-line-inactive "#99aaff")
;; (set-face-background 'region             "#797979")

;; start every frame maximized
;(toggle-frame-fullscreen)

(use-package perspective
  :ensure t
  :bind
  ("s-e" . persp-ivy-switch-buffer)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "s-x"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package fancy-battery :ensure t)

(use-package ztree :ensure t)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  ;(setq doom-themes-treemacs-theme "doom-solarized-dark") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(set-face-background 'fringe "#002b36")

(custom-set-faces
  `(fringe ((t (:background nil))))) ; make fringe match the bg
