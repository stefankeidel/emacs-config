(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package copilot
  :quelpa (copilot :fetcher github
                   :repo "copilot-emacs/copilot.el"
                   :branch "main"
                   :files ("dist" "*.el"))
  :config
  (setq copilot-indent-offset-warning-disable t)
  (add-to-list 'copilot-indentation-alist '(python-ts-mode . 0))
  (add-to-list 'copilot-indentation-alist '(python-mode . 0))
)


;; you can utilize :map :hook and :config to customize copilot
(add-hook 'prog-mode-hook 'copilot-mode)

;; (use-package gptel
;;   :defer t
;;   :hook ((gptel-mode . (lambda () (visual-line-mode 1)))
;;          (gptel-mode . (lambda () (auto-fill-mode 0))))
;;   :config
;;   (setq gptel-backend (gptel-make-ollama "codellama:13b-python"
;;                         :host "localhost:11434"
;;                         :stream t
;;                         :models '("codellama:13b-python"))))
