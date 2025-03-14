
  
    

        create or replace transient table DEMINIPROJECT.TRANSFORMED_DATAS.churned_new
         as
        (WITH customer_details AS (
    SELECT 
        customer_id,
        payment_month,
        MIN(payment_month) OVER (PARTITION BY customer_id) AS first_purchase,
        MAX(payment_month) OVER (PARTITION BY customer_id) AS last_purchase
    FROM DEMINIPROJECT.TRANSFORMED_DATAS.transaction_stg
)
SELECT 
    t.payment_month,
    MONTH(t.payment_month) as mon,
    COUNT(DISTINCT CASE WHEN c.first_purchase = t.payment_month THEN c.customer_id END) AS new_customers,
    COUNT(DISTINCT CASE WHEN c.last_purchase = t.payment_month THEN c.customer_id END) AS churned_customers
FROM DEMINIPROJECT.TRANSFORMED_DATAS.transaction_stg t
JOIN customer_details c ON t.customer_id = c.customer_id
GROUP BY t.payment_month
ORDER BY t.payment_month
        );
      
  