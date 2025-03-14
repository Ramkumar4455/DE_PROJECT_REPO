
  
    

        create or replace transient table DEMINIPROJECT.TRANSFORMED_DATAS.country_region_stg
         as
        (WITH country_region AS(
    SELECT DISTINCT
       *
    FROM DEMINIPROJECT.DBO.COUNTRYREGION
)
SELECT * FROM country_region
        );
      
  