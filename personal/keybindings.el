;(key-chord-mode -1)
;; (key-chord-define-global "jj" 'projectile-find-file)
;; (key-chord-define-global "jk" 'projectile-ag)
;; (key-chord-define-global "zz" 'avy-goto-char)
;; (key-chord-define-global "xx" 'avy-goto-line)

(global-set-key (kbd "s-.") 'mc/mark-next-like-this)
(global-set-key (kbd "s-d") 'mc/mark-all-like-this)
(global-set-key (kbd "s-,") 'easy-mark)
(global-set-key (kbd "s-f") 'projectile-ag)
(global-set-key (kbd "s-z") 'avy-goto-char)

(global-set-key (kbd "C-c c") 'counsel-org-capture)

(global-set-key (kbd "C-x w") 'elfeed)
(global-unset-key (kbd "C-c w")) ; this usually does the super/cmd/whatever switch. kept hitting it by accident when trying to open elfeeds ;-)

(global-set-key (kbd "s-e") 'ivy-switch-buffer)

(setq smerge-command-prefix "\C-cv")

(global-set-key (kbd "s-i s") 'lichtblick-dbt-search-model)
(global-set-key (kbd "s-i c") 'lichtblick-dbt-compile-production)
(global-set-key (kbd "s-i r") 'lichtblick-dbt-run-model)
(global-set-key (kbd "s-i t") 'lichtblick-dbt-test-model)
(global-set-key (kbd "s-i f") 'lichtblick-dbt-find-compiled)
(global-set-key (kbd "s-i d") 'lichtblick-dbt-run-models-downstream)
(global-set-key (kbd "s-i p") 'treemacs)
(global-set-key (kbd "s-i k") 'kill-buffer-basename)

; instead of ace-window in default prelude, which I use through C-x o -- this will cycle through windows
(global-set-key (kbd "s-w") 'next-multiframe-window)

; use kill ring browser by default
(global-set-key (kbd "M-y") 'browse-kill-ring)
