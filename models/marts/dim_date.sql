WITH
  clean_data AS (
    SELECT
      *
    FROM
      {{ref('int_online_retail') }}
  ),
  dim_date_nsk AS (
    SELECT
      DISTINCT invoice_date,
      EXTRACT(
        YEAR
        FROM
          invoice_date
      ) AS i_year,
      EXTRACT(
        MONTH
        FROM
          invoice_date
      ) AS i_month,
      EXTRACT(
        DAY
        FROM
          invoice_date
      ) AS i_day
    FROM
      clean_data
  ),
  dim_date AS (
    SELECT
      ROW_NUMBER() OVER (
        ORDER BY
          invoice_date
      ) AS date_key,
      invoice_date,
      i_year,
      i_month,
      i_day
    FROM
      dim_date_nsk
  )
SELECT
  *
FROM
  dim_date
