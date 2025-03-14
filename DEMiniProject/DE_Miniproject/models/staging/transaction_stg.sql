WITH transactions AS(
    SELECT DISTINCT
       CUSTOMER_ID,
       PRODUCT_ID,
       COMPANIES,
       cast(payment_month as date) as payment_month,
       QUANTITY,
       REVENUE,
       REVENUE_TYPE,
       DIMENSION_1,
       DIMENSION_2,
       DIMENSION_3,
       DIMENSION_4,
       DIMENSION_5,
       DIMENSION_6,
       DIMENSION_7,
       DIMENSION_8,
       DIMENSION_9,
       DIMENSION_10,


    FROM {{source('Ronaldo','TRANSACTION')}}
)
SELECT * FROM transactions
