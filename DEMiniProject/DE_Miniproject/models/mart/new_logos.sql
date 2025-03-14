WITH customer_details AS (
    SELECT 
        product_id,
        payment_month,
        MIN(payment_month) OVER (PARTITION BY customer_id) AS first_purchase
    FROM {{ ref('transaction_stg') }}
)
SELECT 
    t.product_id,
    COUNT(DISTINCT CASE WHEN c.first_purchase  BETWEEN 
    CONCAT(DATE_FORMAT(first_purchase , '%Y'), '-04-01') AND 
    CONCAT(DATE_FORMAT(DATE_ADD(first_purchase , INTERVAL 1 YEAR), '%Y'), '-03-31')  THEN c.customer_id END) AS new_customers
FROM {{ ref('transaction_stg') }} t
JOIN customer_details c ON t.product_id = c.product_id
GROUP BY t.product_id
ORDER BY t.product_id
 
