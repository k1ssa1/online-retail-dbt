WITH
  staged_data AS (
    SELECT
      *
    FROM
      {{ ref('stg_online_retail') }}
  ),
  clean_data AS (
    SELECT DISTINCT
      invoice_id,
      stock_code,
      COALESCE(description, 'Unknown') AS description,
      quantity,
      invoice_date,
      ABS(unit_price) AS unit_price,
      COALESCE(customer_id, 0) AS customer_id,
      COALESCE(country, 'Unknown') AS country,
      quantity * ABS(unit_price) AS total_cost,
      CASE
        WHEN invoice_id LIKE 'C%' THEN true
        ELSE false
      END AS is_cancelled
    FROM
      staged_data
    WHERE
      invoice_id NOT LIKE 'A%'
  )
SELECT
  *
FROM
  clean_data
