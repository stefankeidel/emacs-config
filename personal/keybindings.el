(key-chord-define-global "jj" 'projectile-find-file)
(key-chord-define-global "jk" 'projectile-ag)
(key-chord-define-global "zz" 'avy-goto-char)
(key-chord-define-global "xx" 'avy-goto-line)

(global-set-key (kbd "s-.") 'mc/mark-next-like-this)
(global-set-key (kbd "s-d") 'mc/mark-all-like-this)
(global-set-key (kbd "s-,") 'easy-mark)
(global-set-key (kbd "C-c c") 'counsel-org-capture)
