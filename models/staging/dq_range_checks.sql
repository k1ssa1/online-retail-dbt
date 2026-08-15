WITH raw_data AS (
    SELECT *
    FROM {{source('raw', 'invoices_raw_data')}}
),

validation AS(
    SELECT *
    FROM raw_data
    WHERE INVOICEDATE >= '2011-12-10'
        OR INVOICEDATE < '2010-12-01'
        OR UNITPRICE < 0
        OR QUANTITY < 0
)

SELECT *
FROM validation