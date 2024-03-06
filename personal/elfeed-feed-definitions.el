(require 'elfeed)

(defun elfeed-link-title (entry)
  "Copy the entry title and URL as org link to the clipboard."
  (interactive)
  (let* ((link (elfeed-entry-link entry))
         (title (elfeed-entry-title entry))
         (titlelink (concat "[[" link "][" title "]]")))
    (when titlelink
      (kill-new titlelink)
      (x-set-selection 'PRIMARY titlelink)
      (message "Yanked: %s" titlelink))))

(defun elfeed-show-link-title ()
"Copy the current entry title and URL as org link to the clipboard."
(interactive)
(elfeed-link-title elfeed-show-entry))

(defun elfeed-show-quick-url-note ()
  "Fastest way to capture entry link to org agenda from elfeed show mode"
  (interactive)
  (elfeed-link-title elfeed-show-entry)
  (org-capture nil "r")
  (yank)
  (org-capture-finalize))

(define-key elfeed-show-mode-map "l"
  (lambda ()
    (interactive)
    (elfeed-link-title elfeed-show-entry)))

(define-key elfeed-show-mode-map "v"
  (lambda ()
    (interactive)
    (elfeed-show-quick-url-note)))

(setq elfeed-feeds
      '(
        ; useful geek stuff
        ("http://nullprogram.com/feed/" programming)
        ("https://hnrss.org/frontpage" hn maybe) ; spammy custom tag for Hacker News
        
        ("https://events.ccc.de/feed/" events security)
        ("https://www.ccc.de/rss/updates.rdf" security)

        ("https://www.benkuhn.net/index.xml" blog)
        ("https://metaredux.com/feed.xml" blog interesting)
        ("https://github.blog/feed/atom" blog)
        ("https://blog.appliedcomputing.io/feed" blog)
        ("https://blog.openstreetmap.org/feed/" blog interesting)
        ("http://feeds.feedburner.com/martinkl" blog)

        ; econ and random stuff
        ("https://www.lesswrong.com/feed.xml?view=curated-rss" blog)
        ("https://feedpress.me/TheTechnium" blog)
        ("https://www.construction-physics.com/feed" blog)
        ("https://www.optimallyirrational.com/feed" blog)
        ("https://www.ribbonfarm.com/feed" blog)

        ; emacs
        ("https://asylum.madhouse-project.org/blog/atom.xml" emacs blog)
        ("http://www.masteringemacs.org/feed/" emacs blog)
        ("https://pragmaticemacs.wordpress.com/feed" emacs blog)
        ("https://emacsredux.com/atom.xml" emacs blog)

        ; entertainment
        ("https://www.xkcd.com/rss.xml" comic)

        ; bikes
        ("http://feeds.feedburner.com/inrng/inrng0" bikes)
        ("http://feeds.feedburner.com/redkiteprayer/krin" bikes)
        ("https://bikepacking.com/feed/" bikes interesting)
        ("https://fahrradzukunft.de/feed/" bikes)
        ("https://www.iamtedking.com/blog?format=rss" bikes interesting)
        ("https://www.renehersecycles.com/feed/" bikes interesting)

        ; trying to keep taps on work stuff
        ; ("https://meltano.com/blog/feed/" data blog) -- meltano feed is kaputt
        ("https://roundup.getdbt.com/feed" data blog)
        ("https://www.ssp.sh/index.xml" data blog)
        ("https://more-than-numbers.count.co/feed" blog)
        ("https://www.dataengineeringweekly.com/feed" blog)
        ("https://stkbailey.substack.com/feed" blog)
        ("https://seattledataguy.substack.com/feed" blog)
        ("https://martinfowler.com/feed.atom" blog)
        ))

(setq-default elfeed-search-filter "@2-weeks-ago +unread ")

(defface interesting-elfeed-entry
  '((t :foreground "#f77"))
  "interesting elfeed entry")

(defface maybe-elfeed-entry
  '((t :foreground "grey"))
  "maybe elfeed entry")

(push '(interesting interesting-elfeed-entry)
      elfeed-search-face-alist)

(push '(maybe maybe-elfeed-entry)
      elfeed-search-face-alist)

(define-key elfeed-show-mode-map "l"
  (lambda ()
    (interactive)
    (elfeed-link-title elfeed-show-entry)))

; (elfeed)
