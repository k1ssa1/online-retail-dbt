SELECT INVOICENO, STOCKCODE, COUNT(*) AS occurrence_count
FROM {{source("raw", 'invoices_raw_data')}}
GROUP BY INVOICENO, STOCKCODE
HAVING COUNT(*) > 1

