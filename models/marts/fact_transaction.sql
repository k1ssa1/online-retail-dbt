SELECT
    c.customer_key,
    p.product_key,
    d.date_key,
    t.invoice_id,
    t.quantity,
    t.unit_price,
    t.total_cost
    FROM {{ref('int_online_retail')}} t
    INNER JOIN dim_customer c ON c.customer_id = t.customer_id
    INNER JOIN dim_product p ON p.stock_code = t.stock_code
    INNER JOIN dim_date d ON d.invoice_date = t.invoice_date