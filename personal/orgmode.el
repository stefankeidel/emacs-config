(require 'org)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-agenda-files (list "~/org/todo.org"
                             "~/org/notes.org"
                             "~/org/birthdays.org"
                             "~/org/reading.org"))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "PROGRESS(p)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING"))))

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

;; these tags are available everywhere, in addition to those per file
(setq org-tag-persistent-alist '(("@work" . ?w) ("@home" . ?h)))

(org-agenda-list)
