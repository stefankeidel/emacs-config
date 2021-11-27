(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-stop-list (number-sequence 4 200 4))
(setq-default scroll-step 2)
(setq prelude-flyspell nil)
(setq prelude-guru nil)
(setq-default create-lockfiles nil)
(setq-default whitespace-line-column 120)

(add-to-list 'recentf-exclude "\/var\/folders\/")

;; (require 'smart-forward)
;; (global-set-key (kbd "s-<up>") 'smart-up)
;; (global-set-key (kbd "s-<down>") 'smart-down)
;; (global-set-key (kbd "s-<left>") 'smart-backward)
;; (global-set-key (kbd "s-<right>") 'smart-forward)

(require 'visual-regexp-steroids)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

(setq-default ivy-initial-inputs-alist '((counsel-package . "^+ ")
                                 (org-refile . "")
                                 (org-agenda-refile . "")
                                 (org-capture-refile . "")
                                 (counsel-M-x . "")
                                 (counsel-describe-function . "")
                                 (counsel-describe-variable . "")
                                 (counsel-org-capture . "")
                                 (Man-completion-table . "")
                                 (woman . "^")))

(defun browse-youtube-url (url &optional new-window)
  (start-process "vlc" " *vlc*" "vlc" url))

(setq browse-url-browser-function '(
                                    ("youtube" . browse-youtube-url)
                                    ("." . browse-url-default-browser)))

(setq scroll-conservatively 10) ;; move minimum when cursor exits view, instead of recentering
(setq mouse-wheel-scroll-amount '(1)) ;; mouse scroll moves 1 line at a time, instead of 5 lines
(setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line

(setq auto-window-vscroll nil)

(setq projectile-completion-system 'ivy)
;(setq split-width-threshold 1 )
