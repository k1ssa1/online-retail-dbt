WITH clean_data AS (
    SELECT
        *
    FROM {{ ref('int_online_retail') }}
),

product_descriptions AS (
    SELECT
        stock_code,
        description,
        COUNT(*) AS description_count
    FROM clean_data
    WHERE stock_code IS NOT NULL
      AND description IS NOT NULL
    GROUP BY
        stock_code,
        description
),

dim_product_nsk AS (
    SELECT
        stock_code,
        description
    FROM product_descriptions
    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY stock_code
        ORDER BY description_count DESC
    ) = 1
),

dim_product AS (
    SELECT
        ROW_NUMBER() OVER (
            ORDER BY stock_code
        ) AS product_key,
        stock_code,
        description
    FROM dim_product_nsk
)

SELECT *
FROM dim_product