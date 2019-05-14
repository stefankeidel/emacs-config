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
                    :family "Hack Nerd Font" :height 155)

;; (require 'doom-modeline)
;; (doom-modeline-mode 1)

;; (setq doom-modeline-buffer-file-name-style 'file-name)
(setq ivy-initial-inputs-alist '((counsel-package . "^+ ")
                                 (org-refile . "")
                                 (org-agenda-refile . "")
                                 (org-capture-refile . "")
                                 (counsel-M-x . "")
                                 (counsel-describe-function . "")
                                 (counsel-describe-variable . "")
                                 (counsel-org-capture . "")
                                 (Man-completion-table . "")
                                 (woman . "^")))

(set-face-background 'mode-line          "#4466aa")
(set-face-background 'mode-line-inactive "#99aaff")
;(set-face-background 'fringe "#809088")

(nyan-mode)
