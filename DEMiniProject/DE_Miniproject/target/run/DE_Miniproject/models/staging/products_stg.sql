
  
    

        create or replace transient table DEMINIPROJECT.TRANSFORMED_DATAS.products_stg
         as
        (WITH products AS(
    SELECT DISTINCT
       *
    FROM DEMINIPROJECT.DBO.PRODUCTS
)
SELECT * FROM products
        );
      
  