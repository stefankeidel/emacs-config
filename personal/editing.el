(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-stop-list (number-sequence 4 200 4))
(setq-default scroll-step 2)
(setq prelude-flyspell nil)
(setq prelude-guru nil)
(setq-default create-lockfiles nil)
(setq-default whitespace-line-column 120)


(defun my-indent ()
  (let ((last-indent (if (> (line-number-at-pos) 1)
                         (save-excursion
                           (previous-line)
                           (back-to-indentation)
                           (current-column))
                       0)))
    (save-excursion
      (back-to-indentation)
      (if (and (eq last-command this-command)
               (> (point) (line-beginning-position)))
          (delete-region (max (line-beginning-position) (- (point) 4)) (point))
        (while (< (current-column) (+ 4 last-indent))
          (insert " "))))
    (if (< (point) (save-excursion (back-to-indentation) (point)))
        (back-to-indentation))))


(defun my-sql-mode-hook ()
  (setq indent-line-function 'my-indent))

(add-hook 'sql-mode-hook 'my-sql-mode-hook)
