;;; FROM https://stackoverflow.com/questions/5734965/how-can-i-get-emacs-sql-mode-to-use-the-mysql-config-file-my-cnf/46114944#46114944

(require 'sql)
;(require 'ob-sql-mode)

;;; .pgpass parser
(defun read-file (file)
  "Returns file as list of lines."
  (with-temp-buffer
    (insert-file-contents file)
    (split-string (buffer-string) "\n" t)))

(defun pgpass-to-sql-connection (config)
  "Returns a suitable list for sql-connection-alist from a pgpass file."
  (append sql-connection-alist
          (let ((server (lambda (host port db user _pass)
                          (list
                           (concat db ":" user ":" port ":" host)
                           (list 'sql-product ''postgres)
                           (list 'sql-server host)
                           (list 'sql-user user)
                           (list 'sql-port (string-to-number port))
                           (list 'sql-database db))))
                (pgpass-line (lambda (line)
                               (apply server (split-string line ":" t)))))
            (mapcar pgpass-line config))))

;;; Actually populating sql-connection-alist
(setq sql-connection-alist (pgpass-to-sql-connection (read-file "~/.pgpass")))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t)))

(setq org-confirm-babel-evaluate
      (lambda (lang body)
        (not (string= lang "sql"))))
