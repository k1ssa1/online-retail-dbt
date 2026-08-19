WITH staged_data AS (
    SELECT *
    FROM {{ ref('stg_online_retail') }}
),

format_validation AS (
    SELECT invoice_id, quantity, unit_price
    FROM staged_data
    WHERE NOT REGEXP_LIKE(invoice_id, '^(C|[0-9]).*')
        OR NOT REGEXP_LIKE(unit_price, '^-?[0-9]+(\.[0-9]+)?$')
        OR NOT REGEXP_LIKE(quantity, '^-?[0-9]+$')
)

SELECT *
FROM format_validation