(defun idagio-dbt-test ()
  "Run dbt test"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-dbt/"))
    (async-shell-command "dbt test")))

(defun idagio-dbt-run ()
  "Run dbt"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-dbt/"))
    (async-shell-command "dbt run")))

(defun idagio-dbt-run-models-interactive (model)
  "Run dbt with model selection entered by user"
  (interactive "sEnter model selection:")

  (let ((default-directory "~/Documents/idagio/idagio-dbt/"))
    (async-shell-command
     (format "dbt run --models %s"
             (shell-quote-argument model)))))

(defun idagio-dbt-run-models-downstream ()
  "Run dbt with everything downstream from the current buffer (including the current one)"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-dbt/"))
    (async-shell-command
     (format "dbt run --models %s+"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))

(defun idagio-dbt-run-models-lineage ()
  "Run dbt with the entire lineage from the current buffer (including the current one)"
  (interactive)

  (let ((default-directory "~/Documents/idagio/idagio-dbt/"))
    (async-shell-command
     (format "dbt run --models +%s+"
             (shell-quote-argument (file-name-base (buffer-file-name)))))))


(defun kill-buffer-basename ()
  "Kill buffer basename"
  (interactive)
  (kill-new (file-name-base (buffer-file-name))))
