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

;; (require 'doom-modeline)
;; (doom-modeline-mode 1)

;; (setq doom-modeline-buffer-file-name-style 'file-name)

(set-face-background 'mode-line          "#4466aa")
(set-face-background 'mode-line-inactive "#99aaff")
(set-face-background 'region             "#797979")
;(set-face-background 'fringe "#809088")


;; start every frame maximized
;(toggle-frame-fullscreen)

(nyan-mode)

(use-package perspective
  :ensure t
  :bind
  ("s-e" . persp-ivy-switch-buffer)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "s-x"))  ; pick your own prefix key here
  :init
  (persp-mode))
