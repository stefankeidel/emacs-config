;; elpy
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-python-command "/home/stefan/anaconda3/bin/python")

(setq python-shell-interpreter "/home/stefan/anaconda3/bin/ipython"
      python-shell-interpreter-args "-i --simple-prompt")
