WITH products AS(
    SELECT DISTINCT
       *
    FROM {{source('Ronaldo','PRODUCTS')}}
)
SELECT * FROM products
