(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)


(use-package copilot
  :quelpa (copilot :fetcher github
                   :repo "copilot-emacs/copilot.el"
                   :branch "main"
                   :files ("dist" "*.el"))
  :config
  (add-to-list 'copilot-indentation-alist '(prog-mode 0))
  (add-to-list 'copilot-indentation-alist '(python-ts-mode 0))
  (add-to-list 'copilot-indentation-alist '(lisp-mode 2))
)

;; you can utilize :map :hook and :config to customize copilot
(add-hook 'prog-mode-hook 'copilot-mode)
