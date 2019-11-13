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

(defun idagio-dbt-run-models-interactive (model)
  "Run dbt with model selection entered by user"
  (interactive "sEnter model selection:")

  (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/dbt/"))
    (async-shell-command
     (format "dbt run --models %s"
             (shell-quote-argument model)))))

(defun idagio-dbt-run-models-dag-current-buffer ()
  "Run dbt with model selection entered by user"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-analytics-scripts/dbt/"))
    (async-shell-command
     (format "dbt run --models +%s+"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))
