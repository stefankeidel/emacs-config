;(exec-path-from-shell-copy-env "DBT_PROFILES_DIR")
;(exec-path-from-shell-copy-env "DBT_DEV_SCHEMA")
;(exec-path-from-shell-copy-env "LICHTBLICK_RAW_DATABASE_NAME")

;; (defun lichtblick-dbt-test ()
;;   "Run dbt test"
;;   (interactive)

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command "dbt test")))

;; (defun lichtblick-dbt-run ()
;;   "Run dbt"
;;   (interactive)

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command "dbt run")))

;; (defun lichtblick-dbt-clean-compile ()
;;   "Clean+compile dbt"
;;   (interactive)

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command "dbt clean && dbt deps && dbt compile")))

;; (defun lichtblick-dbt-run-models-interactive (model)
;;   "Run dbt with model selection entered by user"
;;   (interactive "sEnter model selection:")

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command
;;      (format "dbt run --models %s"
;;              (shell-quote-argument model)))))

;; (defun lichtblick-dbt-run-models-downstream ()
;;   "Run dbt with everything downstream from the current buffer (including the current one)"
;;   (interactive)

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command
;;      (format "dbt run --models %s+"
;;              (shell-quote-argument (file-name-base (buffer-file-name)))))))

;; (defun lichtblick-dbt-run-model ()
;;   "Run dbt with model from the current buffer"
;;   (interactive)

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command
;;      (format "dbt run --models %s"
;;              (shell-quote-argument (file-name-base (buffer-file-name)))))))

;; (defun lichtblick-dbt-run-models-lineage ()
;;   "Run dbt with the entire lineage from the current buffer (including the current one)"
;;   (interactive)

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command
;;      (format "dbt run --models +%s+"
;;              (shell-quote-argument (file-name-base (buffer-file-name)))))))

;; (defun lichtblick-dbt-test-model ()
;;   "Run all model tests for model defined by current buffer"
;;   (interactive)

;;   (let ((default-directory "~/code/lichtblick/cloud_dwh/dbt/"))
;;     (async-shell-command
;;      (format "dbt test --models %s"
;;              (shell-quote-argument (file-name-base (buffer-file-name)))))))

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
   "~/code/lichtblick/cloud_dwh/dbt/target/compiled/lb_dwh/"
   (concat (file-name-base (buffer-file-name)) ".sql")))

(defun connect-new-srv ()
  (interactive)
  (find-file "/ssh:stefan@janeway#4321:/home/stefan"))

(defun connect-rpi ()
  (interactive)
  (find-file "/ssh:stefan@raspberrypi:/home/stefan"))
