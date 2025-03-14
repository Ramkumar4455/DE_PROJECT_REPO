
  
    

        create or replace transient table DEMINIPROJECT.TRANSFORMED_DATAS.sales_summary
         as
        (SELECT 
    t.payment_month, 
    COUNT(DISTINCT t.customer_id) AS cross_sales
FROM DEMINIPROJECT.TRANSFORMED_DATAS.transaction_stg t
WHERE t.customer_id IN (
    SELECT f.customer_id
    FROM DEMINIPROJECT.TRANSFORMED_DATAS.transaction_stg f
    WHERE f.payment_month = t.payment_month
    GROUP BY f.customer_id, f.payment_month
    HAVING COUNT(f.product_id) > 1
)
GROUP BY t.payment_month
ORDER BY t.payment_month
        );
      
  