SELECT 
    t.payment_month, 
    COUNT(DISTINCT t.customer_id) AS cross_sales
FROM {{ ref('transaction_stg') }} t
WHERE t.customer_id IN (
    SELECT f.customer_id
    FROM {{ ref('transaction_stg') }} f
    WHERE f.payment_month = t.payment_month
    GROUP BY f.customer_id, f.payment_month
    HAVING COUNT(DISTINCT f.product_id) > 1
)
GROUP BY t.payment_month
ORDER BY t.payment_month
 