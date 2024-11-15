(setq read-process-output-max (* 4096 1024)) ;; 1mb

;; (use-package lsp-mode
;;   :ensure t
;;   :config
;;   (lsp-register-custom-settings
;;    '(("pyls.plugins.pyls_mypy.enabled" t t)
;;      ("pyls.plugins.pyls_mypy.live_mode" nil t)
;;      ("pyls.plugins.pyls_black.enabled" t t)
;;      ("pyls.plugins.pyls_isort.enabled" t t)
;;      ("pyls.plugins.flake8.enabled" t t)))
;;   (setq lsp-pylsp-server-command "/Users/stefan.keidel/anaconda3/bin/pylsp")
;;   :hook
;;   ((python-mode . lsp)))


(use-package lsp-pyright
  :ensure t
  :hook (python-ts-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)))
  ;; :custom
  ;;   (lsp-pyright-python-executable-cmd "python3")
  ;;   (lsp-pyright-venv-path "~/.cache/pypoetry/virtualenvs/"))
  )

(use-package lsp-ui
  :ensure t
  :config (setq lsp-ui-sideline-show-hover t
                lsp-ui-sideline-delay 0.5
                lsp-ui-doc-delay 0.5
                lsp-ui-doc-max-height 40
                lsp-ui-doc-show-with-cursor t
                lsp-ui-doc-position 'at-point
                lsp-ui-doc-alignment 'frame
                lsp-ui-doc-header nil
                lsp-ui-doc-include-signature t
                lsp-ui-peek-enable t
                lsp-ui-peek-show-directory t
                lsp-ui-doc-use-childframe t))

;; if you are ivy user
(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

;; peek
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;; (use-package poetry
;;   :hook
;;   (python-mode . (lambda () (when (poetry-venv-exist-p)
;;                               (setq-local lsp-pyls-server-command '("poetry" "run" "pyls"))
;;                               (poetry-venv-workon))))
;;   )

(setq lsp-disabled-clients '(tfls))
(setq lsp-terraform-ls-enable-show-reference t)
;(setq lsp-disabled-clients '(tfls semgrep-ls))
;(setq lsp-terraform-server (expand-file-name "/etc/profiles/per-user/stefan.keidel@lichtblick.de/bin/terraform-lsp"))
(add-hook 'terraform-mode-hook #'lsp)

