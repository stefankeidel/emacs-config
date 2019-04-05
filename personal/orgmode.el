(require 'org)

(setq org-agenda-files (list "~/org/todo.org"
                             "~/org/notes.org"
                             "~/org/inbox.org"
                             "~/org/calendar.org"
                             "~/org/reading.org"))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "PROGRESS(p!)" "|" "DONE(d!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING(m)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "indian red" :weight bold)
              ("PROGRESS" :foreground "sky blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ;; For my reading list
              ("QUEUE" :foreground "LightSalmon1" :weight bold)
              ("STARTED" :foreground "PeachPuff2" :weight bold))))

(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@work" . ?w)
                            ("@home" . ?h)
                            (:endgroup)
                            ;; stakeholders
                            ("liz" . ?l)
                            ("max" . ?m)
                            ("finance" . ?f)
                            ("payment" . ?p)
                            ("chore" . ?c))))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/org/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("c" "Calendar" entry
                               (file+headline "~/org/calendar.org" "from template")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("~/org/todo.org" :maxlevel . 1)
                           ("~/org/calendar.org" :maxlevel . 1)
                           ("~/org/reading.org" :maxlevel . 1)))

;; one big archive for everything
(setq org-archive-location '"archive.org::")

(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-include-diary t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))


;; start emacs with todo list open
(find-file "~/org/todo.org")
(org-mode-restart)
(org-agenda-list)
