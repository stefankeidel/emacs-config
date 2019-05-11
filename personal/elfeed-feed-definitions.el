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
        ("https://hnrss.org/frontpage" hn)
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCUHW94eEFW7hkUMVaZz4eDg" physics) ; minutephysics
        ("https://blog.cloudflare.com/rss/" blog security)

        ("https://events.ccc.de/feed/" events security)
        ("https://www.ccc.de/rss/updates.rdf" security)

                                        ; emacs
        ("https://asylum.madhouse-project.org/blog/atom.xml" emacs blog)
        ("http://www.masteringemacs.org/feed/" emacs blog)
        ("http://pragmaticemacs.com/feed/" emacs blog)
        ("https://emacsredux.com/atom.xml" emacs blog)

                                        ; entertainment
        ("https://www.xkcd.com/rss.xml" comic)

                                        ; travel
        ("https://www.awaywithmaja.com/feed" travel blog)

                                        ; bike stuff
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UC710HJmp-YgNbE5BnFBRoeg" bikes) ; gcn tech
        ("https://www.youtube.com/feeds/videos.xml?channel_id=UCuTaETsuCOkJ0H_GAztWt0Q" bikes) ; gcn
        ("http://bikesnobnyc.blogspot.com/feeds/posts/default" bikes blog)
        ("http://feeds.feedburner.com/inrng/inrng0" bikes)
        ("http://feeds.feedburner.com/redkiteprayer/krin" bikes)
        ;("http://www.reddit.com/r/bicycling/.rss" bikes)

                                        ; hard news
        ("http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" nyt news) ; very spammy, needs custom tag

        ))

(setq-default elfeed-search-filter "@2-weeks-ago +unread ")

(defface interesting-elfeed-entry
  '((t :foreground "#f77"))
  "interesting elfeed entry")

(push '(interesting interesting-elfeed-entry)
  elfeed-search-face-alist)

(define-key elfeed-show-mode-map "l"
  (lambda ()
    (interactive)
    (elfeed-link-title elfeed-show-entry)))

(elfeed)
