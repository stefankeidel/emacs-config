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
                              ;; ("t" "Todo Lichtblick" entry
                              ;;  (file+headline "~/org/lichtblick.org" "Tasks")
                              ;;  "* TODO %i%?")
                              ;; ("s" "Todo Stefan" entry
                              ;;  (file+headline "~/org/stefan.org" "tasks")
                              ;;  "* TODO %i%?")
                              ;; ("c" "Calendar" entry
                              ;;  (file+headline "~/org/stefan.org" "calendar")
                              ;;  "* %i%? \n   %t")
                              ;; ;; ("s" "Standup" entry
                              ;; ;;  (file+headline "~/org/idagio.org" "standups")
                              ;; ;;  "** Standup %t\n*** yesterday\n-%?\n*** today\n-\n")
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
 '((sql . t) (python . t) (ein . t) (http . t)))

(add-to-list 'org-modules 'org-habit t)

(setq org-agenda-custom-commands
      '(
        ;; ("a" "Agenda and tasks"
        ;;  ((agenda "" ((org-agenda-span 7)))
        ;;   (tags-todo "@work")
        ;;   (tags-todo "@home")
        ;;   ))
        ("a" "Reading list"
         (
          (todo "QUEUE")
          (todo "SAVED")
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

(add-hook 'org-mode-hook
          (lambda ()
            (electric-indent-local-mode -1))
          t)

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
             (org-roam-directory "~/org-roam/")
             :bind (:map org-roam-mode-map
                         (("s-b l" . org-roam)
                          ("s-b f" . org-roam-find-file)
                          ("s-b g" . org-roam-graph))
                         :map org-mode-map
                         (("s-b i" . org-roam-insert))
                         (("s-b I" . org-roam-insert-immediate))))

(setq org-roam-capture-templates '(
                              ("d" "default" plain (function org-roam--capture-get-point)
                               "%?"
                               :file-name "%(format-time-string \"%Y-%m-%d--%H-%M-%SZ--${slug}\" (current-time) t)"
                               :head "#+STARTUP: showeverything\n#+title: ${title}\n#+created: %u\n#+last_modified: %U\n#+roam_tags:"
                               :unnarrowed t)
                              ))

(setq system-time-locale (getenv "LANG"))

;(setq org-plantuml-jar-path (expand-file-name "/opt/plantuml.jar"))
;(setq plantuml-jar-path "/opt/plantuml.jar")
;(setq plantuml-default-exec-mode 'jar)


;; Open agenda vertically by default
(defadvice org-agenda (around split-vertically activate)
  (let (
        (split-width-threshold 40)    ; or whatever width makes sense for you
        (split-height-threshold nil)) ; but never horizontally
    ad-do-it))
