

WITH customers AS (
    SELECT 
    customer_id,
    {{ remove_special_characters('customername') }} as customername
     FROM {{ref('customers_stg')}}
),
transaction_cte AS (
    
    SELECT 
        customer_id,
        SUM({{ change_nulls('revenue') }}) as total_revenue
    FROM {{ref('transaction_stg')}}
    group by customer_id
),
country_cte AS (
    SELECT 
        customer_id,
        country,
        region
     FROM {{ref('country_region_stg')}}
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
