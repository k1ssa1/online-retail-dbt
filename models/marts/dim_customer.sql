WITH clean_data AS (
    SELECT
        *
    FROM {{ ref('int_online_retail') }}
),

customer_countries AS (
    SELECT
        customer_id,
        country,
        COUNT(*) AS country_count
    FROM clean_data
    GROUP BY
        customer_id,
        country
),

dim_customer_nsk AS (
    SELECT
        customer_id,
        country
    FROM customer_countries
    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY country_count DESC, country
    ) = 1
),

dim_customer AS (
    SELECT
        ROW_NUMBER() OVER (
            ORDER BY customer_id
        ) AS customer_key,
        customer_id,
        country
    FROM dim_customer_nsk
)

SELECT *
FROM dim_customer