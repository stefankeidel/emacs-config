;; elpy
;; (elpy-enable)
;; (setq elpy-rpc-backend "jedi")
;; (setq elpy-rpc-python-command "/Users/stefan.keidel/anaconda3/bin/python")

;; (setq python-shell-interpreter "/Users/stefan.keidel/anaconda3/bin/ipython"
;;       python-shell-interpreter-args "-i --simple-prompt")

(use-package conda :ensure t)

(custom-set-variables
 '(conda-anaconda-home "/Users/stefan.keidel/anaconda3"))

(setq flycheck-global-modes '(not python-mode))
