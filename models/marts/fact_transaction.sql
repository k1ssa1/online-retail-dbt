SELECT
    ROW_NUMBER() OVER (
        ORDER BY t.invoice_id, t.stock_code, t.invoice_date
    ) AS transaction_key,
    c.customer_key,
    p.product_key,
    d.date_key,
    t.invoice_id,
    t.quantity,
    t.unit_price,
    t.total_cost,
    t.is_cancelled
    FROM {{ref('int_online_retail')}} t
    INNER JOIN {{ ref('dim_customer') }} c ON c.customer_id = t.customer_id
    INNER JOIN {{ ref('dim_product') }} p ON p.stock_code = t.stock_code
    INNER JOIN {{ ref('dim_date') }} d ON d.invoice_date = t.invoice_date