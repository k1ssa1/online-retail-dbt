WITH
  clean_data AS (
    SELECT
      *
    FROM
      {{ref('int_online_retail') }}
  ),
  dim_customer_nsk AS (
    SELECT
      DISTINCT customer_id,
      country
    FROM
      clean_data
  ),
  dim_customer AS (
    SELECT
      ROW_NUMBER() OVER (
        ORDER BY
          customer_id
      ) AS customer_key,
      customer_id,
      country
    FROM
      dim_customer_nsk
  )
SELECT
  *
FROM
  dim_customer
