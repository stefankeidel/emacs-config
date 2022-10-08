(setq ledger-reconcile-default-commodity "EUR")

(setq ledger-reports
      (quote
       (("bal" "ledger -f %(ledger-file) bal '^assets:comdirect|^assets:gls|^liabilities' --empty")
        ("budget" "ledger --monthly -S -T -f %(ledger-file) bal ^assets:budget --empty")
;        ("lastmonthbudget" "ledger --monthly -S -T -f %(ledger-file) bal ^assets:budget --period 'last month' --empty")
;        ("currentbudget" "ledger --monthly -S -T -f %(ledger-file) bal ^assets:budget --period 'this month' --empty")
        ("networth" "ledger --real -V --price-db market.db -f %(ledger-file) bal '^assets|^liabilities'")
        ("overtime" "ledger --real --market --price-db market.db -f %(ledger-file) reg '^assets|^liabilities' --collapse --monthly -O")
        )))


;;; Basic configuration
(require 'hledger-mode)

;; To open files with .journal extension in hledger-mode
(add-to-list 'auto-mode-alist '("\\.ledger\\'" . hledger-mode))

;; Provide the path to you journal file.
;; The default location is too opinionated.
(setq hledger-jfile "~/Cloud/ledger/stefan.ledger")


;;; Auto-completion for account names
;; For company-mode users,
(add-to-list 'company-backends 'hledger-company)


                                        ; for reporting

(setq hledger-ratios-liquid-asset-accounts "assets:gls")
