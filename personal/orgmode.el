(require 'org)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-agenda-files (list "~/org/idagio.org"
                             "~/org/stefan.org"
                             "~/org/notes.org"
                             "~/org/birthdays.org"))

(org-agenda-list)
