SELECT
    CAST(INVOICENO AS VARCHAR) AS invoice_id,
    CAST(STOCKCODE AS VARCHAR) AS stock_code,
    CAST(DESCRIPTION AS VARCHAR) AS description,
    CAST(QUANTITY AS INTEGER) AS quantity,
    CAST(INVOICEDATE AS TIMESTAMP_NTZ) AS invoice_date,
    CAST(UNITPRICE AS NUMBER(10,2)) AS unit_price,
    CAST(CUSTOMERID AS INTEGER) AS customer_id,
    CAST(COUNTRY AS VARCHAR) AS country
FROM {{ source('raw', 'invoices_raw_data') }}