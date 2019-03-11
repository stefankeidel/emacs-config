;; basic layout of window
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; new frame have no scroll bar either
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))

;; font size
(set-face-attribute 'default nil :height 140)

(require 'doom-modeline)
(doom-modeline-mode 1)

(setq doom-modeline-buffer-file-name-style 'file-name)