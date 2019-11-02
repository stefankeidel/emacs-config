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
