(require 'org)

(setq org-agenda-files (list "~/org/stefan.org"
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
                            ("@routine" . ?t)
                            ("@bike" . ?b)
                            ("@reading" . ?r)
                            (:endgroup)
                            )))

(setq org-capture-templates '(
                              ("t" "Todo Lichtblick" entry
                               (file+headline "~/org/lichtblick.org" "Tasks")
                               "* TODO %i%?")
                              ("s" "Todo Stefan" entry
                               (file+headline "~/org/stefan.org" "tasks")
                               "* TODO %i%?")
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
 '((sql . t) (python . t) (ein . t) (http . t) (shell . t)))

(add-to-list 'org-modules 'org-habit t)

(setq org-agenda-custom-commands
      '(
        ("a" "Agenda and tasks"
         ((agenda "" ((org-agenda-span 7)))
          (tags-todo "@work")
          (tags-todo "@home")
          ;(tags-todo "@reading")        
          ))
        ("r" "Reading list"
         (
          (todo "STARTED")
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
  :custom
  (org-roam-directory (file-truename "~/org-roam/"))
  (org-roam-capture-templates
   '(
   ("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y-%m-%d--%H-%M-%S>-${slug}.org" "#+title: ${title}\n#+filetags:")
      :unnarrowed t)
   ("t" "ticket" plain
    "* https://lichtblick.atlassian.net/browse/${title}\n\n%?\n"
    :if-new (file+head "lichtblick-tickets/%<%Y-%m-%d--%H-%M-%S>-${slug}.org"
                       "#+title: ${title}\n#+FILETAGS: ticket:lichtblick"
                       )
    :unnarrowed t)
    )
   )
  :bind (;("s-b l" . org-roam-buffer-toggle)
         ("s-b f" . org-roam-node-find)
         ("s-b g" . org-roam-graph)
         ("s-b i" . org-roam-node-insert)
         ("s-b c" . org-roam-capture)
         ;; ;; Dailies
         ;("s-b j" . org-roam-dailies-capture-today)
         )
         
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:60}" 'face 'org-tag)))
  (setq org-roam-completion-everywhere t)
  (org-roam-db-autosync-mode))

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


;; (use-package ob-tmux
;;   ;; Install package automatically (optional)
;;   :ensure t
;;   :custom
;;   (org-babel-default-header-args:tmux
;;    '((:results . "silent")	;
;;      (:session . "default")	; The default tmux session to send code to
;;      (:socket  . nil)))		; The default tmux socket to communicate with
;;   ;; The tmux sessions are prefixed with the following string.
;;   ;; You can customize this if you like.
;;   (org-babel-tmux-session-prefix "ob-")
;;   ;; The terminal that will be used.
;;   ;; You can also customize the options passed to the terminal.
;;   ;; The default terminal is "gnome-terminal" with options "--".
;;   (org-babel-tmux-terminal "vterm")
;;   (org-babel-tmux-terminal-opts '("-T" "ob-tmux" "-e"))
;;   ;; Finally, if your tmux is not in your $PATH for whatever reason, you
;;   ;; may set the path to the tmux binary as follows:
;;   (org-babel-tmux-location "/opt/homebrew/bin/tmux"))

(defadvice org-babel-execute:sh (around sacha activate)
  (if (assoc-default :term (ad-get-arg 1) nil)
      (let ((buffer (make-term "babel" "/bin/zsh")))
        (with-current-buffer buffer
          (insert (org-babel-expand-body:generic
                   body params (org-babel-variable-assignments:sh params)))
          (term-send-input))
        (pop-to-buffer buffer))
    ad-do-it))
