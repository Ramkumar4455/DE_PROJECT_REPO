WITH customers AS(
    SELECT DISTINCT
       *
    FROM {{source('Ronaldo','CUSTOMERS')}}
)
SELECT * FROM customers
