(exec-path-from-shell-copy-env "DBT_PROFILES_DIR")
;; (exec-path-from-shell-copy-env "REDSHIFT_HOST")
;; (exec-path-from-shell-copy-env "REDSHIFT_PORT")
;; (exec-path-from-shell-copy-env "REDSHIFT_USER")
;; (exec-path-from-shell-copy-env "REDSHIFT_PASSWORD")
;; (exec-path-from-shell-copy-env "REDSHIFT_DATABASE")
(exec-path-from-shell-copy-env "DBT_DEV_SCHEMA")
;; (exec-path-from-shell-copy-env "IDAGIO_CONFIG_FILENAME")

(defun lichtblick-dbt-test ()
  "Run dbt test"
  (interactive)

  (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
    (async-shell-command "dbt test")))

(defun lichtblick-dbt-run ()
  "Run dbt"
  (interactive)

  (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
    (async-shell-command "dbt run")))

(defun lichtblick-dbt-clean-compile ()
  "Clean+compile dbt"
  (interactive)

  (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
    (async-shell-command "dbt clean && dbt deps && dbt compile")))

(defun lichtblick-dbt-run-models-interactive (model)
  "Run dbt with model selection entered by user"
  (interactive "sEnter model selection:")

  (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
    (async-shell-command
     (format "dbt run --models %s"
             (shell-quote-argument model)))))

(defun lichtblick-dbt-run-models-downstream ()
  "Run dbt with everything downstream from the current buffer (including the current one)"
  (interactive)

  (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
    (async-shell-command
     (format "dbt run --models %s+"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))

(defun lichtblick-dbt-run-model ()
  "Run dbt with model from the current buffer"
  (interactive)

  (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
    (async-shell-command
     (format "dbt run --models %s"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))

(defun lichtblick-dbt-run-models-lineage ()
  "Run dbt with the entire lineage from the current buffer (including the current one)"
  (interactive)

  (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
    (async-shell-command
     (format "dbt run --models +%s+"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))

(defun lichtblick-dbt-test-model ()
  "Run all model tests for model defined by current buffer"
  (interactive)

  (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
    (async-shell-command
     (format "dbt test --models %s"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))

(defun kill-buffer-basename ()
  "Kill buffer basename"
  (interactive)
  (kill-new (file-name-base (buffer-file-name))))


(defun lichtblick-dbt-search-model ()
  "Search for model name, as defined by basename of current file"
  (interactive)

  (projectile-ag (file-name-base (buffer-file-name))))


(defun lichtblick-dbt-find-compiled ()
  "Search for model name, as defined by basename of current file"
  (interactive)

  (find-name-dired
   "~/Documents/lichtblick/cloud_dwh/dbt/target/compiled/lichtblick_snowflake_dwh/"
   (concat (file-name-base (buffer-file-name)) ".sql")))

;; (defun lichtblick-dbt-compile-production ()
;;   "Compile dbt for production"
;;   (interactive)

;;   (let ((default-directory "~/Documents/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command "dbt compile --target prod")))

;; (defun lichtblick-export-query-results-csv ()
;;   "Export results from query as defined by current file"
;;   (interactive)

;;   (make-temp-file "idagio-export-csv")
;;   (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/")
;;         (tmpf (make-temp-file "idagio-export-csv")))
;;     (shell-command
;;      (format "python utils/sql2csv.py --query %s --outfile %s"
;;              (shell-quote-argument (buffer-file-name))
;;              tmpf))
;;     (find-file-other-window tmpf)))

(defun stefan-schreibt-deutsch ()
  (interactive)
  (setq ns-alternate-modifier 'none ns-right-alternate-modifier 'meta)
  )

(defun stefan-braucht-meta-key ()
  (interactive)
  (setq ns-alternate-modifier 'meta ns-right-alternate-modifier 'none)
  )
