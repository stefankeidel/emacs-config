(require 'org)

(setq org-agenda-files (list "~/org/stefan.org"
                             "~/org/inbox.org"
                             "~/org/reading.org"
                             "~/org/lichtblick.org"))

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
              ("STARTED" :foreground "PeachPuff2" :weight bold)
              ("SAVED" :foreground "sky blue" :weight bold)
              )))

(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@work" . ?w)
                            ("@move" . ?m)
                            ("@home" . ?h)
                            ("@routine" . ?r)
                            ("@bike" . ?b)
                            (:endgroup)
                            )))

(setq org-capture-templates '(
                              ("t" "Todo [inbox]" entry
                               (file+headline "~/org/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("c" "Calendar" entry
                               (file+headline "~/org/stefan.org" "calendar")
                               "* %i%? \n   %t")
                              ;; ("s" "Standup" entry
                              ;;  (file+headline "~/org/idagio.org" "standups")
                              ;;  "** Standup %t\n*** yesterday\n-%?\n*** today\n-\n")
                              ("r" "Reading List" entry
                               (file+headline "~/org/reading.org" "from template")
                               "** QUEUE %?")
                              ))

(setq org-refile-targets '(("~/org/stefan.org" :maxlevel . 2)
                           ("~/org/reading.org" :maxlevel . 1)
                           ("~/org/lichtblick.org" :maxlevel . 2)
                           ))

;; one big archive for everything [file-specific rules still apply and override]
(setq org-archive-location '"archive.org::")

(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-include-diary t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t) (ein . t) (http . t)))

(add-to-list 'org-modules 'org-habit t)

(setq org-agenda-custom-commands
      '(("a" "Agenda and tasks"
         ((agenda "" ((org-agenda-span 7)))
          (tags-todo "@inbox")
          (tags-todo "@work")
          (tags-todo "@home")
          ))
        ("r" "Reading list"
         (
          (todo "QUEUE")
          (todo "SAVED")
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

(add-to-list 'org-latex-packages-alist '("" "listings" nil))
(setq org-latex-listings t)
(setq org-latex-listings-options '(("breaklines" "true")))

(use-package org-roam
  :ensure t
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/org-roam")
  :bind (:map org-roam-mode-map
              (("s-x l" . org-roam)
               ("s-x f" . org-roam-find-file)
               ("s-x g" . org-roam-graph))
              :map org-mode-map
              (("s-x i" . org-roam-insert))
              (("s-x I" . org-roam-insert-immediate))))

(add-hook 'after-init-hook 'org-roam-mode)
