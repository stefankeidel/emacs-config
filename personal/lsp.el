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
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))  ; or 

(use-package lsp-ui
  :ensure t
  :config (setq lsp-ui-sideline-show-hover t
                lsp-ui-sideline-delay 0.5
                lsp-ui-doc-delay 5
                lsp-ui-sideline-ignore-duplicates t
                lsp-ui-doc-position 'bottom
                lsp-ui-doc-alignment 'frame
                lsp-ui-doc-header nil
                lsp-ui-doc-include-signature t
                lsp-ui-doc-use-childframe t))

;; if you are ivy user
(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

;; \
;; (use-package poetry
;;   :hook
;;   (python-mode . (lambda () (when (poetry-venv-exist-p)
;;                               (setq-local lsp-pyls-server-command '("poetry" "run" "pyls"))
;;                               (poetry-venv-workon))))
;;   )
