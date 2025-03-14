
  
    

        create or replace transient table DEMINIPROJECT.TRANSFORMED_DATAS.customers_stg
         as
        (WITH customers AS(
    SELECT DISTINCT
       *
    FROM DEMINIPROJECT.DBO.CUSTOMERS
)
SELECT * FROM customers
        );
      
  