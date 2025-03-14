
  
    

        create or replace transient table DEMINIPROJECT.TRANSFORMED_DATAS.my_first_dbt_model
         as
        (WITH stores2 AS (
    SELECT 
        *
    FROM DEMINIPROJECT.DBO.COUNTRYREGION
)
SELECT * FROM stores2
        );
      
  