
  
    

        create or replace transient table DEMINIPROJECT.TRANSFORMED_DATAS.customer_revenue_summary
         as
        (WITH customers AS (
    SELECT 
    customer_id,
    
    regexp_replace(customername, '[^a-zA-Z0-9]', '')
 as customername
     FROM DEMINIPROJECT.TRANSFORMED_DATAS.customers_stg
),
transaction_cte AS (
    
    SELECT 
        customer_id,
        SUM(
    coalesce(revenue, 0)
) as total_revenue
    FROM DEMINIPROJECT.TRANSFORMED_DATAS.transaction_stg
    group by customer_id
),
country_cte AS (
    SELECT 
        customer_id,
        country,
        region
     FROM DEMINIPROJECT.TRANSFORMED_DATAS.country_region_stg
)
SELECT 
    c.customer_id,
    c.customername,
    r.region,
    r.country,
    t.total_revenue,
    DENSE_RANK() OVER(order by t.total_revenue desc) as RANKS
FROM customers c
inner JOIN transaction_cte t ON c.customer_id = t.customer_id
inner JOIN country_cte r ON c.customer_id = r.customer_id
        );
      
  