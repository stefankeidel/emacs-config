(use-package dired
  ;; TIP: use ( to hide file information
  :ensure nil
  :custom ((dired-listing-switches "-aglho --group-directories-first"))
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :hook
  (dired-mode . all-the-icons-dired-mode)
  )

(use-package dired-single
  :ensure t)

(use-package all-the-icons-dired
  :ensure t)

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode)))
