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
        ("https://hnrss.org/frontpage" hn maybe) ; spammy custom tag
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCUHW94eEFW7hkUMVaZz4eDg" physics interesting) ; minutephysics
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCoxcjq-8xIDTYp3uz647V5A" interesting) ; numberphile
        ("https://datawhatnow.com/feed" blog interesting)
        ("https://plaintextproject.online/feed.xml" blog interesting)

        ("https://events.ccc.de/feed/" events security)
        ("https://www.ccc.de/rss/updates.rdf" security)

        ("https://protonmail.com/blog/feed/" security interesting)
        ("https://www.benkuhn.net/rss/" blog)
        ("https://metaredux.com/feed.xml" blog)
        ("https://github.blog/feed/atom" blog)
        ;("http://feeds.feedburner.com/marginalrevolution/feed" blog)

                                        ; emacs
        ("https://asylum.madhouse-project.org/blog/atom.xml" emacs blog)
        ("http://www.masteringemacs.org/feed/" emacs blog)
        ("http://pragmaticemacs.com/feed/" emacs blog)
        ("https://emacsredux.com/atom.xml" emacs blog)

                                        ; entertainment
        ("https://www.xkcd.com/rss.xml" comic)

                                        ; travel
        ("https://www.awaywithmaja.com/feed" travel blog)

                                        ;environment
        ("https://www.gatesnotes.com/RSS" environment blog)

                                        ; bike stuff
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC710HJmp-YgNbE5BnFBRoeg" bikes) ; gcn tech
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCuTaETsuCOkJ0H_GAztWt0Q" bikes) ; gcn
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCGamtiY212YK76rDI4IhCGg" bikes) ; cyclingabout
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCyG8fDB-wIkdjprZD-0TI6Q" bikes) ; bikepacking.com
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCp68_FLety0O-n9QU6phsgw" bikes) ; colinfurze
        ("http://feeds.feedburner.com/inrng/inrng0" bikes)
        ("http://feeds.feedburner.com/redkiteprayer/krin" bikes)
        ("https://bikepacking.com/feed/" bikes interesting)
        ("https://blog.komoot.com/feed" blog)

                                        ; trying to keep taps on work stuff
        ("https://meltano.com/blog/feed/" data blog)
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
