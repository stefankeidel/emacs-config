(setq ledger-reconcile-default-commodity "EUR")

(setq ledger-reports
      (quote
       (("register" "ledger ")
        ("bal" "ledger -f %(ledger-file) --price-db ./prices.db -V bal Assets Liabilities")
        ("bigbal" "ledger -f %(ledger-file) bal Assets Liabilities")
        ("reg" "ledger -f %(ledger-file) reg")
        ("payee" "ledger -f %(ledger-file) reg @%(payee)")
        ("account" "ledger -f %(ledger-file) reg %(account)"))))
