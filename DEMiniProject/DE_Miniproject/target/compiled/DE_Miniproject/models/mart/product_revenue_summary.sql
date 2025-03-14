WITH products AS (
    SELECT 
        product_id,
        product_family,
        product_sub_family
    FROM DEMINIPROJECT.TRANSFORMED_DATAS.products_stg
),
transaction_cte AS (
    
    SELECT 
        product_id,
        SUM(
    coalesce(revenue, 0)
) OVER(PARTITION BY product_id)as total_revenue
    FROM DEMINIPROJECT.TRANSFORMED_DATAS.transaction_stg
)
SELECT 
    p.product_id,
    p.product_family,
    p.product_sub_family,
    t.total_revenue,
    DENSE_RANK() OVER(order by t.total_revenue desc) as RANKS
FROM products p
inner JOIN transaction_cte t ON p.product_id = t.product_id