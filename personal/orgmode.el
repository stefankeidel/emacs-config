(require 'org)

(setq org-agenda-files (list "~/org/stefan.org"
                             "~/org/idagio.org"
                             "~/org/inbox.org"
                             "~/org/reading.org"
                             "~/org/journal.org"))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "SOMEDAY(s)" "PROGRESS(p!)" "|" "DONE(d!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING(m)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "indian red" :weight bold)
              ("SOMEDAY" :foreground "LightSalmon1" :weight bold)
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
                            ("@routine" . ?r)
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
                               (file+headline "~/org/inbox.org" "Calendar")
                               "* %i%? \n   %t")
                              ("s" "Standup" entry
                               (file+headline "~/org/idagio.org" "standups")
                               "** Standup %t\n*** yesterday\n-%?\n*** today\n-\n")
                              ("j" "Journal" entry
                               (file+headline "~/org/journal.org" "Journal")
                               "** Entry %t\n-%?\n")
                              ("r" "Reading List" entry
                               (file+headline "~/org/reading.org" "from template")
                               "** QUEUE %?")
                              ))

(setq org-refile-targets '(("~/org/stefan.org" :maxlevel . 2)
                           ("~/org/reading.org" :maxlevel . 1)
                           ("~/org/idagio.org" :maxlevel . 2)
                           ))

;; one big archive for everything [file-specific rules still apply and override]
(setq org-archive-location '"archive.org::")

(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-include-diary t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t) (ein . t)))

(add-to-list 'org-modules 'org-habit t)

(setq org-agenda-custom-commands
      '(("a" "Agenda and Work tasks"
         ((agenda "")
          (tags-todo "@work")
          (tags-todo "@home")
          ))
        ))


;; visual line mode for org
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (visual-line-mode t))
;;           t)

;start emacs with todo list open
;; (find-file "~/org/todo.org")
;; (org-mode-restart)
;; (org-agenda-list)
