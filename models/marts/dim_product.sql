WITH
  clean_data AS (
    SELECT
      *
    FROM
      {{ref('int_online_retail') }}
  ),
  dim_product_nsk AS (
    SELECT
      DISTINCT stock_code,
      description
    FROM
      clean_data
  ),
  dim_product AS (
    SELECT
      ROW_NUMBER() OVER(
        ORDER BY
          stock_code
      ) AS product_key,
      stock_code,
      description
    FROM
      dim_product_nsk
  )
SELECT
  *
FROM
  dim_product
