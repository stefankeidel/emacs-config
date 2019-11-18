(exec-path-from-shell-copy-env "DBT_PROFILES_DIR")
(exec-path-from-shell-copy-env "REDSHIFT_HOST")
(exec-path-from-shell-copy-env "REDSHIFT_PORT")
(exec-path-from-shell-copy-env "REDSHIFT_USER")
(exec-path-from-shell-copy-env "REDSHIFT_PASSWORD")
(exec-path-from-shell-copy-env "REDSHIFT_DATABASE")
(exec-path-from-shell-copy-env "DBT_DEV_SCHEMA")

(defun idagio-dbt-test ()
  "Run dbt test"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/dbt/"))
    (async-shell-command "dbt test")))

(defun idagio-dbt-run ()
  "Run dbt"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/dbt/"))
    (async-shell-command "dbt run")))

(defun idagio-dbt-compile ()
  "Run dbt"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/dbt/"))
    (async-shell-command "dbt compile")))

(defun idagio-dbt-run-models-interactive (model)
  "Run dbt with model selection entered by user"
  (interactive "sEnter model selection:")

  (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/dbt/"))
    (async-shell-command
     (format "dbt run --models %s"
             (shell-quote-argument model)))))

(defun idagio-dbt-run-models-downstream ()
  "Run dbt with everything downstream from the current buffer (including the current one)"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/dbt/"))
    (async-shell-command
     (format "dbt run --models %s+"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))

(defun idagio-dbt-run-models-lineage ()
  "Run dbt with the entire lineage from the current buffer (including the current one)"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/dbt/"))
    (async-shell-command
     (format "dbt run --models +%s+"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))

(defun kill-buffer-basename ()
  "Kill buffer basename"
  (interactive)
  (kill-new (file-name-base (buffer-file-name))))
