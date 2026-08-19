WITH staged_data AS (
    SELECT *
    FROM {{ ref('stg_online_retail') }}
),

range_validation AS(
    SELECT *
    FROM staged_data
    WHERE invoice_date >= '2011-12-10'
        OR invoice_date < '2010-12-01'
        OR unit_price < 0
        OR quantity < 0
)

SELECT *
FROM range_validation