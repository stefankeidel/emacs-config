;; elpy
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-python-command "/opt/anaconda3/bin/python")

(setq python-shell-interpreter "/opt/anaconda3/bin/ipython"
      python-shell-interpreter-args "-i --simple-prompt")
