(setq ledger-reconcile-default-commodity "EUR")

(setq ledger-reports
      (quote
       (("baldaily" "ledger -f %(ledger-file) bal '^assets:comdirect|^assets:gls|^liabilities' --empty")
        ("totalbudget" "ledger --monthly -S -T -f %(ledger-file) bal ^assets:budget --empty")
        ("lastmonthbudget" "ledger --monthly -S -T -f %(ledger-file) bal ^assets:budget --period 'last month' --empty")
        ("currentbudget" "ledger --monthly -S -T -f %(ledger-file) bal ^assets:budget --period 'this month' --empty")
        ("networth" "ledger --real -V --price-db market.db -f %(ledger-file) bal '^assets|^liabilities'")
        ("networthovertime" "ledger --real --market --price-db market.db -f %(ledger-file) reg '^assets|^liabilities' --collapse --monthly -O")
        )))
