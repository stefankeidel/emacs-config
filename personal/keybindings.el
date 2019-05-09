(key-chord-define-global "jj" 'projectile-find-file)
(key-chord-define-global "jk" 'projectile-ag)
(key-chord-define-global "zz" 'avy-goto-char)
(key-chord-define-global "xx" 'avy-goto-line)

(global-set-key (kbd "s-.") 'mc/mark-next-like-this)
(global-set-key (kbd "s-d") 'mc/mark-all-like-this)
(global-set-key (kbd "s-,") 'easy-mark)
(global-set-key (kbd "C-c c") 'counsel-org-capture)

(global-set-key (kbd "C-x w") 'elfeed)
(global-unset-key (kbd "C-c w")) ; this usually does the super/cmd/whatever switch. kept hitting it by accident when trying to open elfeeds ;-)
