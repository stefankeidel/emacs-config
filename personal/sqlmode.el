;;; FROM https://stackoverflow.com/questions/5734965/how-can-i-get-emacs-sql-mode-to-use-the-mysql-config-file-my-cnf/46114944#46114944

(require 'sql)
(require 'ob-sql-mode)

; .pgpass parser
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
                           (concat db)
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

(setq org-confirm-babel-evaluate
      (lambda (lang body)
        (not (string= lang "sql"))))

;(setq explicit-shell-file-name "/usr/bin/zsh")
;(exec-path-from-shell-copy-env "ANALYTICS_REDSHIFT_DWH_DB")

;; (defun idagio-run-on-redshift ()
;;   "run the file of the current buffer on Redshift"
;;   (interactive)
;;   (async-shell-command
;;    (format "psql %s -v ON_ERROR_STOP=1 --single-transaction --file=%s"
;;            (shell-quote-argument (getenv "ANALYTICS_REDSHIFT_DWH_DB"))
;;            (shell-quote-argument (buffer-file-name)))))

;; (require 'ejc-sql)
;; (exec-path-from-shell-copy-env "SNOWFLAKE_ACCOUNT")
;; (exec-path-from-shell-copy-env "SNOWFLAKE_DATABASE")
;; (exec-path-from-shell-copy-env "SNOWFLAKE_USER")
;; (exec-path-from-shell-copy-env "SNOWFLAKE_PASSWORD")
;; (exec-path-from-shell-copy-env "SNOWFLAKE_WAREHOUSE")
;; (exec-path-from-shell-copy-env "SNOWFLAKE_ROLE")

;; (ejc-create-connection
;;  "snowflake"
;;  :classpath (concat "/home/stefan/.m2/repository/snowflake/snowflake-jdbc/3.13.4/"
;;                     "snowflake-jdbc-3.13.4.jar")
;;  :classname "net.snowflake.client.jdbc.SnowflakeDriver"
;;  :dbtype "snowflake"
;;  :connection-uri (format "jdbc:snowflake://%s.snowflakecomputing.com/?db=%s&user=%s&password=%s&warehouse=%s"
;;                          (getenv "SNOWFLAKE_ACCOUNT")
;;                          (getenv "SNOWFLAKE_DATABASE")
;;                          (getenv "SNOWFLAKE_USER")
;;                          (getenv "SNOWFLAKE_PASSWORD")
;;                          (getenv "SNOWFLAKE_WAREHOUSE"))
;;  )

;; (setq whitespace-global-modes '(not org-mode))
;; (setq prelude-whitespace nil)
;; (setq nrepl-sync-request-timeout 60
;;       ejc-connection-validate-timeout 60)


;; (setq ejc-result-table-impl 'orgtbl-mode)
;; (add-hook 'ejc-sql-connected-hook
;;           (lambda ()
;;             (ejc-set-fetch-size 200)
;;             (ejc-set-max-rows 200)
;;             (ejc-set-show-too-many-rows-message t)
;;             (ejc-set-column-width-limit 150)
;;             ))

;; (defun lichtblick-sqlfluff-fix-buffer-model ()
;;   "Attempt to fix current model"
;;   (interactive)

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command
;;      (format "sqlfluff fix --config ../.sqlfluff --force %s"
;;              (shell-quote-argument (buffer-file-name))))))
